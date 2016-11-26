package servlets;

import classes.App;
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
 * @author rahul sunny
 */
@WebServlet(name = "EditKeyWord", urlPatterns = {"/EditKeyWord"})
public class EditKeyWord extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditKeyWord</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditKeyWord at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // DoGet Method
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    //DoPost Method
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        PrintWriter pw = response.getWriter();
        HttpSession s = request.getSession();

        //admin validation
        if (s.getAttribute("admin") == null) {
            s.invalidate();
            response.sendRedirect("/Project/admin-login.html");
            return;
        }

        String Nword = request.getParameter("EdikeywordN").trim();

        //checking if new word is empty
        if ("".equals(Nword)) {
            pw.println("Please Enter the new word");
            return;
        }

        try {
            Class.forName(App.DRIVER_CLASS);
            Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
            Statement st = con.createStatement();

            // Check if new word is already present in the database
            String query = "select keyword from keywords where keyword = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, Nword);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String wd = rs.getString(1);
                pw.println("Entered new keyword " + wd + " already present in Database");
                pst.close();
                con.close();
                return;
            } else {
                pst.clearParameters();

                //Get the Old word using the ID
                int id = Integer.parseInt(request.getParameter("EdikeywordO"));
                query = "select keyword from keywords where id = ?";
                pst = con.prepareStatement(query);
                pst.setInt(1, id);
                rs = pst.executeQuery();
                rs.next();
                String Oword = rs.getString(1);

                // Update the Old keyword with the new Keyword
                pst.clearParameters();
                query = "update keywords set keyword = ? where keyword = ?";
                pst = con.prepareStatement(query);
                pst.setString(1, Nword);
                pst.setString(2, Oword);

                int count = pst.executeUpdate();

                // if executeUpdate fails print error
                if (count != 1) {
                    pw.println("Keyword Not found in DataBase Try again");
                    pst.close();
                    con.close();
                    return;
                }

                //if successfully updated send response
                pw.println("Keyword Successfully Edited");

                pw.close();
                pst.close();
                con.close();
            }

        } catch (Exception ex) {
            System.out.println("Error in Adding Keyword - " + ex.getMessage());
        }
        response.sendRedirect("/Project/admin/edit-keyword.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
