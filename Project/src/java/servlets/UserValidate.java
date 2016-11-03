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
import java.time.LocalDate;
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
@WebServlet(name = "UserValidate", urlPatterns = {"/UserValidate"})
public class UserValidate extends HttpServlet {
    // code by Vamsi Sangam

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
            out.println("<title>Servlet UserValidate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserValidate at " + request.getContextPath() + "</h1>");
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
        String rollNum = request.getParameter("roll_num");
        String password = request.getParameter("password");
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
            PreparedStatement pst = con.prepareStatement("select name from students where roll_num = ? and password = ?");

            pst.setString(1, rollNum);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                HttpSession s = request.getSession();
                String name = rs.getString("name");
                String query = "select id, project_date from (\n"
                        + "  select id, project_date from \n"
                        + "  projects join project_members\n"
                        + "  on projects.id = project_members.project_id\n"
                        + "  where roll_num = ? order by project_date desc\n"
                        + " )\n"
                        + " where rownum = 1";
                
                pst = con.prepareStatement(query);
                pst.setString(1, rollNum);
                rs.close();
                
                rs = pst.executeQuery();
                
                if (rs.next()) {
                    int id = rs.getInt("id");
                    LocalDate date = rs.getDate("project_date").toLocalDate();
                    
                    if (date.isAfter(App.LOCK_DATE)) {
                        s.setAttribute("id", id);
                    }
                }

                s.setMaxInactiveInterval(5 * 60);   // 5 minutes
                s.setAttribute("name", name);
                s.setAttribute("rollNum", rollNum);
                response.sendRedirect("/Project/user/");
            } else {
                response.sendRedirect("/Project/");
            }
            
            rs.close();
            pst.close();
            con.close();
        } catch (Exception ex) {
            // Logger.getLogger(UserValidate.class.getName()).log(Level.SEVERE, null, ex);
            response.setContentType("text/plain");
            PrintWriter pw = response.getWriter();

            pw.println("Connection unsuccessful");
            pw.println(ex.getMessage());
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
