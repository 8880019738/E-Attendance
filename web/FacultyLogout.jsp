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
            <div class="wrapper">
                <div id="menuwrap">
                    <ul id="menu">
                        <span style="cursor: default;" onclick="document.getElementById('facultypopup').style.display='block'"><li><a href="#">Faculty</a></li></span>
                        <span style="cursor: default;" onclick="document.getElementById('studentpopup').style.display='block'"><li><a href="#">Student</a></li></span>
                        <span style="cursor: default;" onclick="document.getElementById('timetablepopup').style.display='block'"><li><a>Timetable</a></li></span>
                        <li><a href="AdminLogout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
            </div>
        <div class="wrapper">
            <div id="content">
                <%
                session.setAttribute("username", "");
                session.setAttribute("msg", "");
                response.sendRedirect("index.html");
                %>
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
                    </div>
                         <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('facultypopup').style.display='block'"><li><a href="#">Add TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('facultypopup').style.display='block'"><li><a href="#">Modify TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('facultypopup').style.display='block'"><li><a href="#">Delete TimeTable</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('facultypopup').style.display='block'"><li><a href="#">list TimeTable</a></li></span>
                        </ul>
                    
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('timetablepopup').style.display='none'" id="close">&times;</span>
                    </div>
            </form>
        </div>
        </div>
        <div id="facultypopup">
        <div id="logfaculty">
            <form>
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                        <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addfaculty').style.display='block';document.getElementById('facultypopup').style.display='none';"><li><a href="#">Add Faculty</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('modifyfaculty').style.display='block';document.getElementById('facultypopup').style.display='none';"><li><a href="#">Modify Faculty</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('deletefaculty').style.display='block';document.getElementById('facultypopup').style.display='none';"><li><a href="#">Delete Faculty</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('listfaculty').style.display='block';document.getElementById('facultypopup').style.display='none';"><li><a href="#">list Faculty</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('facultypopup').style.display='none'" id="close">&times;</span>
                    </div>
            </form>
        </div>
        </div>
        <div id="addfaculty">
        <div id="logfaculty">
            <form>
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                        <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addfaculty').style.display='block';document.getElementById('facultypopup').style.display='none';"><li><a href="#">Add Faculty</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('modifyfaculty').style.display='block';document.getElementById('facultypopup').style.display='none';"><li><a href="#">Modify Faculty</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('deletefaculty').style.display='block';document.getElementById('facultypopup').style.display='none';"><li><a href="#">Delete Faculty</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('listfaculty').style.display='block';document.getElementById('facultypopup').style.display='none';"><li><a href="#">list Faculty</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('addfaculty').style.display='none';document.getElementById('facultypopup').style.display='none';" id="close">&times;</span>
                    <table>
	    <tr>
	      <td><h1>Faculty Data Entry Form !</h1></td>
        </tr>
	    <tr>
	      <td>
                  <input name="t1" type="text" placeholder="Faculty ID" id="textb1"/>
	      <td>
		<input name="t7" type="text" placeholder="Master Subject" id="textb1"/></td>
        </tr>
	    <tr>
	      <td>
		<input name="t2" type="text" placeholder="First Name" id="textb1"/></td>
	      <td>
                  <input name="t8" type="text" placeholder="Department" id="textb1"/></td>
        </tr>
	    <tr>
	      <td>
                  <input name="t3" type="text" placeholder="Last Name" id="textb1"></td>
	      <td>
		<input name="t9" type="text" placeholder="Email ID" id="textb1"/></td>
        </tr>
	    <tr>
	      <td>
		<input name="t4" type="text" placeholder="Gender" id="textb1"/></td>
	      <td>
		<input name="t10" type="text"  placeholder="Mobile Number" id="textb1"/></td>
        </tr>
	    <tr>
	      <td>
		<input name="t5" type="text" size="20" placeholder="DOB(dd-Mon-yyyy)" id="textb1"/></td>
	      <td>
		<input name="t11" type="text" placeholder="Username" id="textb1"/></td>
        </tr>
	    <tr>
	      <td>
		<input name="t6" type="text" placeholder="Designation" id="textb1"/></td>
	      <td>
		<input name="t12" type="text" placeholder="Password" id="textb1"/></td>
        </tr>
        <tr>
          <td colspan="4">
              <input type="submit" id="button" value="Send" style="float: right"/></td>
        </tr>
        </table>
                    </div>
            </form>
        </div>
        </div>
        
        <div id="listfaculty">
        <div id="logcon1">
            <form>
                    <span onclick="document.getElementById('listfaculty').style.display='none';document.getElementById('facultypopup').style.display='none';" id="close">&times;</span>
                    <%
            Connection cn;
            Statement st;
            ResultSet rs;
            int cnt=0;
            String sql = "select * from Faculty Order By FacultyID";
            try
            {
                Class.forName("oracle.jdbc.OracleDriver");
                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = st.executeQuery(sql);
                while(rs.next())
                {
                    cnt++;
                }
            
        %>
        <table border="1" width="70%">
                        <tr >
                            <td colspan="12">
                                <h3 align="center">List of BITM Faculties</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>Faculty ID</td>
                            <td>First Name</td>
                            <td>Last Name</td>
                            <td>Gender</td>
                            <td>Date of Birth</td>
                            <td>Designation</td>
                            <td>Master Subject</td>
                            <td>Department</td>
                            <td>Email Id</td>
                            <td>Mobile No</td>
                            <td>User Name</td>
                            <td>Password</td>
                        </tr>
                        <%
                        rs.first();
                        do
                        {
                            %>
                            <tr>
                            <td><%=rs.getInt(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getDate(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><%=rs.getString(8)%></td>
                            <td><%=rs.getString(9)%></td>
                            <td><%=rs.getLong(10)%></td>
                            <td><%=rs.getString(11)%></td>
                            <td><%=rs.getString(12)%></td>
                            </tr>
                            <%
                        }while(rs.next());
            }
            catch(Exception e)
            {
                session.setAttribute("msg2", "ModifyError");
                response.sendRedirect("AdminFaculty.jsp");
            }
                        %>
                    </table>
                    <input type="button" id="button" value="Go Back" onclick="document.getElementById('facultypopup').style.display='block';document.getElementById('listfaculty').style.display='none';"/>
            </form>
        </div>
        </div>
        
        
        <div id="studentpopup">
        <div id="logstudent">
            <form>
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                        <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('facultypopup').style.display='block'"><li><a href="#">Add Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('facultypopup').style.display='block'"><li><a href="#">Modify Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('facultypopup').style.display='block'"><li><a href="#">Delete Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('facultypopup').style.display='block'"><li><a href="#">list Student</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('studentpopup').style.display='none'" id="close">&times;</span>
                    </div>
            </form>
        </div>
        </div>
    </body>
</html>
