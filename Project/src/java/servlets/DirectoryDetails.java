/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DirectoryDetails", urlPatterns = {"/DirectoryDetails"})
public class DirectoryDetails extends HttpServlet {

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
            out.println("<title>Servlet DirectoryDetails</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DirectoryDetails at " + request.getContextPath() + "</h1>");
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
        HttpSession s = request.getSession();
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        if (s.getAttribute("id") != null) {
            // Use File.separator for system defaults
            String rootPath = getServletContext().getRealPath("/") + "/data/codes/" + s.getAttribute("id") + "/";
            String requestedPath = request.getParameter("path").trim();
            String complePath = rootPath + requestedPath;
            File directory = new File(complePath);
            File[] files = directory.listFiles();
            
            if (requestedPath.endsWith("../")) {
                requestedPath = requestedPath.substring(0, requestedPath.length() - 4);
                requestedPath = requestedPath.substring(0, requestedPath.lastIndexOf("/") + 1);
            }
            
            if (requestedPath.length() != 0) {
                pw.println("<a href=\"#\" onclick=\"getDirectoryDetails('" + requestedPath + "../')\" class=\"waves-effect btn code-btn waves-light\" style=\"margin-top: 5px;\">../</a><br>");
            }

            if (files.length > 0) {
                for (File file : files) {
                    if (file.isDirectory()) {
                        pw.println("<a href=\"#\" onclick=\"getDirectoryDetails('" + requestedPath + file.getName() + "/')\" class=\"waves-effect btn code-btn waves-light\" style=\"margin-top: 5px;\">/" + file.getName() + "</a><br>");
                    } else {
                        pw.println("<a target=\"_tab\" href=\"../data/codes/" + s.getAttribute("id") + "/" + requestedPath + file.getName() + "\" class=\"waves-effect btn code-btn white black-text\" style=\"margin-top: 5px;\">" + file.getName() + "</a><br>");
                    }
                }
            } else {
                pw.println("<br><p>It's all empty in here! Why not add some stuff?!</p>");
            }

        } else {
            // user doesn't have a project
            pw.println("<p>Please submit the basic project details first.</p>");
        }
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
        processRequest(request, response);
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
