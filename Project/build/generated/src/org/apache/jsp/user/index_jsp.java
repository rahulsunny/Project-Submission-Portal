package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import classes.App;
import java.sql.*;
import java.time.*;
import java.time.format.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Project Submission Portal | IIITA</title>\n");
      out.write("        <!--Import Google Icon Font-->\n");
      out.write("        <link href=\"../fonts/iconfont/material-icons.css\" rel=\"stylesheet\"/>\n");
      out.write("        <!--Import materialize.css-->\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"../css/materialize.min.css\"  media=\"screen,projection\"/>\n");
      out.write("        <!--Let browser know website is optimized for mobile-->\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- SideNav -->\n");
      out.write("        <ul id=\"slide-out\" class=\"side-nav\">\n");
      out.write("            <li>\n");
      out.write("                <div style=\"padding:20px;\">\n");
      out.write("                    <img src=\"../img/iiita-logo.png\" alt=\"IIITA Logo\" class=\"responsive-img\"/>\n");
      out.write("                </div>\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("                <a class=\"subheader\">Submit</a>\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("                <a href=\"submit-details.jsp\" class=\"waves-effect\">Submit Project Details</a>\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("                <a href=\"submit-report.jsp\" class=\"waves-effect\">Submit Project Report</a>\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("                <a href=\"submit-ppt.jsp\" class=\"waves-effect\">Submit Project PPT</a>\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("                <a href=\"submit-code.jsp\" class=\"waves-effect\">Submit Project Code</a>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("        ");

            HttpSession s = request.getSession();
        
      out.write("\n");
      out.write("        <nav>\n");
      out.write("            <div class=\"nav-wrapper light-blue\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <a href=\"#!\" class=\"brand-logo\"><i class=\"material-icons\">assignment</i>Project Submission Portal</a>\n");
      out.write("                    <ul class=\"right\">\n");
      out.write("                        <li>Hi ");
      out.print( s.getAttribute("name"));
      out.write(" ! &nbsp; </li>\n");
      out.write("                        <li><a href=\"#\" data-activates=\"slide-out\" class=\"navbar-button waves-effect\"><i class=\"material-icons\">view_module</i></a></li>\n");
      out.write("                        <li><a class=\"waves-effect\" href=\"/Project/UserLogout\">Logout</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <br><br>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col l12\">\n");
      out.write("                    <a href=\"#\" data-activates=\"slide-out\" class=\"navbar-button waves-effect waves-light btn green\">Menu</a>\n");
      out.write("                    <a href=\"#\" class=\"waves-effect waves-light btn green darken-3\">Current Semester Projects</a>\n");
      out.write("                    <a href=\"search.jsp\" class=\"waves-effect waves-light btn green\">Search Projects</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col l12\">\n");
      out.write("                    ");

                        try {
                            Class.forName(App.DRIVER_CLASS);
                            Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
                            Statement projectStatement = con.createStatement();

                            String query = "select projects.id, title, description, name, project_date"
                                    + " from projects join guides on projects.guide_id = guides.id"
                                    + " where projects.locked = 'N'";

                            ResultSet rs = projectStatement.executeQuery(query);

                            while (rs.next()) {
                                String project_date = rs.getDate("project_date").toLocalDate().format(DateTimeFormatter.ofPattern("MMMM dd, uuuu"));
                    
      out.write("\n");
      out.write("                    <div class=\"card grey lighten-5\">\n");
      out.write("                        <div class=\"card-content\">\n");
      out.write("                            <span class=\"card-title\">");
      out.print( rs.getString("title"));
      out.write("</span><br>\n");
      out.write("                            <small>");
      out.print( project_date );
      out.write("</small><br><br>\n");
      out.write("                            <p>");
      out.print( rs.getString("description"));
      out.write("</p>\n");
      out.write("                            <br>\n");
      out.write("                            <p>Project Group Members -</p>\n");
      out.write("                            <ul>\n");
      out.write("                                ");

                                    {
                                        Statement membersStatement = con.createStatement();
                                        String membersQuery = "select students.roll_num, name from students "
                                                + "join project_members on students.ROLL_NUM = project_members.ROLL_NUM "
                                                + "where project_members.PROJECT_ID = " + rs.getString("id");

                                        ResultSet membersResultSet = membersStatement.executeQuery(membersQuery);

                                        while (membersResultSet.next()) {
                                
      out.write("\n");
      out.write("                                <li>");
      out.print( membersResultSet.getString("name"));
      out.write(' ');
      out.write('(');
      out.print( membersResultSet.getString("roll_num"));
      out.write(")</li>\n");
      out.write("                                    ");

                                            }

                                            membersResultSet.close();
                                            membersStatement.close();
                                        }
                                    
      out.write("\n");
      out.write("                            </ul>\n");
      out.write("                            <p>Project Guide - ");
      out.print( rs.getString("name"));
      out.write("</p><br>\n");
      out.write("                            ");

                                {
                                    Statement keywordsStatement = con.createStatement();
                                    String keywordsQuery = "select keyword from keywords "
                                            + "join project_keywords on project_keywords.keyword_id = keywords.id "
                                            + "where project_keywords.project_id = " + rs.getString("id");
                                    ResultSet keywordsResultSet = keywordsStatement.executeQuery(keywordsQuery);

                                    while (keywordsResultSet.next()) {
                            
      out.write("\n");
      out.write("                            <a href=\"#\"><div class=\"chip\">");
      out.print( keywordsResultSet.getString("keyword"));
      out.write("</div></a>\n");
      out.write("                                ");

                                        }

                                        keywordsResultSet.close();
                                        keywordsStatement.close();
                                    }
                                
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"card-action\">\n");
      out.write("                            <a href=\"#\" class=\"waves-effect waves-d btn white black-text\">Download Project Report</a>\n");
      out.write("                            <a href=\"#\" class=\"waves-effect waves-d btn white black-text\">Download PPT</a>\n");
      out.write("                            <a href=\"#\" class=\"waves-effect waves-d btn white black-text\">Download Code</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        }

                        con.close();
                    } catch (Exception ex) {
                        
      out.write("\n");
      out.write("                        <p>");
      out.print( ex.getMessage() );
      out.write("</p>\n");
      out.write("                        ");

                    }
                    
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <footer class=\"page-footer light-blue\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col l2\">\n");
      out.write("                        <img src=\"../img/iiita-logo.png\" alt=\"IIITA Logo\" class=\"responsive-img\"/>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col l8 offset-l1 white-text\">\n");
      out.write("                        <br>\n");
      out.write("                        <h4>Indian Institute of Information Technology Allahabad</h4>\n");
      out.write("                        <p class=\"center-align\">\n");
      out.write("                            Devghat, Jhalwa, Allahabad-211012, U. P. INDIA<br>\n");
      out.write("                            Phone: 91-532-2922000 &nbsp; &nbsp; Fax: 91-532-2922125, &nbsp; &nbsp; Email: contact@iiita.ac.in<br><br>\n");
      out.write("                            <a href=\"http://iiita.ac.in/contact\" class=\"white-text\">Contact</a> &nbsp; &nbsp; |\n");
      out.write("                            &nbsp; &nbsp; <a href=\"http://indem.iiita.ac.in/\" class=\"white-text\">INDEM</a> &nbsp; &nbsp; |\n");
      out.write("                            &nbsp; &nbsp; <a href=\"http://iiita.ac.in/rti\" class=\"white-text\">RTI</a> &nbsp; &nbsp; |\n");
      out.write("                            &nbsp; &nbsp; <a href=\"http://iiita.ac.in/disclaimer\" class=\"white-text\">Disclaimer</a> &nbsp; &nbsp; |\n");
      out.write("                            &nbsp; &nbsp; <a href=\"#\" class=\"white-text\">Developers</a>\n");
      out.write("                        </p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"footer-copyright\">\n");
      out.write("                <div class=\"container\">© 2016 Copyright IIITA\n");
      out.write("                    <a class=\"grey-text text-lighten-4 right\" href=\"#!\">Project Submission Portal</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write("\n");
      out.write("        <!--Import jQuery before materialize.js-->\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/jquery-3.1.0.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/materialize.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            // Initialize collapse button\n");
      out.write("            $(\".navbar-button\").sideNav();\n");
      out.write("            // Initialize collapsible (uncomment the line below if you use the dropdown variation)\n");
      out.write("            //$('.collapsible').collapsible();\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
