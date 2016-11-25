<%@page import="classes.App, java.sql.*, java.time.*, java.time.format.*, java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Project Submission Portal | IIITA</title>
        <!--Import Google Icon Font-->
        <link href="../fonts/iconfont/material-icons.css" rel="stylesheet"/>
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="../css/global-styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- SideNav -->
        <ul id="slide-out" class="side-nav">
            <li>
                <div style="padding:20px;">
                    <img src="../img/iiita-logo.png" alt="IIITA Logo" class="responsive-img"/>
                </div>
            </li>
            <li>
                <a class="subheader">Submit</a>
            </li>
            <li>
                <a href="submit-details.jsp" class="waves-effect">Submit Project Details</a>
            </li>
            <li>
                <a href="submit-report.jsp" class="waves-effect">Submit Project Report</a>
            </li>
            <li>
                <a href="submit-ppt.jsp" class="waves-effect">Submit Project PPT</a>
            </li>
            <li>
                <a href="submit-code.jsp" class="waves-effect">Submit Project Code</a>
            </li>
        </ul>
        <%
            HttpSession s = request.getSession();
        %>
        <nav>
            <div class="nav-wrapper light-blue">
                <div class="container">
                    <a href="#!" class="brand-logo"><i class="material-icons">assignment</i>Project Submission Portal</a>
                    <ul class="right">
                        <li>Hi <%= s.getAttribute("name")%> ! &nbsp; </li>
                        <li><a href="#" data-activates="slide-out" class="navbar-button waves-effect"><i class="material-icons">view_module</i></a></li>
                        <li><a class="waves-effect" href="/Project/UserLogout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <br><br>
        <div class="container">
            <div class="row">
                <div class="col l12">
                    <a href="#" data-activates="slide-out" class="navbar-button waves-effect waves-light btn green">Menu</a>
                    <a href="#" class="waves-effect waves-light btn green darken-3">Current Semester Projects</a>
                    <a href="search.jsp" class="waves-effect waves-light btn green">Search Projects</a>
                </div>
            </div>
            <div class="row">
                <div class="col l12">
                    <%
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
                    %>
                    <div class="card grey lighten-5">
                        <div class="card-content">
                            <span class="card-title"><%= rs.getString("title")%></span><br>
                            <small><%= project_date%></small><br><br>
                            <p><%= rs.getString("description")%></p>
                            <br>
                            <p>Project Group Members -</p>
                            <ul>
                                <%
                                    {
                                        Statement membersStatement = con.createStatement();
                                        String membersQuery = "select students.roll_num, name from students "
                                                + "join project_members on students.ROLL_NUM = project_members.ROLL_NUM "
                                                + "where project_members.PROJECT_ID = " + rs.getString("id");

                                        ResultSet membersResultSet = membersStatement.executeQuery(membersQuery);

                                        while (membersResultSet.next()) {
                                %>
                                <li><%= membersResultSet.getString("name")%> (<%= membersResultSet.getString("roll_num")%>)</li>
                                    <%
                                            }

                                            membersResultSet.close();
                                            membersStatement.close();
                                        }
                                    %>
                            </ul>
                            <p>Project Guide - <%= rs.getString("name")%></p><br>
                            <%
                                {
                                    Statement keywordsStatement = con.createStatement();
                                    String keywordsQuery = "select keyword from keywords "
                                            + "join project_keywords on project_keywords.keyword_id = keywords.id "
                                            + "where project_keywords.project_id = " + rs.getString("id");
                                    ResultSet keywordsResultSet = keywordsStatement.executeQuery(keywordsQuery);

                                    while (keywordsResultSet.next()) {
                            %>
                            <a href="#"><div class="chip"><%= keywordsResultSet.getString("keyword")%></div></a>
                                <%
                                        }

                                        keywordsResultSet.close();
                                        keywordsStatement.close();
                                    }
                                %>
                        </div>
                        <div class="card-action">
                            <%
                                String location;
                                File file;

                                location = getServletContext().getRealPath("/") + "\\data\\reports\\" + rs.getString("id") + ".pdf";
                                file = new File(location);

                                if (file.exists()) {
                                    String relativeLocation = "../data/reports/" + rs.getString("id") + ".pdf";
                            %>
                            <a href="<%= relativeLocation%>" target="_tab" class="waves-effect waves-d btn white black-text">View Project Report</a> &nbsp; 
                            <%
                                }

                                location = getServletContext().getRealPath("/") + "\\data\\ppts\\" + rs.getString("id") + ".pdf";
                                file = new File(location);

                                if (file.exists()) {
                                    String relativeLocation = "../data/ppts/" + rs.getString("id") + ".pdf";
                            %>
                            <a href="<%= relativeLocation%>" target="_tab" class="waves-effect waves-d btn white black-text">View Project Presentation</a> &nbsp; 
                            <%
                                }

                                location = getServletContext().getRealPath("/") + "\\data\\codes\\" + rs.getString("id") + ".rar";
                                file = new File(location);

                                if (file.exists()) {
                                    String relativeLocation = "../data/codes/" + rs.getString("id") + ".rar";
                            %>
                            <a href="<%= relativeLocation%>" target="_tab" class="waves-effect waves-d btn white black-text">Download Source Code</a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <%
                        }

                        con.close();
                    } catch (Exception ex) {
                    %>
                    <p><%= ex.getMessage()%></p>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>

        <footer class="page-footer light-blue">
            <div class="container">
                <div class="row">
                    <div class="col l2">
                        <img src="../img/iiita-logo.png" alt="IIITA Logo" class="responsive-img"/>
                    </div>
                    <div class="col l8 offset-l1 white-text">
                        <br>
                        <h4>Indian Institute of Information Technology Allahabad</h4>
                        <p class="center-align">
                            Devghat, Jhalwa, Allahabad-211012, U. P. INDIA<br>
                            Phone: 91-532-2922000 &nbsp; &nbsp; Fax: 91-532-2922125, &nbsp; &nbsp; Email: contact@iiita.ac.in<br><br>
                            <a href="http://iiita.ac.in/contact" class="white-text">Contact</a> &nbsp; &nbsp; |
                            &nbsp; &nbsp; <a href="http://indem.iiita.ac.in/" class="white-text">INDEM</a> &nbsp; &nbsp; |
                            &nbsp; &nbsp; <a href="http://iiita.ac.in/rti" class="white-text">RTI</a> &nbsp; &nbsp; |
                            &nbsp; &nbsp; <a href="http://iiita.ac.in/disclaimer" class="white-text">Disclaimer</a> &nbsp; &nbsp; |
                            &nbsp; &nbsp; <a href="#" class="white-text">Developers</a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">© 2016 Copyright IIITA
                    <a class="grey-text text-lighten-4 right" href="#!">Project Submission Portal</a>
                </div>
            </div>
        </footer>

        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="../js/materialize.min.js"></script>
        <script>
            // Initialize collapse button
            $(".navbar-button").sideNav();
            // Initialize collapsible (uncomment the line below if you use the dropdown variation)
            //$('.collapsible').collapsible();
        </script>
    </body>
</html>
