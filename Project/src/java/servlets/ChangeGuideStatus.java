/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import static classes.App.CONNECTION_PASSWORD;
import static classes.App.CONNECTION_STRING;
import static classes.App.CONNECTION_USERNAME;
import static classes.App.DRIVER_CLASS;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
@WebServlet(name = "ChangeGuideStatus", urlPatterns = {"/ChangeGuideStatus"})
public class ChangeGuideStatus extends HttpServlet {

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
            out.println("<title>Servlet ChangeGuideStatus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeGuideStatus at " + request.getContextPath() + "</h1>");
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
            String available = request.getParameter("available");
            Class.forName(DRIVER_CLASS);
            Connection con = DriverManager.getConnection(CONNECTION_STRING, CONNECTION_USERNAME, CONNECTION_PASSWORD);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select name, available from guides where id = " + id);
            String name = "";
            
            if (rs.next()) {
                if (rs.getString("available").equals("Y") && available.equals("true")) {
                    pw.println(rs.getString("name") + " is already available.");
                    rs.close();
                    con.close();
                    return;
                } else if (rs.getString("available").equals("N") && available.equals("false")) {
                    pw.println( rs.getString("name") + " is already not available.");
                    rs.close();
                    con.close();
                    return;
                }
                
                name = rs.getString("name");
            }

            PreparedStatement pst = con.prepareStatement("update guides set available = ? where id = ?");
            String message;

            if (available != null && available.equals("true")) {
                pst.setString(1, "Y");
                message = name + "'s availability changed to YES.";
            } else {
                pst.setString(1, "N");
                message = name + "'s availability changed to NO.";
            }

            pst.setInt(2, id);

            if (pst.executeUpdate() == 1) {
                pw.println(message);
            } else {
                pw.println("Unsuccessful. Could not update status.");
            }
            
            pst.close();
            con.close();
        } catch (Exception ex) {
            pw.println("Unsuccessful. Exception - " + ex.getMessage());
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
