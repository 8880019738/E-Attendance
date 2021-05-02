<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    <body>
        <%
            String faculty = "", msg = "";

            if ((faculty = (String) session.getAttribute("username")) == "" || (faculty = (String) session.getAttribute("username")) == null) {
                response.sendRedirect("FacultyLoginPage.jsp");
            }


        %>
        <div class="wrapper">
            <div id="headertop">
                <div><img src="images/header.jpg"/></div>
            </div>
            <div id="header">
                <div id="logo">
                    <img src="images/attlogo.png"/>
                    <div><h1>E-Attendance</h1></div>
                    </div>
            <div class="wrapper">
                <div id="menuwrap">
                    <ul id="menu">
                        <li><a href="FacultyAttendancePage.jsp">Attendance</a></li>
                        <li><a href="FacultyTimeTablePage.jsp">Timetable</a></li>
                        <span style="cursor: default;" onclick="document.getElementById('subject').style.display = 'block'"><li><a>Add Subject</a></li></span>
                        <li><a href="AdminLogout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="wrapper light">
            <div id="content">
                <div style="width: 950px; height: 321px;margin: 40px 0px 0px 40px;font-size: 25px"><%                    
                    String un, sub = "";

                    if ((un = (String) session.getAttribute("username")) == "" || (un = (String) session.getAttribute("username")) == null) {
                        response.sendRedirect("index.html");
                    }

                    sub = (String) session.getAttribute("sub");

                    if ((msg = (String) session.getAttribute("msg")) == "" || (msg = (String) session.getAttribute("msg")) == null) {
                        msg = "Faculty " + un + " Logged In Successfully";
                    } else if (msg.equals("TransferSuccess")) {
                        msg = "Faculty Session Transfered Successfully and SMS Sent to the Faculty";
                    } else if (msg.equals("TransferError")) {
                        msg = "Oops There was some Problem";
                    } else if (msg.equals("RequestedError")) {
                        msg = "Faculty Dont Have Any Requests to Approve";
                    } else if (msg.equals("YourRequestError")) {
                        msg = "You Have Not Requested Any Slot Change";
                    }

                    %>
                    <h3 align="left"><%=msg%></h3>
                    <%
                        session.setAttribute("msg", "");
                    %>
                </div>
            </div>
        </div>

        <div class="wrapper">
            <div id="footer">
                <ul class="foot">
                    <li>
                        <h3>SGP!</h3>
                        <p>Sanjay Gandhi Polytechnic</p>
                        <div>
                            <p>Telephone. : <span>12345678-90</span></p>
                            <p>Fax : <span>23456789-01</span></p>
                            <p>Email : <span>ask@sgp.edu.in</span></p>
                        </div>
                    </li>
                    <li>
                        <h3>Get Social with us!</h3>
                        <p>Get in touch with us through social media and communication 
                            system using Face book, Twitter and whatsup from any place 
                            through out the world.</p>
                        <div>
                            <a class="facebook" target="_blank" href="https://www.facebook.com/Bitmballari15/?ref=aymt_homepage_panel">
                            </a>
                            <a class="twitter" target="_blank" href="https://twitter.com/BitmBiired">
                            </a><a class="linked-in" href="https://in.linkedin.com/in/b-i-t-m-ballari-065a63107"></a>
                        </div>
                    </li>
                    <li>
                        <h3>Share your thoughts!</h3>
                        <p>Share your thoughts and ideas with us to make this place 
                            wroth visiting again and again</p>
                        <br/>
                        <form action="#">
                            <p>
                                <label for="subscribe"><input type="text" class="login" placeholder="Email Address" /></label>
                                <input type="submit" value="Submit" />
                            </p>
                        </form>
                        <br/>
                        <p>Copyright &#65533; 2017 SGP  <br />LRP 121 8392 8392 All rights reserved by<br></p>
                        <br/>
                    </li>
                </ul>
                <p align="center">
                <marquee width="539" height="45" style="color: #FFFFFF">Sgp, alias Sanjay Gandhi Polytechnic greatest strength. </marquee>

            </div>
        </div>

        <div id="subject">
        <div id="logfaculty">
            <form action="AddSubject">
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('subject').style.display='none'" id="close">&times;</span>
                    
                    <h1 style="margin-top: 50px;margin-left: 40px;color: grey">Enter The Details To add Subject</h1><br/><br/><br/>
                    <table>
                        Faculty Name<input type="text" name="t1" value="<%=faculty%>" readonly/><td>
                        
                        <tr>
                            <td><input type="text" name="t2" placeholder="Subject" id="textb1"/><br/></td>
                        <tr>
                                <td><select name="t3" id="combo">
                                        <option style="opacity: 0.1">Department</option>
                                        <option>DCS</option>
                                        <option>DEE</option>
                                        <option>DME</option>
                                        <option>DEC</option>
                                        <option>DCE</option>
                                        <option>DMT</option>
                                    </select></td>
                            </tr>
                            <tr>

                                <td><select name="t4" id="combo">
                                        <option style="opacity: 0.1">Semester</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><select name="t5" id="combo">
                                        <option style="opacity: 0.1">Section</option>
                                        <option>A</option>
                                        <option>B</option>
                                        <option>C</option>
                                        <option>D</option>
                                        <option>E</option>
                                    </select></td>
                            </tr>
                    <input type="submit" value="Add Subject" id="button"/>
                    </table>
                    </div>
            </form>
        </div>
        </div>
    </body>
</html>
