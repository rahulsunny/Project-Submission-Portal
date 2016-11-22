<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.sql.*, classes.App"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Submit Project Report | Project Submission Portal | IIITA</title>
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
                <a href="#" class="waves-effect grey lighten-3 grey lighten-3">Submit Project Report</a>
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
                            <span class="card-title">Project Report Submission Guide</span>
                            <p>
                                Please go through the instructions given below thoroughly before submitting the details of your project.
                            </p>
                            <ul class="browser-default" style="margin-left: 15px;">
                                <li>Project report is to be submitted at least 2 days prior to your end semester project evaluation.</li>
                                <li>You may be asked by the evaluation panel to download your submitted report to validate it.</li>
                                <li>Please submit the project strictly in <strong>PDF (Portable Document Format)</strong> only.</li>
                                <li>Please make sure the report you are submitting is final and no further changes are to be made.</li>
                                <li>In the unlikely case of the rejection of your report, please contact the admin immediately.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col l12">
                    <div class="card">
                        <div class="card-content">
                            <%

                                if (s.getAttribute("id") != null) {
                                    String location = application.getRealPath("/") + "\\data\\reports\\" + s.getAttribute("id") + ".pdf";
                                    File report = new File(location);

                                    if (report.exists()) {
                                        String fileRelativeLocation = "../data/reports/" + s.getAttribute("id") + ".pdf";
                            %>
                            <span class="card-title">Submit Project Report</span>
                            <p>You have already submitted a project report. You can view it below -</p><br>
                            <object data="<%= fileRelativeLocation%>" type="application/pdf" width="100%" height="800px">
                                <p>Project Report</p>
                            </object>
                            <%
                            } else {
                            %>
                            <span class="card-title">Submit Project Report</span>
                            <form action="/Project/UploadReport" method="post" enctype="multipart/form-data">
                                <div class="file-field input-field">
                                    <div class="btn">
                                        <span>File</span>
                                        <input type="file" name="file" required="required"  accept="pdf, application/pdf">
                                    </div>
                                    <div class="file-path-wrapper">
                                        <input class="file-path validate" type="text">
                                    </div>
                                </div>
                                <br>
                                <p>
                                    <b>Note</b> - Project report cannot be altered after submission. Please verify very thoroughly before submission.
                                </p>
                                <div class="row">
                                    <div class="input-field col m6">
                                        <input id="password" name="password" type="password" class="validate"/>
                                        <label for="password">Re-enter password</label>
                                    </div>
                                </div>
                                <button type="submit" class="waves-effect waves-light btn">Submit</button>
                            </form>
                            <%
                                    }
                                } else {
                                    %>
                                    <p>Please create a project for the current semester first.</p>
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
