<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.sql.*, classes.App, java.time.format.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Submit Project Details | Project Submission Portal | IIITA</title>
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
                <a href="#" class="waves-effect grey lighten-3">Submit Project Details</a>
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
                    <a href="/Project/user/" class="waves-effect waves-light btn green">Back to Dashboard</a>
                </div>
            </div>

        </div>
        <div class="container">
            <div class="row">
                <div class="col l12">
                    <div class="card">
                        <div class="card-content">
                            <span class="card-title">Project Details Submission Guide</span>
                            <p>
                                Please go through the instructions given below thoroughly before submitting the details of your project.
                            </p>
                            <ul class="browser-default" style="margin-left: 15px;">
                                <li>Project details are to be filled after your project members are enrolled in the IIITA project portal.</li>
                                <li>Project details are to be filled after your project mentor accepts your project in the IIITA project portal.</li>
                                <li>Project details are to be filled after you have have decided the project and after thorough verification with your team members
                                    as the details cannot be edited later.</li>
                                <li>Please keep the project title short yet which describes your project in the best way possible.</li>
                                <li>Project keyword is the domain on which your project belongs to. Please choose a <b>maximum</b> of 3 keywords only.</li>
                                <li>In the unlikely case of a rejection of your project after evaluation, please contact the admin immediately.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col l12">
                    <%
                        if (s.getAttribute("id") != null) {
                            try {
                                Class.forName(App.DRIVER_CLASS);
                                Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
                                Statement projectStatement = con.createStatement();

                                String query = "select projects.id, title, description, name, project_date"
                                        + " from projects join guides on projects.guide_id = guides.id"
                                        + " where projects.id = " + s.getAttribute("id").toString();

                                ResultSet rs = projectStatement.executeQuery(query);

                                if (rs.next()) {
                                    String project_date = rs.getDate("project_date").toLocalDate().format(DateTimeFormatter.ofPattern("MMMM dd, uuuu"));
                    %>
                    <div class="card">
                        <div class="card-content">
                            <p>You have already submitted your project details. You can view the details below.</p>
                        </div>
                    </div>
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
                    } else {
                        s.removeAttribute("id");
                    %>
                    <div class="card">
                        <div class="card-content">
                            <p>
                                Uh oh! Your project seems to be deleted by the administrator! Please contact the portal administrator if you feel this
                                is inappropriate. Refresh the page to create a new project.
                            </p>
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
                    } else {
                    %>
                    <div class="card">
                        <div class="card-content">
                            <span class="card-title">Submit Project Details</span>
                            <form method="post" action="/Project/AddProject">
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input placeholder="Enter your project title" id="title" name="title" type="text" class="validate" required="required">
                                        <label for="title">Project Title</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea id="description" name="description" class="materialize-textarea" placeholder="Describe your project in 10-15 lines. Not more than 1000 characters."  required="required"></textarea>
                                        <label for="description">Project Description</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <select id="guide" name="guide" required="required">
                                            <option disabled selected>Choose your guide</option>
                                            <%
                                                // generate guide options
                                                try {
                                                    Class.forName(App.DRIVER_CLASS);
                                                    Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
                                                    Statement st = con.createStatement();
                                                    ResultSet rs = st.executeQuery("select id, name from guides where available = 'Y' order by name");

                                                    while (rs.next()) {
                                                        int guideId = rs.getInt("id");
                                                        String name = rs.getString("name");

                                            %>
                                            <option value="<%= guideId%>"><%= name%></option>
                                            <%
                                                    }

                                                    rs.close();
                                                    st.close();
                                                    con.close();
                                                } catch (Exception ex) {
                                                    // Log details
                                                }
                                            %>
                                        </select>
                                        <label for="guide">Select Project Guide</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <select name="keywords" id="keywords" multiple>
                                            <option value="" disabled selected>Choose your option</option>
                                            <%
                                                try {
                                                    Class.forName(App.DRIVER_CLASS);
                                                    Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
                                                    Statement keywordsStatement = con.createStatement();
                                                    String keywordsQuery = "select * from keywords order by keyword";
                                                    ResultSet keywordsResultSet = keywordsStatement.executeQuery(keywordsQuery);

                                                    while (keywordsResultSet.next()) {
                                            %>
                                            <option value="<%= keywordsResultSet.getString("id")%>"> &nbsp; <%= keywordsResultSet.getString("keyword")%></option>
                                            <%
                                                    }
                                                } catch (Exception ex) {
                                                    // Log details
                                                }
                                            %>
                                        </select>
                                        <label for="keywords">Select Project Keywords</label>
                                    </div>
                                </div>
                                <p>
                                    <b>Note</b> - Please enter your team members' enrollment numbers correctly in upper case (example, IIT2013001). If your team has less than 5 members leave the
                                    last fields empty. An empty field in between non-empty entries will lead to improper team formation. Please enter the information carefully.
                                </p>
                                <br>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input placeholder="Member Enrollment Number (In upper case)" id="member1" name="member1" type="text" class="validate" required="required" value="<%= s.getAttribute("rollNum")%>" >
                                        <label for="member1">Team Member 1</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input placeholder="Member Enrollment Number (In upper case)" id="member2" name="member2" type="text" class="validate">
                                        <label for="member2">Team Member 2</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input placeholder="Member Enrollment Number (In upper case)" id="member3" name="member3" type="text" class="validate">
                                        <label for="member3">Team Member 3</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input placeholder="Member Enrollment Number (In upper case)" id="member4" name="member4" type="text" class="validate">
                                        <label for="member4">Team Member 4</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input placeholder="Member Enrollment Number (In upper case)" id="member5" name="member5" type="text" class="validate">
                                        <label for="member5">Team Member 5</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col m6">
                                        <input id="password" name="password" type="password" class="validate"/>
                                        <label for="password">Re-enter your password</label>
                                    </div>
                                </div>
                                <button type="submit" class="waves-effect waves-light btn">Submit</button>
                            </form>
                            <%
                                }
                            %>
                        </div>
                    </div>
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

            // initializing materialse tabs
            $(document).ready(function () {
                $('ul.tabs').tabs();
            });

            // Init select form element
            $(document).ready(function () {
                $('select').material_select();
            });
        </script>
    </body>
</html>
