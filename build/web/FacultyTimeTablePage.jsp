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
                String faculty="", msg="";
                
                if((faculty = (String)session.getAttribute("username"))=="" || (faculty = (String)session.getAttribute("username"))==null)
                {
                    response.sendRedirect("index.html");
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
                        <span style="cursor: default;" onclick="document.getElementById('timetable').style.display='block'"><li><a>Timetable</a></li></span>
                        <span style="cursor: default;" onclick="document.getElementById('subject').style.display = 'block'"><li><a>Add Subject</a></li></span>
                        <li><a href="AdminLogout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
            </div>
        <div class="wrapper light">
            <div id="content">
                <h2 style="margin: 40px 0px 0px 40px">Welcome To Time Table Page !<br/>
                Click On TimeTable To Continue</h2>
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
        
        <div id="timetable">
        <div id="attstudent">
            <form>
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                        <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('timetablepopup').style.display='block'"><li><a href="#">Show TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('transferpopup').style.display='block'"><li><a href="#">Transfer To Another Faculty</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('notificationpopup').style.display='block'"><li><a>Transfer Notification</a></li></span>
                            </ul>
                    </div>
                    <div id="logcon2">
                    <span onclick="document.getElementById('timetable').style.display='none'" id="close">&times;</span>
                    
            </form>
        </div>
        </div>
        
                        
        <div id="transferpopup">
        <div id="attstudent">
            <form action="TimeTableTransfer.jsp">
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                        <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('timetablepopup').style.display='block';document.getElementById('transferpopup').style.display='none';document.getElementById('notificationpopup').style.display='none'"><li><a href="#">Show TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('transferpopup').style.display='block';document.getElementById('timetablepopup').style.display='none';document.getElementById('notificationpopup').style.display='none'"><li><a href="#">Transfer To Another Faculty</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('notificationpopup').style.display='block';document.getElementById('transferpopup').style.display='none';document.getElementById('timetablepopup').style.display='none'"><li><a>Transfer Notification</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon2">
                    <span onclick="document.getElementById('transferpopup').style.display='none';document.getElementById('timetable').style.display='none'" id="close">&times;</span>
                    
                    <table>
                        <tr>
                            <td>
                            <h3 align="center">Transfer Slot to Other Faculty Form !</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p style="text-align: center"><b>Weekday</b></td>
                            <td>
                                <select size="1" name="wd" style="width: 150; height: 22">
                                    <option selected value="Monday">Monday</option>
                                    <option value="Tuesday">Tuesday</option>
                                    <option value="Wednesday">Wednesday</option>
                                    <option value="Thursday">Thursday</option>
                                    <option value="Friday">Friday</option>
                                    <option value="Saturday">Saturday</option>
                                    <option value="Sunday">Sunday</option>
                                </select></td>
                            <td>
                                <input type="submit" id="button" value="Send" style="float: right"/> </td>
                        </tr>
                    </table>
            
        </div>
                </form>
        </div>
        </div>
            
        <div id="notificationpopup">
        <div id="attstudent">
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                        <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('timetablepopup').style.display='block';document.getElementById('transferpopup').style.display='none';document.getElementById('notificationpopup').style.display='none'"><li><a href="#">Show TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('transferpopup').style.display='block';document.getElementById('timetablepopup').style.display='none';document.getElementById('notificationpopup').style.display='none'"><li><a href="#">Transfer To Another Faculty</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('notificationpopup').style.display='block';document.getElementById('transferpopup').style.display='none';document.getElementById('timetablepopup').style.display='none'"><li><a>Transfer Notification</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon2">
                    <span onclick="document.getElementById('notificationpopup').style.display='none';document.getElementById('timetable').style.display='none'" id="close">&times;</span>
                    <a href="SlotFacultyRequests.jsp" id="a">Faculty Slot Requests</a>
                    <a href="SlotYourRequests.jsp" id="a">Your Slot Requests</a>
        </div>
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
                    </tr>
                    <input type="submit" value="Add Subject" id="button"/>
                    </table>
                    </div>
            </form>
        </div>
        </div>
    </body>
</html>
