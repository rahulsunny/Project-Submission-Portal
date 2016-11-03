package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import classes.App;

public final class submit_002dreport_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Submit Project Report | Project Submission Portal | IIITA</title>\n");
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
      out.write("                <a href=\"submit-details.jsp\" class=\"waves-effect\">Submit Project Details</a>\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("                <a href=\"#\" class=\"waves-effect grey lighten-3 grey lighten-3\">Submit Project Report</a>\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("                <a href=\"submit-ppt.jsp\" class=\"waves-effect\">Submit Project PPT</a>\n");
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
      out.write("                            <span class=\"card-title\">Project Report Submission Guide</span>\n");
      out.write("                            <p>\n");
      out.write("                                Please go through the instructions given below thoroughly before submitting the details of your project.\n");
      out.write("                            </p>\n");
      out.write("                            <ul class=\"browser-default\" style=\"margin-left: 15px;\">\n");
      out.write("                                <li>Project report is to be submitted at least 2 days prior to your end semester project evaluation.</li>\n");
      out.write("                                <li>You may be asked by the evaluation panel to download your submitted report to validate it.</li>\n");
      out.write("                                <li>Please submit the project strictly in <strong>PDF (Portable Document Format)</strong> only.</li>\n");
      out.write("                                <li>Please make sure the report you are submitting is final and no further changes are to be made.</li>\n");
      out.write("                                <li>In the unlikely case of the rejection of your report, please contact the admin immediately.</li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col l12\">\n");
      out.write("                    <div class=\"card\">\n");
      out.write("                        <div class=\"card-content\">\n");
      out.write("                            ");

                                String location = application.getRealPath("/") + "\\data\\reports\\" + s.getAttribute("id") + ".pdf";
                                File report = new File(location);

                                if (report.exists()) {
                                    String fileRelativeLocation = "../data/reports/" + s.getAttribute("id") + ".pdf";
                            
      out.write("\n");
      out.write("                            <span class=\"card-title\">Submit Project Report</span>\n");
      out.write("                            <p>You have already submitted a project report. You can view it below -</p><br>\n");
      out.write("                            <object data=\"");
      out.print( fileRelativeLocation);
      out.write("\" type=\"application/pdf\" width=\"100%\" height=\"800px\">\n");
      out.write("                                <p>Project Report</p>\n");
      out.write("                            </object>\n");
      out.write("                            ");

                            } else {
                            
      out.write("\n");
      out.write("                            <span class=\"card-title\">Submit Project Report</span>\n");
      out.write("                            <form action=\"/Project/UploadReport\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("                                <div class=\"file-field input-field\">\n");
      out.write("                                    <div class=\"btn\">\n");
      out.write("                                        <span>File</span>\n");
      out.write("                                        <input type=\"file\" name=\"file\" required=\"required\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"file-path-wrapper\">\n");
      out.write("                                        <input class=\"file-path validate\" type=\"text\">\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <p>\n");
      out.write("                                    <b>Note</b> - None of the above fields can be altered after submission. Please verify every field thoroughly before submission.\n");
      out.write("                                </p>\n");
      out.write("                                <br>\n");
      out.write("                                <p>\n");
      out.write("                                    <input type=\"checkbox\" id=\"verify\" />\n");
      out.write("                                    <label for=\"verify\">I have verified all the above fields to be true to the best of my knowledge.</label>\n");
      out.write("                                </p>\n");
      out.write("                                <br>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col m6\">\n");
      out.write("                                        <input id=\"password\" type=\"password\" class=\"validate\"/>\n");
      out.write("                                        <label for=\"password\">Re-enter password</label>\n");
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
      out.write("\n");
      out.write("\n");
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
