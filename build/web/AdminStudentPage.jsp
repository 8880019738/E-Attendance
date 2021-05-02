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
                        <span style="cursor: default;" onclick="document.getElementById('studentpopup').style.display='block'"><li><a>Student</a></li></span>
                        <li><a href="AdminTimeTablePage.jsp">Timetable</a></li></span>
                        <li><a href="AdminLogout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
            </div>
        <div class="wrapper light">
            <div id="content">
                <div style="width: 950px; height: 321px;color: white;"><h3 align="left" style="font-size: 30px;margin: 50px 0px 0px 50px;color: black;">Welcome TO Student Page, Please Click On Student To Continue..</h3>
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
        <div id="studentpopup">
        <div id="logstudent">
            <form action="AdminLogin">
                   <div id="loglogo">
                        <img src="images/logo.JPG"/>
                         <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addstudent').style.display='block'"><li><a href="#">Add Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('modifystudent').style.display='block'"><li><a href="#">Modify Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('deletestudent').style.display='block'"><li><a href="#">Delete Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('liststudent').style.display='block'"><li><a href="#">list Student</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('studentpopup').style.display='none'" id="close">&times;</span>
                    <h1>Welcome To Student Data Handling Page...</h1>
                    </div>
            </form>
        </div>
        </div>
                    
           
        <div id="addstudent">
        <div id="logstudent">
            <form action="AddStudent">
                   <div id="loglogo">
                        <img src="images/logo.JPG"/>
                         <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addstudent').style.display='block'"><li><a href="#">Add Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('modifystudent').style.display='block'"><li><a href="#">Modify Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('deletestudent').style.display='block'"><li><a href="#">Delete Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('liststudent').style.display='block'"><li><a href="#">list Student</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('addstudent').style.display='none';document.getElementById('studentpopup').style.display='none'" id="close">&times;</span>
          
	  <table>
	    <tr>
	      <td><h1>Student Data Entry Form !</h1></td>
        </tr>
	    <tr>
	      <td>
                  <input name="t1" type="text" placeholder="Student ID" id="textb1"/></td>
            </tr>
            <tr>
	      <td>
			<input name="t2" type="text" placeholder="First Name" id="textb1"/></td>
	      <td>
			<input name="t3" type="text" placeholder="Last Name" id="textb1"/></td>
        </tr>
        <tr>
	      <td>
			<input name="t4" type="text" placeholder="Gender" id="textb1"/></td>
	      <td>
			<input name="t5" type="text" placeholder="DOB(dd-Mon-yyyy)" id="textb1"/></td>
	    
        </tr>
        <tr>
            <td><select name="t6" id="combo1">
                                        <option>Department</option>
                                        <option>DCS</option>
                                        <option>DEE</option>
                                        <option>DME</option>
                                        <option>DEC</option>
                                        <option>DCE</option>
                                        <option>DMT</option>
                                    </select></td>
        </tr>
        <tr>
	    <td><select name="t7" id="combo1">
                                        <option style="opacity: 0.1">Semester</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                    </select></td>
            <td><select name="t3" id="combo1">
                                        <option style="opacity: 0.1">Section</option>
                                        <option>A</option>
                                        <option>B</option>
                                        <option>C</option>
                                        <option>D</option>
                                        <option>E</option>
                                    </select></td>
        </tr>
	    <tr>
	      <td>
			<input name="t9" type="text" placeholder="User Name" id="textb1"/></td>
	      <td>
			<input name="t10" type="text" placeholder="Password" id="textb1"/></td>
        </tr>
	    <tr>
        </tr>
        </table><input type="submit" id="button" value="Add Student"/>
                    </div>
            </form>
        </div>
        </div>
                    
        
        <div id="modifystudent">
        <div id="logstudent">
            <form action="ModifyStudent.jsp">
                   <div id="loglogo">
                        <img src="images/logo.JPG"/>
                         <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addstudent').style.display='block'"><li><a href="#">Add Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('modifystudent').style.display='block'"><li><a href="#">Modify Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('deletestudent').style.display='block'"><li><a href="#">Delete Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('liststudent').style.display='block'"><li><a href="#">list Student</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('modifystudent').style.display='none';document.getElementById('studentpopup').style.display='none'" id="close">&times;</span>
                    <table>
					<tr>
						<td><strong><label for="name">Enter Student ID:<strong></label></td>
						<td>
						<input type="text" maxlength="30" id="name" name="t1" size="20" /> </td>
						<td>&nbsp;</td> 
						<td>&nbsp;</td>
					</tr>
					
					<tr>
						<td class="message">&nbsp;</td>
						<td colspan="3"><input type="submit" value="Modify" id="send" /></td>
					</tr>
					</table>
                    </div>
            </form>
        </div>
        </div>
                    
        <div id="deletestudent">
        <div id="logstudent">
            <form action="DeleteStudent">
                   <div id="loglogo">
                        <img src="images/logo.JPG"/>
                         <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addstudent').style.display='block'"><li><a href="#">Add Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('modifystudent').style.display='block'"><li><a href="#">Modify Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('deletestudent').style.display='block'"><li><a href="#">Delete Student</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('liststudent').style.display='block'"><li><a href="#">list Student</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                    <span onclick="document.getElementById('deletestudent').style.display='none';document.getElementById('studentpopup').style.display='none'" id="close">&times;</span>
                    <table>
					<tr>
						<td><strong><label for="name">Enter Student ID:<strong></label></td>
						<td>
						<input type="text"id="name" name="t1"/> </td>
						<td>&nbsp;</td> 
						<td>&nbsp;</td>
					</tr>
					
					<tr>
						<td class="message">&nbsp;</td>
						<td><input type="submit" value="Delete" id="button" /></td>
					</tr>
					</table>
                    </div>
            </form>
        </div>
        </div>
                    
        <div id="liststudent">
        <div id="popupin">
            <form>
                <%
                  Connection cn;
            Statement st;
            ResultSet rs;
            int cnt=0;
            String sql = "select * from student Order By Student_id";
            
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
                                <h3 align="center">List of Students</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>Student ID</td>
                            <td>First Name</td>
                            <td>Last Name</td>
                            <td>Gender</td>
                            <td>Date of Birth</td>
                            <td>Department</td>
                            <td>Semester</td>
                            <td>Section</td>
                        </tr>
                        <%
                        rs.first();
                        do
                        {
                            %>
                            <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getDate(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getInt(7)%></td>
                            <td><%=rs.getString(8)%></td>
                            </tr>
                            <%
                        }while(rs.next());
                        %>
                       </table> 
                    <input type="button" id="button" value="Go Back" onclick="document.getElementById('studentpopup').style.display='block';document.getElementById('liststudent').style.display='none'">
            </form>
        </div>
        </div>
    </body>
</html>
