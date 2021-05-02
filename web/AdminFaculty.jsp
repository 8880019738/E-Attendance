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
                        <span style="cursor: default;" onclick="document.getElementById('facultypopup').style.display='block'"><li><a>Faculty</a></li></span>
                        <span style="cursor: default;" onclick="document.getElementById('studentpopup').style.display='block'"><li><a>Student</a></li></span>
                        <span style="cursor: default;" onclick="document.getElementById('timetablepopup').style.display='block'"><li><a>Timetable</a></li></span>
                        <li><a href="AdminLogout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
            </div>
        <div class="wrapper light">
            <div id="content">
                <div style="width: 658px; height: 237px">
       <%
                String msg="";
                
                if((msg = (String)session.getAttribute("msg"))=="" || (msg = (String)session.getAttribute("msg"))==null)
                {
                    msg = "";
                }
                if(msg.equals("Success"))
                {
                    msg = "Faculty Added Successfully";
                }
                else if(msg.equals("SuccessSubject"))
                {
                    msg = "Subject Added Successfully";
                }
                else if(msg.equals("Error"))
                {
                    msg = "Oops Some Database Error Please Do Check and Add New Faculty";
                }
                else if(msg.equals("ModifyError"))
                {
                    msg = "Faculty Does Not Exist";
                }
                else if(msg.equals("ModifyDataError"))
                {
                    msg = "Faculty Does Not Exist";
                }
                else if(msg.equals("ModifySuccess"))
                {
                    msg = "Faculty Modified Successfully";
                }
                else if(msg.equals("DeleteSuccess"))
                {
                    msg = "Faculty Deleted Successfully";
                }
                else if(msg.equals("ModifyDataError"))
                {
                    msg = "Facutly Was Not Deleted";
                }
        %>
				<h3><%=msg%></h3>
                                <br/>
                                <a href="AdministratorSuccess.jsp">Go Back</a>
            
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
    </body>
</html>
