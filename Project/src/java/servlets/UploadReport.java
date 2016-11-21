/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.App;
import static classes.App.CONNECTION_PASSWORD;
import static classes.App.CONNECTION_STRING;
import static classes.App.CONNECTION_USERNAME;
import static classes.App.DRIVER_CLASS;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Vamsi
 */
@WebServlet(name = "UploadReport", urlPatterns = {"/UploadReport"})
public class UploadReport extends HttpServlet {

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
            out.println("<title>Servlet UploadReport</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadReport at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter pw = response.getWriter();
        HttpSession s = request.getSession();

        if (s.getAttribute("id") == null) {
            // no project at all
            pw.println("Please create a project for the current semester.");
            return;
        } else if (s.getAttribute("password") == null) {
            pw.println("Please login first.");
            return;
        }
        
        String password = request.getParameter("password");
        
        if (password == null || !password.equals(s.getAttribute("password").toString())) {
            pw.println("Password mismatch! You have been logged out for security reasons.");
            s.invalidate();
            return;
        }

        String location = getServletContext().getRealPath("/") + "\\data\\reports\\" + s.getAttribute("id") + ".pdf";
        File report = new File(location);

        if (report.exists()) {
            pw.println("You have already submitted the report.");
            return;
        }
        
        // occurs when project is deleted
        try {
            Class.forName(DRIVER_CLASS);
            Connection con = DriverManager.getConnection(CONNECTION_STRING, CONNECTION_USERNAME, CONNECTION_PASSWORD);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select locked from projects where id = " + s.getAttribute("id"));
            
            if (rs.next()) {
                // lock check
            } else {
                s.removeAttribute("id");
                pw.println("Your project seems to be deleted. Please contact the administrator if this is inappropriate. Please go back and refresh.");
                return;
            }
        } catch (Exception ex) {
            System.out.println("Error in UploadReport.java - " + ex.getMessage());
            pw.println("And error occured. Please go back and try again.");
            return;
        }

        String path = getServletContext().getRealPath("/") + "\\data\\reports";
        Part filePart = request.getPart("file");
        String fileName = s.getAttribute("id") + ".pdf";

        if (App.uploadFile(path, filePart, fileName)) {
            pw.println("File upload successfull. Please go back and refresh the page.");
        } else {
            pw.println("And error has occurred. Please try again after sometime.");
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
