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
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.PriorityQueue;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        HttpSession s = request.getSession();
        PrintWriter pw = response.getWriter();
        String title = request.getParameter("title");
        String[] keywords = request.getParameterValues("keywords[]");
        String[] guides = request.getParameterValues("guides[]");
        HashMap<Integer, Integer> map = new HashMap<>();
        
        if (title != null && title.trim().length() > 0) {
            title = title.trim();
            String[] words = title.split("[ ]");

            for (String word : words) {
                word = word.trim().toLowerCase();

                if (word.length() > 0) {
                    ArrayList<Integer> projects = App.PROJECT_TITLE_DICT.get(word);

                    if (projects != null) {
                        for (int id : projects) {
                            if (map.containsKey(id)) {
                                map.put(id, map.get(id) + 1);
                            } else {
                                map.put(id, 1);
                            }
                        }
                    }
                }
            }
        }

        if (keywords != null) {
            for (String keywordId : keywords) {
                System.out.println("Keyword id = " + keywordId);
                ArrayList<Integer> projects = App.PROJECT_KEYWORDS_DICT.get(Integer.parseInt(keywordId));
                System.out.println("project ids for keywords = " + projects);
                if (projects != null) {
                    for (int id : projects) {
                        if (map.containsKey(id)) {
                            map.put(id, map.get(id) + 1);
                        } else {
                            map.put(id, 1);
                        }
                    }
                }
            }
        }
        
        if (guides != null) {
            for (String guide : guides) {
                int guideId = Integer.parseInt(guide);
                ArrayList<Integer> projects = App.PROJECT_GUIDE_DICT.get(guideId);
                
                if (projects != null) {
                    for (int id : projects) {
                        if (map.containsKey(id)) {
                            map.put(id, map.get(id) + 1);
                        } else {
                            map.put(id, 1);
                        }
                    }
                }
            }
        }
        
        if (map.isEmpty()) {
            pw.println("{\"fail\":\"No projects found.\"}");
            return;
        }

        PriorityQueue<MaxHeapNode> heap = new PriorityQueue<>();

        // total complexity of loop -> O(N log N)
        for (Integer id : map.keySet()) {
            heap.add(new MaxHeapNode(id, map.get(id)));
        }

        ArrayList<Project> results = new ArrayList<>();

        for (int i = 0; i < 15 && !heap.isEmpty(); ++i) {
            int id = heap.poll().num;

            try {
                Class.forName(App.DRIVER_CLASS);
                Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
                String query = "select project_date, title, guide_id, description, locked from projects where id = ?";
                PreparedStatement pst = con.prepareStatement(query);

                pst.setInt(1, id);

                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
                    String project_date = rs.getDate("project_date").toLocalDate().format(DateTimeFormatter.ofPattern("MMMM dd, uuuu"));
                    String guide = "NA";
                    
                    // Query for guide name
                    {
                        String guideQuery = "select name from guides where id = ?";
                        PreparedStatement guideStatement = con.prepareStatement(guideQuery);

                        guideStatement.setInt(1, rs.getInt("guide_id"));

                        ResultSet guideResultSet = guideStatement.executeQuery();

                        while (guideResultSet.next()) {
                            guide = guideResultSet.getString("name");
                        }

                        guideResultSet.close();
                        guideStatement.close();
                    }
                    
                    Project project = new Project(
                            project_date,
                            rs.getString("title"),
                            guide,
                            rs.getString("description"),
                            rs.getString("locked")
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
                    
                    // adding project id if it is the admin
                    if (s.getAttribute("admin") != null) {
                        project.id = id;
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
