/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.App;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
@WebServlet(name = "AddProject", urlPatterns = {"/AddProject"})
public class AddProject extends HttpServlet {

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
            out.println("<title>Servlet AddProject</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProject at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        response.setContentType("text/plain");
        PrintWriter pw = response.getWriter();
        HttpSession s = request.getSession();

        if (s.getAttribute("id") != null) {
            pw.println("You have already submitted details for your project.");
            return;
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int guide = Integer.parseInt(request.getParameter("guide"));
        String[] keywords = request.getParameterValues("keywords");

        if (keywords.length > 3) {
            pw.println("Too many keywords choosen.");
            return;
        }

        String password = request.getParameter("password");

        if (!password.equals(s.getAttribute("password"))) {
            pw.println("Please enter the correct password");
            return;
        }

        ArrayList<String> members = new ArrayList<>();

        for (int i = 1; i <= 5; ++i) {
            String roll = request.getParameter("member" + i).trim().toUpperCase();

            if (roll.length() >= App.ROLL_NUM_MIN_LENGTH && roll.length() <= App.ROLL_NUM_MAX_LENGTH) {
                members.add(roll);
            } else if (roll.length() == 0) {
                break;
            } else {
                pw.println("Enrollment Number " + roll + " rejected. Please contact admin if you feel this is incorrect.");
                return;
            }
        }

        if (members.isEmpty()) {
            pw.println("Please mention team members properly. Minimum 1 member.");
            return;
        }

        try {
            Class.forName(App.DRIVER_CLASS);
            Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select projects_id_seq.nextval from dual");
            rs.next();
            int id = rs.getInt(1);

            String query = "insert into projects values (?, TO_DATE(?, 'DD-MM-YY'), ?, ?, ?, 'N')";
            PreparedStatement pst = con.prepareStatement(query);
            LocalDate date = LocalDate.now();
            DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-uuuu");

            pst.setInt(1, id);
            pst.setString(2, date.format(format));
            pst.setString(3, title);
            pst.setInt(4, guide);
            pst.setString(5, description);

            int count = pst.executeUpdate();

            if (count != 1) {
                pw.println("Error occured please try later.");
                pst.close();
                con.close();
                return;
            }

            query = "insert into project_members values(?, ?)";
            pst = con.prepareStatement(query);

            for (String student : members) {
                pst.setInt(1, id);
                pst.setString(2, student);
                pst.addBatch();
            }

            int[] status = pst.executeBatch();

            for (int x : status) {
                if (x == PreparedStatement.EXECUTE_FAILED) {
                    pw.println("Unable to add members. Check details carefully.");
                    pst.close();
                    con.close();
                    return;
                }
            }

            query = "insert into project_keywords values(?, ?)";
            pst = con.prepareStatement(query);

            for (String keywordId : keywords) {
                pst.setInt(1, id);
                pst.setInt(2, Integer.parseInt(keywordId));
                pst.addBatch();
            }

            status = pst.executeBatch();

            for (int x : status) {
                if (x == PreparedStatement.EXECUTE_FAILED) {
                    pw.println("Unable to add members. Check details carefully.");
                    pst.close();
                    con.close();
                    return;
                }
            }

            s.setAttribute("id", id);   // adding project id to session
            // making adjustments to global data structures
            {
                String[] tokens = title.split("[ ]");

                for (String word : tokens) {
                    if (word.length() > 0) {
                        word = word.toLowerCase();

                        if (App.PROJECT_TITLE_DICT.containsKey(word)) {
                            ArrayList<Integer> arr = App.PROJECT_TITLE_DICT.get(word);

                            arr.add(id);
                        } else {
                            ArrayList<Integer> arr = new ArrayList<>();

                            arr.add(id);
                            App.PROJECT_TITLE_DICT.put(word, arr);
                        }
                    }
                }

                for (String keywordId : keywords) {
                    int keyId = Integer.parseInt(keywordId);
                    
                    if (App.PROJECT_KEYWORDS_DICT.containsKey(keyId)) {
                        ArrayList<Integer> arr = App.PROJECT_KEYWORDS_DICT.get(keyId);
                        
                        arr.add(id);
                    } else {
                        ArrayList<Integer> arr = new ArrayList<>();
                        
                        arr.add(id);
                        App.PROJECT_KEYWORDS_DICT.put(keyId, arr);
                    }
                }
                
                if (App.PROJECT_GUIDE_DICT.containsKey(guide)) {
                    App.PROJECT_GUIDE_DICT.get(guide).add(id);
                } else {
                    ArrayList<Integer> arr = new ArrayList<>();
                    
                    arr.add(id);
                    App.PROJECT_GUIDE_DICT.put(guide, arr);
                }
            }

            pst.close();
            con.close();
        } catch (Exception ex) {
            pw.println("Exception  - " + ex.getMessage());
        }

        response.sendRedirect("/Project/user/submit-details.jsp");
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
