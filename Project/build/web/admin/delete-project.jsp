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
                        <a href="#!" class="collection-item waves-effect waves-d active">Delete a semester project</a>
                        <a href="#!" class="collection-item waves-effect waves-d">Delete the submitted report of a project</a>
                        <a href="#!" class="collection-item waves-effect waves-d">Delete the submitted PPT of a project</a>
                        <a href="#!" class="collection-item waves-effect waves-d">Delete the submitted code for a project</a>
                        <a href="#!" class="collection-item waves-effect waves-d">Delete a project member</a>
                        <a href="#!" class="collection-item waves-effect waves-d">Re-assign a project member to another project</a>
                        <a href="#!" class="collection-item waves-effect waves-d">Lock projects</a>
                        <a href="/Project/admin/" class="collection-item waves-effect waves-d"> &larr; &nbsp; Go back</a>
                    </div>
                </div>
                <div class="col s12">
                    <div class="card">
                        <div class="card-content">
                            <form method="post" action="/Project/Search">
                                <span class="card-title">Search Project to Delete</span>
                                <div class="row">
                                    <div class="input-field col s8">
                                        <input id="title" type="text" name="title" class="validate">
                                        <label for="title">Project Title</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <select name="keywords" multiple>
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
                                <div class="row">
                                    <div class="input-field col s12">
                                        <select name="guides" multiple>
                                            <option disabled selected>Choose your option</option>
                                            <%
                                                try {
                                                    Class.forName(App.DRIVER_CLASS);
                                                    Connection con = DriverManager.getConnection(App.CONNECTION_STRING, App.CONNECTION_USERNAME, App.CONNECTION_PASSWORD);
                                                    Statement guideStatement = con.createStatement();
                                                    String guideQuery = "select id, name from guides order by name";
                                                    ResultSet guideResultSet = guideStatement.executeQuery(guideQuery);

                                                    while (guideResultSet.next()) {
                                            %>
                                            <option value="<%= guideResultSet.getInt("id")%>"> &nbsp; <%= guideResultSet.getString("name")%></option>
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
                                        <label>Select Guide</label>
                                    </div>
                                </div>
                                <button type="button" class="waves-effect waves-light btn" onclick="searchProjects()">Search</button>
                            </form>
                        </div>
                    </div>
                    <div class="col l12" id="results">
                        <!-- Project results -->
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

                                    // Init select form element
                                    $(document).ready(function () {
                                        $('select').material_select();
                                    });

                                    $(document).ready(function () {
                                        $('.tooltipped').tooltip({delay: 50});
                                    });

                                    function searchProjects() {
                                        $.post("/Project/Search",
                                                {
                                                    title: $('input[name="title"]').val(),
                                                    keywords: $('select[name="keywords"]').val(),
                                                    guides: $('select[name="guides"]').val()
                                                }, searchProjectsCallback);
                                    }

                                    function searchProjectsCallback(data) {
                                        $('#results').empty();

                                        if (data.fail === "No projects found.") {
                                            var html = '<div class="card grey lighten-5">' +
                                                    '<div class="card-content">' +
                                                    '<p>' + data.fail + '</p>' +
                                                    '</div>' +
                                                    '</div>';
                                            $('#results').append(html);
                                            return;
                                        }

                                        $(data).each(function (index) {
                                            var lock = '';

                                            if (data[index].locked === "Y") {
                                                lock = '<a class="tooltipped right-align" data-position="right" data-delay="50" data-tooltip="This project has been completed and evaluated.">' +
                                                        '<span style="font-size:19pt;"><i class="tiny material-icons">done</i></span></a>';
                                            }

                                            var html =
                                                    '<div class="card grey lighten-5">' +
                                                    '<div class="card-content">' +
                                                    '<span class="card-title">' + data[index].title + '</span> &nbsp;' + lock + '<br>' +
                                                    '<small>' + data[index].project_date + '</small><br><br>' +
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
                                                    '<form method="post" action="/Project/DeleteProject">' +
                                                    '<input type="hidden" name="id" value="' + data[index].id + '"/>' +
                                                    '<button type="submit" class="btn red waves-effect waves-d">Delete this project</button>' +
                                                    '</form>' +
                                                    '</div>';

                                            $('#results').append(html);
                                        });

                                        $('.tooltipped').tooltip({delay: 50});
                                    }
        </script>
    </body>
</html>