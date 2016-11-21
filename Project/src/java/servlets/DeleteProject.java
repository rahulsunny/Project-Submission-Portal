/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.App;
import static classes.App.PROJECT_TITLE_DICT;
import static classes.App.PROJECT_GUIDE_DICT;
import static classes.App.PROJECT_KEYWORDS_DICT;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet(name = "DeleteProject", urlPatterns = {"/DeleteProject"})
public class DeleteProject extends HttpServlet {

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
            out.println("<title>Servlet DeleteProject</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteProject at " + request.getContextPath() + "</h1>");
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
        HttpSession s = request.getSession();

        if (s.getAttribute("admin") == null) {
            s.invalidate();
            response.sendRedirect("/Project/admin-login.html");
            return;
        }

        response.setContentType("text/plain");
        PrintWriter pw = response.getWriter();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            // get all the details of the project
            Class.forName(App.DRIVER_CLASS);
            Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
            String query = "select title, guide_id from projects where id = ?";
            PreparedStatement pst = con.prepareStatement(query);

            pst.setInt(1, id);

            ResultSet rs = pst.executeQuery();

            if (!rs.next()) {
                pw.println("No such project found.");
                return;
            }

            String title = rs.getString("title");
            int guideId = rs.getInt("guide_id");
            ArrayList<Integer> keywordIds = new ArrayList<>();
            // Query for project keywords
            {
                String keywordsQuery = "select keyword_id from project_keywords where project_id = ?";
                PreparedStatement keywordsStatement = con.prepareStatement(keywordsQuery);

                keywordsStatement.setInt(1, id);

                ResultSet keywordsResultSet = keywordsStatement.executeQuery();

                while (keywordsResultSet.next()) {
                    keywordIds.add(keywordsResultSet.getInt("keyword_id"));
                }

                keywordsResultSet.close();
                keywordsStatement.close();
            }

            rs.close();
            pst.close();

            // make changes to global data structures to remove this project from search
            PROJECT_GUIDE_DICT.get(guideId).remove(new Integer(id));

            for (int keywordId : keywordIds) {
                PROJECT_KEYWORDS_DICT.get(keywordId).remove(new Integer(id));
            }

            String[] words = title.split("[ ]");

            for (String word : words) {
                if (word.length() > 0) {
                    word = word.toLowerCase();

                    PROJECT_TITLE_DICT.get(word).remove(new Integer(id));
                }
            }
            
            pw.println("Project with title \"" + title + "\" successfully removed from search.");
            
            
            // check and delete if project has code
                // code
            
            // check and delete if project has ppt
                // code
            
            // check and delete if project has report
                // code
            
            pst = con.prepareStatement("delete from projects where id = ?");
            pst.setInt(1, id);
            
            if (pst.executeUpdate() == 1) {
                pw.println("Project with title \"" + title + "\" successfully removed from database.");
            } else {
                pw.println("Project with title \"" + title + "\" could not be removed from database. PreparedStatement.executeUpdate() returned 0");
            }
            
            pst.close();
            con.close();
        } catch (Exception ex) {
            System.out.println("Error in DeleteProject - " + ex.getMessage());
        }
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
