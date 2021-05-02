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
        String admin="";
                
                if((admin = (String)session.getAttribute("admin"))=="" || (admin = (String)session.getAttribute("admin"))==null)
                {
                    response.sendRedirect("index.html");
                }
    %>
        <div class="wrapper">
                <div id="header">
                <div id="logo">
                    <img src="images/attlogo.png"/>
                    <div><h1>E-Attendance</h1></div>
                    </div>
            </div>
        <div class="wrapper">
                <div id="menuwrap">
                    <ul id="menu">
                        <span style="cursor: default;" onclick="document.getElementById('checkpopup').style.display='block'"><li><a>Check Attendance</a></li></span>
                        <span style="cursor: default;" onclick="document.getElementById('departmentpopup').style.display='block'"><li><a href="#">Add Department</a></li></span>
                        <li><a href="AdminLogout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
            </div>
        <div class="wrapper light">
            <div id="content">
                <h1>Error : Adding Department Was Unsuccessful !</h1>
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
        <div id="checkpopup">
        <div id="logfaculty">
            <form action="GiveAttendance.jsp">
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('checkpopup').style.display='none'" id="close">&times;</span>
                    <table>
                        <h1>Submit The Options To Check The Attendance</h1>
                            <tr>
                                <td><select name="t1" id="combo">
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
                                <td><input type="submit" value="Submit" id="button"/></td>
                            </tr>
                    </table>
                    </div>
            </form>
        </div>
        </div>
        
        <div id="checkpopup">
        <div id="logfaculty">
            <form action="AddDepart">
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('checkpopup').style.display='none'" id="close">&times;</span>
                    <table>
                        <h1>Enter The Below Details!</h1>
                        <tr>
                            <td><input type="text" name="t1" placeholder="Department Code"/></td>
                        </tr>
                        <tr>
                            <td><input type="password" name="t2" placeholder="Password"/></td>
                        </tr>
                            <tr>
                                <td><input type="submit" value="Submit" id="button"/></td>
                            </tr>
                    </table>
                    </div>
            </form>
        </div>
        </div>
    </body>
</html>
