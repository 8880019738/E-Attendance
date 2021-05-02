<%@page import="java.sql.*"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project  Properties.
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
        String admin="";
                
                if((admin = (String)session.getAttribute("admin"))=="" || (admin = (String)session.getAttribute("admin"))==null)
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
                        <li><a href="AdminFacultyPage.jsp">Faculty</a></li>
                        <li><a href="AdminStudentPage.jsp">Student</a></li>
                        <span style="cursor: default;" onclick="document.getElementById('timetablepopup').style.display='block'"><li><a>Timetable</a></li></span>
                        <li><a href="AdminLogout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
            </div>
        <div class="wrapper light">
            <div id="content">
                <div style="width: 950px; height: 321px;color: white;"><div style="width: 950px; height: 321px;color: white;"><h3 align="left" style="font-size: 30px;margin: 50px 0px 0px 50px;color: black;">Welcome TO TimeTable Page, Please Click On TimeTable To Continue..</h3>
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
        <div id="timetablepopup">
        <div id="logadmin">
            <form action="AdminLogin">
                   <div id="loglogo">
                        <img src="images/logo.JPG"/>
                         <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addtimetable').style.display='block'"><li><a href="#">Add TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('modifytimetable').style.display='block'"><li><a href="#">Modify TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('deletetimetable').style.display='block'"><li><a href="#">Delete TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('listtimetable').style.display='block'"><li><a href="#">list TimeTable</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('timetablepopup').style.display='none'" id="close">&times;</span>
                    <h1>Welcome To TimeTable Data Handling Page...</h1>
                    </div>
            </form>
        </div>
        </div>
        <div id="addtimetable">
        <div id="logadmin">
            <form action="AddTimeTable.jsp">
                   <div id="loglogo">
                        <img src="images/logo.JPG"/>
                         <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addtimetable').style.display='block'"><li><a href="#">Add TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('modifytimetable').style.display='block'"><li><a href="#">Modify TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('deletetimetable').style.display='block'"><li><a href="#">Delete TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('listtimetable').style.display='block'"><li><a href="#">list TimeTable</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('addtimetable').style.display='none'" id="close">&times;</span>
                    <table>
                        <tr>

                                <td><select name="t1" id="combo">
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
                                <td><select name="t2" id="combo">
                                        <option style="opacity: 0.1">Section</option>
                                        <option>A</option>
                                        <option>B</option>
                                        <option>C</option>
                                        <option>D</option>
                                        <option>E</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="Send" id="button"/></td>
                            </tr>
                    </table>
                    </div>
            </form>
        </div>
        </div><div id="modifytimetable">
        <div id="logadmin">
            <form action="ModifyTimeTable.jsp">
                   <div id="loglogo">
                        <img src="images/logo.JPG"/>
                         <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addtimetable').style.display='block'"><li><a href="#">Add TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('modifytimetable').style.display='block'"><li><a href="#">Modify TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('deletetimetable').style.display='block'"><li><a href="#">Delete TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('listtimetable').style.display='block'"><li><a href="#">list TimeTable</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('addtimetable').style.display='none'" id="close">&times;</span>
                    <table>
                        <tr>

                                <td><select name="t1" id="combo">
                                        <option style="opacity: 0.1">WEEKDAY</option>
                                        <option>Sunday</option>
                                        <option>Monday</option>
                                        <option>Tuesday</option>
                                        <option>Wednesday</option>
                                        <option>Thursday</option>
                                        <option>Friday</option>
                                        <option>Saturday</option>
                                    </select></td>
                            </tr>
                        <tr>

                                <td><select name="t2" id="combo">
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
                                <td><select name="t3" id="combo">
                                        <option style="opacity: 0.1">Section</option>
                                        <option>A</option>
                                        <option>B</option>
                                        <option>C</option>
                                        <option>D</option>
                                        <option>E</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="Send" id="button"/></td>
                            </tr>
                    </table>
                    </div>
            </form>
        </div>
        </div>             
        <div id="deletetimetable">
        <div id="logfaculty">
            <form action="DeleteTimeTable">
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                        <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addtimetable').style.display='block'"><li><a href="#">Add TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('modifytimetable').style.display='block'"><li><a href="#">Modify TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('deletetimetable').style.display='block'"><li><a href="#">Delete TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('listtimetable').style.display='block'"><li><a href="#">list TimeTable</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('deletetimetable').style.display='none';document.getElementById('timetablepopup').style.display='none';" id="close">&times;</span>
                    <table>
                        <h3><input type="text" name="d1" style="border: 0;" value="<%=admin%>" />Time Table Deletion Form!</h3>
              <tr>

                                <td><select name="t1" id="combo">
                                        <option style="opacity: 0.1">WEEKDAY</option>
                                        <option>Sunday</option>
                                        <option>Monday</option>
                                        <option>Tuesday</option>
                                        <option>Wednesday</option>
                                        <option>Thursday</option>
                                        <option>Friday</option>
                                        <option>Saturday</option>
                                    </select></td>
                            </tr>
                        <tr>

                                <td><select name="t2" id="combo">
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
                                <td><select name="t3" id="combo">
                                        <option style="opacity: 0.1">Section</option>
                                        <option>A</option>
                                        <option>B</option>
                                        <option>C</option>
                                        <option>D</option>
                                        <option>E</option>
                                    </select></td>
                            </tr>
					
        </tr>
        <tr>
          <td>
              <input type="submit" id="button" value="Delete" style="float: right"/></td>
        </tr>
        </table>
                    </div>
            </form>
        </div>
        </div>            
        <div id="listtimetable">
        <div id="popupin">
            <form action="ListTimeTable.jsp">
                
        <table border="1" width="70%">
                        <h3><input type="text" name="t1" style="border: 0;" value="<%=admin%>" />List Of Timetable!</h3>
              
                        <tr>

                                <td><select name="t2" id="combo">
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
                                <td><select name="t3" id="combo">
                                        <option style="opacity: 0.1">Section</option>
                                        <option>A</option>
                                        <option>B</option>
                                        <option>C</option>
                                        <option>D</option>
                                        <option>E</option>
                                    </select></td>
                            </tr>
					
        </tr>
                        
                       </table> 
                    <input type="submit" id="button" value="Submit" />
            </form>
        </div>
        </div>
        
    </body>
</html>
