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
@WebServlet(name = "AddKeyword", urlPatterns = {"/AddKeyword"})
public class AddKeyword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddKeyword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddKeyword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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

        //Taking Input of Keyword
        String word = request.getParameter("Addkeyword").trim();
        //if Sting is empty
        if ("".equals(word)) {
            pw.println("No keyword Entered");
            return;
        }

        try {
            Class.forName(App.DRIVER_CLASS);
            Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
            Statement st = con.createStatement();

            // select next ID in the Database
            ResultSet rs = st.executeQuery("select keywords_id_seq.nextval from dual");
            rs.next();
            int id = rs.getInt(1);
            //Insert the new Keyword
            String query = "insert into keywords values (?, ?)";
            PreparedStatement pst = con.prepareStatement(query);

            pst.setInt(1, id);
            pst.setString(2, word);

            int count = pst.executeUpdate();
            pw.println("Keyword inserted Successfully " + count);
            if (count != 1) {
                pw.println("Error occured please try later.");
                pst.close();
                con.close();
                return;
            }

            pw.close();
            pst.close();
            con.close();

        } catch (Exception ex) {
            System.out.println("Error in Adding Keyword - " + ex.getMessage());
        }

        response.sendRedirect("/Project/admin/add-keyword.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
