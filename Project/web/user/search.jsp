<%@page import="classes.App, java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Search Projects | Project Sumbission Portal | IIITA</title>
        <!--Import Google Icon Font-->
        <link href="../fonts/iconfont/material-icons.css" rel="stylesheet"/>
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
                <a href="submit-report.jsp" class="waves-effect">Submit Project Report</a>
            </li>
            <li>
                <a href="submit-ppt.jsp" class="waves-effect">Submit Project PPT</a>
            </li>
            <li>
                <a href="submit-code.jsp" class="waves-effect">Submit Project Code</a>
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
                    <a href="/Project/user/" class="waves-effect waves-light btn green">Current Semester Projects</a>
                    <a href="#" class="waves-effect waves-light btn green darken-3">Search Projects</a>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <div class="card">
                        <div class="card-content">
                            <p>
                                <b>Note</b> - You can search for a previous project by project title or by the topic (keywords). You can search by
                                all of them or none of them. If you choose no parameters, all the projects are displayed.
                            </p> 
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-content">
                            <form method="post" action="/Project/Search">
                                <span class="card-title">Search Projects</span>
                                <div class="row">
                                    <div class="input-field col s8">
                                        <input id="title" type="text" name="title" class="validate">
                                        <label for="title">Project Title</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <select name="keywords" name="keywords" multiple>
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
                                            %>
                                        </select>
                                        <h3><%= ex.getMessage()%></h3>
                                        <%
                                            }
                                        %>
                                        </select>
                                        <label>Select Project Keywords</label>
                                    </div>
                                </div>
                                <button type="button" class="waves-effect waves-light btn" onclick="searchProjects()">Search</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col l12" id="results">
                    <!-- Project results -->
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

                                    // Init select form element
                                    $(document).ready(function () {
                                        $('select').material_select();
                                    });

                                    function searchProjects() {
                                        $.post("/Project/Search",
                                                {
                                                    title: $('input[name="title"]').val(),
                                                    keywords: $('select[name="keywords"]').val()
                                                }, searchProjectsCallback);
                                    }

                                    function searchProjectsCallback(data) {
                                        $('#results').empty();

                                        $(data).each(function (index) {
//                    var html = 
//                    '<div class="card grey lighten-5">' +
//                        '<div class="card-content">' +
//                            '<span class="card-title">' + data[index].title + '</span>' +
//                            '<p>' + data[index].description + '</p>' +
//                            '<br>' +
//                            '<p>Project Group Members -</p>' +
//                            '<ul>' +
//                                '<li>Ojusvini Agarwal (RIT2013001)</li>' +
//                                '<li>Saniya Nejeeb (RIT2013002)</li>' +
//                                '<li>Shanmukh Dundigalla (RIT2013003)</li>' +
//                            '</ul>' +
//                            '<p>Project Guide - ' + data[index].guide + '</p><br>' +
//                            '<a href="#"><div class="chip">Image Processing</div></a>' +
//                            '<a href="#"><div class="chip">Algorithms</div></a>' +
//                            '<a href="#"><div class="chip">Android Development</div></a>' +
//                        '</div>' +
//                        '<div class="card-action">' +
//                            '<a href="#" class="waves-effect waves-d btn white black-text">Download Project Report</a> &nbsp; ' +
//                            '<a href="#" class="waves-effect waves-d btn white black-text">Download PPT</a> &nbsp; ' +
//                            '<a href="#" class="waves-effect waves-d btn white black-text">Download Code</a> &nbsp; ' +
//                        '</div>' +
//                    '</div>';

                                            var html =
                                                    '<div class="card grey lighten-5">' +
                                                    '<div class="card-content">' +
                                                    '<span class="card-title">' + data[index].title + '</span>' +
                                                    '<p>' + data[index].description + '</p>' +
                                                    '<br>' +
                                                    '<p>Project Group Members -</p>' +
                                                    '<ul>';

                                            var memberString = "";

                                            $(data[index].memberNames).each(function (memberIndex) {
                                                memberString += '<li>' + data[index].memberNames[memberIndex] + ' (' + data[index].memberRollNumbers[memberIndex] + ')</li>';
                                            });

                                            html = html + memberString + '</ul>' +
                                                    '<p>Project Guide - ' + data[index].guide + '</p><br>';

                                            var keywordsString = "";

                                            $(data[index].keywords).each(function (keywordIndex) {
                                                keywordsString += '<a href="#"><div class="chip">' + data[index].keywords[keywordIndex] + '</div></a>';
                                            });

                                            html = html + keywordsString + '</div>' +
                                                    '<div class="card-action">' +
                                                    '<a href="#" class="waves-effect waves-d btn white black-text">Download Project Report</a> &nbsp; ' +
                                                    '<a href="#" class="waves-effect waves-d btn white black-text">Download PPT</a> &nbsp; ' +
                                                    '<a href="#" class="waves-effect waves-d btn white black-text">Download Code</a> &nbsp; ' +
                                                    '</div>' +
                                                    '</div>';

                                            $('#results').append(html);
                                        });
                                    }
        </script>
    </body>
</html>
