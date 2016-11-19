package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import classes.App;

public final class submit_002ddetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Submit Project Details | Project Submission Portal | IIITA</title>\n");
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
      out.write("                <a href=\"#\" class=\"waves-effect grey lighten-3\">Submit Project Details</a>\n");
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
      out.write("            <li><div class=\"divider\"></div></li>\n");
      out.write("            <li>\n");
      out.write("                <a class=\"subheader\">Evaluation</a>\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("                <a href=\"#\" class=\"waves-effect\">Present Project PPT</a>\n");
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
      out.write("\n");
      out.write("        <br><br>\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col l12\">\n");
      out.write("                    <a href=\"#\" data-activates=\"slide-out\" class=\"navbar-button waves-effect waves-light btn green\">Menu</a>\n");
      out.write("                    <a href=\"/Project/user/\" class=\"waves-effect waves-light btn green\">Back to Dashboard</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col l12\">\n");
      out.write("                    <div class=\"card\">\n");
      out.write("                        <div class=\"card-content\">\n");
      out.write("                            <span class=\"card-title\">Project Details Submission Guide</span>\n");
      out.write("                            <p>\n");
      out.write("                                Please go through the instructions given below thoroughly before submitting the details of your project.\n");
      out.write("                            </p>\n");
      out.write("                            <ul class=\"browser-default\" style=\"margin-left: 15px;\">\n");
      out.write("                                <li>Project details are to be filled after your project members are enrolled in the IIITA project portal.</li>\n");
      out.write("                                <li>Project details are to be filled after your project mentor accepts your project in the IIITA project portal.</li>\n");
      out.write("                                <li>Project details are to be filled after you have have decided the project and after thorough verification with your team members\n");
      out.write("                                    as the details cannot be edited later.</li>\n");
      out.write("                                <li>Please keep the project title short yet which describes your project in the best way possible.</li>\n");
      out.write("                                <li>Project keyword is the domain on which your project belongs to. Please choose a <b>maximum</b> of 3 keywords only.</li>\n");
      out.write("                                <li>In the unlikely case of a rejection of your project after evaluation, please contact the admin immediately.</li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col l12\">\n");
      out.write("                    <div class=\"card\">\n");
      out.write("                        <div class=\"card-content\">\n");
      out.write("                            <span class=\"card-title\">Submit Project Details</span>\n");
      out.write("                            ");

                                if (s.getAttribute("id") != null) {
                            
      out.write("\n");
      out.write("                            <p>You have already submitted the details for your project.</p>\n");
      out.write("                            ");

                            } else {
                            
      out.write("\n");
      out.write("                            <form method=\"post\" action=\"/Project/AddProject\">\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col s6\">\n");
      out.write("                                        <input placeholder=\"Enter your project title\" id=\"title\" name=\"title\" type=\"text\" class=\"validate\" required=\"required\">\n");
      out.write("                                        <label for=\"title\">Project Title</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col s12\">\n");
      out.write("                                        <textarea id=\"description\" name=\"description\" class=\"materialize-textarea\" placeholder=\"Describe your project in 10-15 lines. Not more than 1000 characters.\"  required=\"required\"></textarea>\n");
      out.write("                                        <label for=\"description\">Project Description</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col s12\">\n");
      out.write("                                        <select id=\"guide\" name=\"guide\" required=\"required\">\n");
      out.write("                                            <option disabled selected>Choose your guide</option>\n");
      out.write("                                            ");

                                                // generate guide options
                                                try {
                                                    Class.forName(App.DRIVER_CLASS);
                                                    Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
                                                    Statement st = con.createStatement();
                                                    ResultSet rs = st.executeQuery("select id, name from guides where available = 'Y' order by name");

                                                    while (rs.next()) {
                                                        int guideId = rs.getInt("id");
                                                        String name = rs.getString("name");

                                            
      out.write("\n");
      out.write("                                            <option value=\"");
      out.print( guideId);
      out.write('"');
      out.write('>');
      out.print( name);
      out.write("</option>\n");
      out.write("                                            ");

                                                    }

                                                    rs.close();
                                                    st.close();
                                                    con.close();
                                                } catch (Exception ex) {
                                                    // Log details
                                                }
                                            
      out.write("\n");
      out.write("                                        </select>\n");
      out.write("                                        <label for=\"guide\">Select Project Guide</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col s12\">\n");
      out.write("                                        <select name=\"keywords\" id=\"keywords\" multiple>\n");
      out.write("                                            <option value=\"\" disabled selected>Choose your option</option>\n");
      out.write("                                            ");

                                                try {
                                                    Class.forName(App.DRIVER_CLASS);
                                                    Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
                                                    Statement keywordsStatement = con.createStatement();
                                                    String keywordsQuery = "select * from keywords order by keyword";
                                                    ResultSet keywordsResultSet = keywordsStatement.executeQuery(keywordsQuery);

                                                    while (keywordsResultSet.next()) {
                                            
      out.write("\n");
      out.write("                                            <option value=\"");
      out.print( keywordsResultSet.getString("id"));
      out.write("\"> &nbsp; ");
      out.print( keywordsResultSet.getString("keyword"));
      out.write("</option>\n");
      out.write("                                            ");

                                                    }
                                                } catch (Exception ex) {
                                                    // Log details
                                                }
                                            
      out.write("\n");
      out.write("                                        </select>\n");
      out.write("                                        <label for=\"keywords\">Select Project Keywords</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <p>\n");
      out.write("                                    <b>Note</b> - Please enter your team members' enrollment numbers correctly in upper case (example, IIT2013001). If your team has less than 5 members leave the\n");
      out.write("                                    last fields empty. An empty field in between non-empty entries will lead to improper team formation. Please enter the information carefully.\n");
      out.write("                                </p>\n");
      out.write("                                <br>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col s6\">\n");
      out.write("                                        <input placeholder=\"Member Enrollment Number (In upper case)\" id=\"member1\" name=\"member1\" type=\"text\" class=\"validate\" required=\"required\" value=\"");
      out.print( s.getAttribute("rollNum"));
      out.write("\" >\n");
      out.write("                                        <label for=\"member1\">Team Member 1</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col s6\">\n");
      out.write("                                        <input placeholder=\"Member Enrollment Number (In upper case)\" id=\"member2\" name=\"member2\" type=\"text\" class=\"validate\">\n");
      out.write("                                        <label for=\"member2\">Team Member 2</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col s6\">\n");
      out.write("                                        <input placeholder=\"Member Enrollment Number (In upper case)\" id=\"member3\" name=\"member3\" type=\"text\" class=\"validate\">\n");
      out.write("                                        <label for=\"member3\">Team Member 3</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col s6\">\n");
      out.write("                                        <input placeholder=\"Member Enrollment Number (In upper case)\" id=\"member4\" name=\"member4\" type=\"text\" class=\"validate\">\n");
      out.write("                                        <label for=\"member4\">Team Member 4</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col s6\">\n");
      out.write("                                        <input placeholder=\"Member Enrollment Number (In upper case)\" id=\"member5\" name=\"member5\" type=\"text\" class=\"validate\">\n");
      out.write("                                        <label for=\"member5\">Team Member 5</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col m6\">\n");
      out.write("                                        <input id=\"password\" name=\"password\" type=\"password\" class=\"validate\"/>\n");
      out.write("                                        <label for=\"password\">Re-enter your password</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <button type=\"submit\" class=\"waves-effect waves-light btn\">Submit</button>\n");
      out.write("                            </form>\n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
      out.write("\n");
      out.write("            // initializing materialse tabs\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $('ul.tabs').tabs();\n");
      out.write("            });\n");
      out.write("\n");
      out.write("            // Init select form element\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $('select').material_select();\n");
      out.write("            });\n");
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
