<%@page import="classes.App, java.sql.*, java.time.*, java.time.format.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Home | Project Submission Portal | IIITA</title>
        <!--Import Google Icon Font-->
        <link href="../fonts/iconfont/material-icons.css" rel="stylesheet"/>
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="../css/global-styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav>
            <div class="nav-wrapper light-blue">
                <div class="container">
                    <a href="#!" class="brand-logo"><i class="material-icons">assignment</i>Project Submission Portal</a>
                    <ul class="right">
                        <li>Hello Admin ! &nbsp; </li>
                        <li><a class="waves-effect" href="/Project/UserLogout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <div class="container">
            <div class="row">
                <div class="col s12">
                    <h5>Manage Student Project Records</h5>
                    <div class="collection with-header">
                        <a href="delete-project.jsp" class="collection-item waves-effect waves-d">Delete a full Project / Report / PPT / Code</a>
                        <a href="#!" class="collection-item waves-effect waves-d">Delete a project member</a>
                        <a href="#!" class="collection-item waves-effect waves-d">Re-assign a project member to another project</a>
                        <a href="#!" class="collection-item waves-effect waves-d">Lock projects</a>
                    </div>
                </div>
                <div class="col s12">
                    <h5>Manage Project Guides</h5>
                    <div class="collection with-header">
                        <a href="#!" class="collection-item waves-effect waves-d">Add a new guide</a>
                        <a href="#!" class="collection-item waves-effect waves-d">Change availability of existing guides</a>
                        <a href="#!" class="collection-item waves-effect waves-d">Edit a guide's name</a>
                    </div>
                </div>
                <div class="col s12">
                    <h5>Manage Project Keywords</h5>
                    <div class="collection with-header">
                        <a href="add-keyword.jsp" class="collection-item waves-effect waves-d">Add a new keyword</a>
                        <a href="edit-keyword.jsp" class="collection-item waves-effect waves-d">Edit an existing keyword</a>
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
    </body>
</html>
