package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import classes.App;
import java.sql.*;

public final class search_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Search Projects | Project Sumbission Portal | IIITA</title>\n");
      out.write("        <!--Import Google Icon Font-->\n");
      out.write("        <link href=\"../fonts/iconfont/material-icons.css\" rel=\"stylesheet\"/>\n");
      out.write("        <!--Import materialize.css-->\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"../css/materialize.min.css\"  media=\"screen,projection\"/>\n");
      out.write("        <!--Let browser know website is optimized for mobile-->\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"\">\n");
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
      out.write("                <a href=\"submit-report.html\" class=\"waves-effect\">Submit Project Report</a>\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("                <a href=\"submit-ppt.html\" class=\"waves-effect\">Submit Project PPT</a>\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("                <a href=\"submit-code.html\" class=\"waves-effect\">Submit Project Code</a>\n");
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
      out.write("                        <li><a class=\"waves-effect\" href=\"#!\">Logout</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <br><br>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col l12\">\n");
      out.write("                    <a href=\"#\" data-activates=\"slide-out\" class=\"navbar-button waves-effect waves-light btn green\">Menu</a>\n");
      out.write("                    <a href=\"/Project/user/\" class=\"waves-effect waves-light btn green\">Current Semester Projects</a>\n");
      out.write("                    <a href=\"#\" class=\"waves-effect waves-light btn green darken-3\">Search Projects</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col s12\">\n");
      out.write("                    <div class=\"card\">\n");
      out.write("                        <div class=\"card-content\">\n");
      out.write("                            <form method=\"post\" action=\"/Project/Search\">\n");
      out.write("                                <p>\n");
      out.write("                                    <b>Note</b> - You can search for a previous project by project title or keywords or guide. You can search by\n");
      out.write("                                    all of them or none of them. If you choose no parameters, all the projects are displayed.\n");
      out.write("                                </p>\n");
      out.write("                                <br>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col s8\">\n");
      out.write("                                        <input id=\"title\" type=\"text\" name=\"title\" class=\"validate\">\n");
      out.write("                                        <label for=\"title\">Project Title</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col s12\">\n");
      out.write("                                        <select name=\"keywords\" name=\"keywords\" multiple>\n");
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
                                            
      out.write("\n");
      out.write("                                        </select>\n");
      out.write("                                        <h3>");
      out.print( ex.getMessage());
      out.write("</h3>\n");
      out.write("                                        ");

                                            }
                                        
      out.write("\n");
      out.write("                                        </select>\n");
      out.write("                                        <label>Select Project Keywords</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <button type=\"button\" class=\"waves-effect waves-light btn\" onclick=\"searchProjects\">Search Projects</button>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col l12\" id=\"results\">\n");
      out.write("                    <!-- Project results -->\n");
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
      out.write("\n");
      out.write("            // Init select form element\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $('select').material_select();\n");
      out.write("            });\n");
      out.write("\n");
      out.write("            function searchProjects() {\n");
      out.write("                $.post(\"/Project/Search\",\n");
      out.write("                        {\n");
      out.write("                            title: $('input[name=\"title\"]').val(),\n");
      out.write("                            keywords: $('select[name=\"keywords\"]').val()\n");
      out.write("                        }, searchProjectsCallback);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function searchProjectsCallback(data) {\n");
      out.write("                $('#results').empty();\n");
      out.write("                var json = jQuery.parseJSON(data);\n");
      out.write("                \n");
      out.write("                json.each(function(index) {\n");
      out.write("                    var html = \n");
      out.write("                    '<div class=\"card grey lighten-5\">' +\n");
      out.write("                        '<div class=\"card-content\">' +\n");
      out.write("                            '<span class=\"card-title\">' + json[index].title + '</span>' +\n");
      out.write("                            '<p>' + json[index].description + '</p>' +\n");
      out.write("                            '<br>' +\n");
      out.write("                            '<p>Project Group Members -</p>' +\n");
      out.write("                            '<ul>' +\n");
      out.write("                                '<li>Ojusvini Agarwal (RIT2013001)</li>' +\n");
      out.write("                                '<li>Saniya Nejeeb (RIT2013002)</li>' +\n");
      out.write("                                '<li>Shanmukh Dundigalla (RIT2013003)</li>' +\n");
      out.write("                            '</ul>' +\n");
      out.write("                            '<p>Project Guide - ' + json[index].guide + '</p><br>' +\n");
      out.write("                            '<a href=\"#\"><div class=\"chip\">Image Processing</div></a>' +\n");
      out.write("                            '<a href=\"#\"><div class=\"chip\">Algorithms</div></a>' +\n");
      out.write("                            '<a href=\"#\"><div class=\"chip\">Android Development</div></a>' +\n");
      out.write("                        '</div>' +\n");
      out.write("                        '<div class=\"card-action\">' +\n");
      out.write("                            '<a href=\"#\" class=\"waves-effect waves-d btn white black-text\">Download Project Report</a>' +\n");
      out.write("                            '<a href=\"#\" class=\"waves-effect waves-d btn white black-text\">Download PPT</a>' +\n");
      out.write("                            '<a href=\"#\" class=\"waves-effect waves-d btn white black-text\">Download Code</a>' +\n");
      out.write("                        '</div>' +\n");
      out.write("                    '</div>';\n");
      out.write("                });\n");
      out.write("            }\n");
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