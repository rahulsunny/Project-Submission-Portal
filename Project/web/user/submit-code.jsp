<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.sql.*, classes.App" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Submit Project Code | Project Submission Portal | IIITA</title>
        <!--Import Google Icon Font-->
        <link href="../fonts/iconfont/material-icons.css" rel="stylesheet"/>
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <style>
            #directory .btn {
                text-transform: none;
            }
        </style>
        <link href="../css/submit-code.css" rel="stylesheet"/>
    </head>
    <body class="">
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
                <a href="submit-report.jsp" class="waves-effect">Submit Project Details</a>
            </li>
            <li>
                <a href="submit-details.html" class="waves-effect">Submit Project Report</a>
            </li>
            <li>
                <a href="submit-ppt.html" class="waves-effect">Submit Project PPT</a>
            </li>
            <li>
                <a href="#" class="waves-effect">Submit Project Code</a>
            </li>
            <li><div class="divider"></div></li>
            <li>
                <a class="subheader">Evaluation</a>
            </li>
            <li>
                <a href="#" class="waves-effect">Present Project PPT</a>
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
                        <li><a class="waves-effect" href="#!">Logout</a></li>
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
                            <span class="card-title">Code Upload Instructions</span>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
                                dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                            </p>
                        </div>
                    </div>
                </div>
            
                <div class="col l12">
                    <div class="card grey lighten-4">
                        <div class="card-content">
                            <span class="card-title">Your code directory</span>
                            <br><br>
                            <div id="directory"></div>
                        </div>
                    </div>
                </div>
                <div class="col l12">
                    <div class="card">
                        <div class="card-content" style="padding: 0px;">
                            <div class="row">
                                <div class="col s12">
                                    <ul class="tabs">
                                        <li class="tab col s3"><a class="active" href="#add-directory">Add Directory</a></li>
                                        <li class="tab col s3"><a href="#add-code-files">Add Code Files</a></li>
                                        <li class="tab col s3"><a href="#delete-directory">Delete Directory</a></li>
                                        <li class="tab col s3"><a href="#delete-code-files">Delete Code Files</a></li>
                                    </ul>
                                </div>
                                <div id="add-directory" class="col s12" style="padding:35px;">
                                    <form>
                                        <div class="row">
                                            <div class="input-field col s8">
                                                <input id="first_name" type="text" class="validate">
                                                <label for="first_name">New Directory Name</label>
                                            </div>
                                        </div>
                                        <a class="waves-effect waves-light btn">Add</a>
                                    </form>
                                </div>
                                <div id="add-code-files" class="col s12" style="padding:35px;">
                                    <form>
                                        <div class="row">
                                            <div class="col m6">
                                                <div class="file-field input-field">
                                                    <div class="btn">
                                                        <span>File</span>
                                                        <input type="file" multiple>
                                                    </div>
                                                    <div class="file-path-wrapper">
                                                        <input class="file-path validate" type="text" placeholder="Select one/more code files">
                                                    </div>
                                                </div> 
                                            </div>
                                        </div>
                                        <a class="waves-effect waves-light btn">Add</a>
                                    </form>
                                </div>
                                <div id="delete-directory" class="col s12" style="padding:35px;">
                                    <form>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <select>
                                                    <option value="" disabled selected>Choose your option</option>
                                                    <option value="1">Codeforces</option>
                                                    <option value="2">src</option>
                                                </select>
                                                <label>Select Directory</label>
                                            </div>
                                        </div>
                                        <a class="waves-effect waves-light btn red">Delete</a>
                                    </form>
                                </div>
                                <div id="delete-code-files" class="col s12" style="padding:35px;">
                                    <form>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <select multiple>
                                                    <option value="" disabled selected>Choose your option</option>
                                                    <option value="1">BrokenClock.java</option>
                                                    <option value="2">CompleteTheWord.java</option>
                                                    <option value="4">CompleteTheWordBrute.java</option>
                                                </select>
                                                <label>Select Code Files</label>
                                            </div>
                                        </div>
                                        <a class="waves-effect waves-light btn red">Delete</a>
                                    </form>
                                </div>
                            </div>
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
            
            $(document).ready(function () {
                getDirectoryDetails("");
            });
            
            function getDirectoryDetails(data) {
                $.get("/Project/DirectoryDetails", {
                    path : data
                }, getDirectoryDetailsCallback);
            }
            
            function getDirectoryDetailsCallback(data) {
                $("#directory").html(data);
            }
        </script>
    </body>
</html>
