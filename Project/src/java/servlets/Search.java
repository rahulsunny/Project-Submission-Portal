/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.App;
import classes.Project;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.PriorityQueue;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vamsi
 */
@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class Search extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Search</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Search at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        doPost(request, response);  // reomve this and uncomment above line in production phase
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();

        String title = request.getParameter("title");
        String[] keywords = request.getParameterValues("keywords");
        String[] words = title.split("[ ]");

        HashMap<Integer, Integer> map = new HashMap<>();

        for (String word : words) {
            if (word.length() > 0) {
                ArrayList<Integer> ids = App.TITLE_WORDS_TRIE.wordQuery(word);

                for (int id : ids) {
                    if (map.get(id) == null) {
                        map.put(id, 1);
                    } else {
                        map.put(id, map.get(id) + 1);
                    }
                }
            }
        }

        PriorityQueue<MaxHeapNode> heap = new PriorityQueue<>();

        // total complexity of loop -> O(N log N)
        for (Integer id : map.keySet()) {
            heap.add(new MaxHeapNode(id, map.get(id)));
        }

        ArrayList<Project> results = new ArrayList<>();

        for (int i = 0; i < 10 && !heap.isEmpty(); ++i) {
            int id = heap.poll().num;

            try {
                Class.forName(App.DRIVER_CLASS);
                Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
                String query = "select to_char(project_date, 'YYYY') as year, to_char(project_date, 'MM') as month, title, guide, description, report, ppt, code_directory from projects where id = ?";
                PreparedStatement pst = con.prepareStatement(query);

                pst.setInt(1, id);

                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
                    String project_date;
                    int month = Integer.parseInt(rs.getString("month"));

                    if (month <= 6) {
                        project_date = "Even Semester - ";
                    } else {
                        project_date = "Odd Semester - ";
                    }

                    project_date += rs.getString("year");

                    Project project = new Project(
                            project_date,
                            rs.getString("title"),
                            rs.getString("guide"),
                            rs.getString("description"),
                            rs.getString("report"),
                            rs.getString("ppt"),
                            rs.getString("code_directory")
                    );

                    // Query for project members
                    {
                        String membersQuery = "select name, students.roll_num from project_members join students on students.roll_num = project_members.roll_num where project_id = ?";
                        PreparedStatement membersStatement = con.prepareStatement(membersQuery);

                        membersStatement.setInt(1, id);

                        ResultSet membersResultSet = membersStatement.executeQuery();

                        while (membersResultSet.next()) {
                            project.memberNames.add(membersResultSet.getString("name"));
                            project.memberRollNumbers.add(membersResultSet.getString("roll_num"));
                        }
                        
                        membersResultSet.close();
                        membersStatement.close();
                    }

                    // Query for project keywords
                    {
                        String keywordsQuery = "select keyword from project_keywords join keywords on project_keywords.keyword_id = keywords.id where project_id = ?";
                        PreparedStatement keywordsStatement = con.prepareStatement(keywordsQuery);

                        keywordsStatement.setInt(1, id);

                        ResultSet keywordsResultSet = keywordsStatement.executeQuery();

                        while (keywordsResultSet.next()) {
                            project.keywords.add(keywordsResultSet.getString("keyword"));
                        }
                        
                        keywordsResultSet.close();
                        keywordsStatement.close();
                    }
                    
                    results.add(project);
                }

                rs.close();
                pst.close();
                con.close();
            } catch (Exception ex) {
                pw.println("Exception - " + ex.getMessage());
                ex.printStackTrace();
            }
        }

        Gson gson = new Gson();

        pw.println(gson.toJson(results));
    }

    private String arrayToCustomString(String[] arr) {
        StringBuilder output = new StringBuilder(" (");

        for (int i = 0; i < arr.length; ++i) {
            if (i + 1 == arr.length) {
                output.append("'").append(arr[i]).append("') ");
            } else {
                output.append("'").append(arr[i]).append("', ");
            }
        }

        return output.toString();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

class MaxHeapNode implements Comparable<MaxHeapNode> {

    int num;
    int freq;

    public MaxHeapNode(int num, int freq) {
        this.num = num;
        this.freq = freq;
    }

    @Override
    public int compareTo(MaxHeapNode o) {
        return o.freq - this.freq;
    }

    @Override
    public String toString() {
        return "UtilMax{" + "num=" + num + ", freq=" + freq + '}';
    }

}