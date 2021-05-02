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
                        <span style="cursor: default;" onclick="document.getElementById('attendancepopup').style.display='block'"><li><a>Attendance</a></li></span>
                        <li><a href="FacultyTimeTablePage.jsp">Timetable</a></li>
                        <span style="cursor: default;" onclick="document.getElementById('subject').style.display = 'block'"><li><a>Add Subject</a></li></span>
                        <li><a href="AdminLogout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
            </div>
        <div class="wrapper light">
            <div id="content">
                <h2 style="margin: 40px 0px 0px 40px">Welcome To Attendance Page !<br/>
                Click On Attendance To Continue</h2>
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
        
        <div id="attendancepopup">
            <div id="logstudent">
                <form action="AttendancePage.jsp">
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                        <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addattendancepopup').style.display = 'block'"><li><a>Add Attendance</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('showattendancepopup').style.display = 'block'"><li><a>Show Attendance</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                        <span onclick="document.getElementById('attendancepopup').style.display = 'none'" id="close">&times;</span>
                         <%
                                            Connection cn;
                                            Statement st, st1, st2;
                                            ResultSet rs, rs1, rs2;
                                            String sql, week = null, month = null, day = null;
                                            int flag = 0, cnt1 = 0;
                                            GregorianCalendar cal = new GregorianCalendar();
                                            int wk = cal.get(GregorianCalendar.DAY_OF_WEEK);
                                            int mon = cal.get(GregorianCalendar.MONTH);
                                int year = cal.get(GregorianCalendar.YEAR);
                                int date = cal.get(GregorianCalendar.DATE);
                                mon = mon+1;
                                if( mon == 1 )
                    {
                        month = "Jan";
                    }
                    else if( mon == 2 )
                    {
                        month = "Feb";
                    }
                    else if( mon == 3 )
                    {
                        month = "Mar";
                    }
                    else if( mon == 4 )
                    {
                        month = "Apr";
                    }
                    else if( mon == 5 )
                    {
                        month = "May";
                    }
                    else if( mon == 6 )
                    {
                        month = "Jun";
                    }
                    else if( mon == 7 )
                    {
                        month = "Jul";
                    }
                    else if( mon == 8 )
                    {
                        month = "Aug";
                    }
                    else if( mon == 9 )
                    {
                        month = "Sep";
                    }
                    else if( mon == 10 )
                    {
                        month = "Oct";
                    }
                    else if( mon == 11 )
                    {
                        month = "Nov";
                    }
                    else if( mon == 12 )
                    {
                        month = "Dec";
                    }
            day =  date+"-"+month+"-"+year;
            sql = "select count(distinct hour) from studentattendance where faculty='"+faculty+"' and sadate='"+day+"'";
            cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "hr", "superman");
            st1 = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs1 = st1.executeQuery(sql);
            while( rs1.next() )        
            {
                cnt1++;
            }
            if( cnt1 <= 0 )
            {
                cnt1 = 0;
            }
            if (wk == 1) {
                                                week = "Sunday";
                                            } else if (wk == 2) {
                                                week = "Monday";
                                            } else if (wk == 3) {
                                                week = "Tuesday";
                                            } else if (wk == 4) {
                                                week = "Wednesday";
                                            } else if (wk == 5) {
                                                week = "Thursday";
                                            } else if (wk == 6) {
                                                week = "Friday";
                                            } else if (wk == 7) {
                                                week = "Saturday";
                                            }
                                            sql = "select * from timetable1 where weekday='" + week + "'";
                                            Class.forName("oracle.jdbc.OracleDriver");
                                            cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "hr", "superman");
                                            st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            rs = st.executeQuery(sql);
                                            int i = 0, cnt = 1, w = 10;
                                            rs.first();
                                            while( w > 0 )
                                            {
                                                i++;
                                                if(rs.getString(i).equals(faculty))
                                                {
                                                    cnt++;
                                                }
                                                w--;
                                            }
                                            if( cnt <= 0 )
                                            {
                                                cnt = 0;
                                            }
                                        %>
                                        <h1>The Total Number Of Hours You Have Today is<br/><%= cnt - cnt1 %></h1>
                    </div>
                </form>
            </div>
        </div>

        <div id="addattendancepopup">
            <div id="logstudent">
                <form action="AttendancePage.jsp">
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                        <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addattendancepopup').style.display = 'block'"><li><a>Add Attendance</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('showattendancepopup').style.display = 'block'"><li><a>Show Attendance</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                        <span onclick="document.getElementById('addattendancepopup').style.display = 'none';document.getElementById('attendancepopup').style.display = 'none'" id="close">&times;</span>
                        <table align="center">
                            <h1>Submit The Options For Marking The Attendance</h1>
                            <tr>
                                <td><select name="t1" id="combo">
                                        <option style="opacity: 0.1">Department</option>
                                        <%
                                        sql = "select distinct department from subject where faculty='"+faculty+"'";
                                        rs = st.executeQuery(sql);
                                       while(rs.next())
                                       {
                                        %><option><%=rs.getString(1)%></option><%
                                       }
                                    %>
                                    </select></td>
                            </tr>
                            <tr>

                                <td><select name="t2" id="combo">
                                        <option style="opacity: 0.1">Semester</option>
                                        <%
                                        sql = "select distinct semester from subject where faculty='"+faculty+"'";
                                        rs = st.executeQuery(sql);
                                       while(rs.next())
                                       {
                                        %><option><%=rs.getString(1)%></option><%
                                       }
                                    %>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><select name="t3" id="combo">
                                        <option style="opacity: 0.1">Section</option>
                                        <%
                                        sql = "select distinct section from subject where faculty='"+faculty+"'";
                                        rs = st.executeQuery(sql);
                                       while(rs.next())
                                       {
                                        %><option><%=rs.getString(1)%></option><%
                                       }
                                    %>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><select name="t4" id="combo">
                                        <option style="opacity: 0.1">Subject</option>
                                    <%
                                        sql = "select subject from subject where faculty='"+faculty+"'";
                                        String sql1 = "select subject from facultyslottransfer where faculty_to_transfer='"+faculty+"' and status='Approved'";
                                        rs = st.executeQuery(sql);
                                        cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "hr", "superman");
                                        st1 = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                        rs1 = st1.executeQuery(sql1);
                                       while(rs.next())
                                       {
                                        %><option><%=rs.getString(1)%></option><%
                                       }
                                       while(rs1.next())
                                       {
                                        %><option><%=rs1.getString(1)%></option><%
                                       }
                                    %>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><select name="t5" id="combo">
                                        <option style="opacity: 0.1">Hour</option>
                                        <%
                                            if (wk == 1) {
                                                week = "Sunday";
                                            } else if (wk == 2) {
                                                week = "Monday";
                                            } else if (wk == 3) {
                                                week = "Tuesday";
                                            } else if (wk == 4) {
                                                week = "Wednesday";
                                            } else if (wk == 5) {
                                                week = "Thursday";
                                            } else if (wk == 6) {
                                                week = "Friday";
                                            } else if (wk == 7) {
                                                week = "Saturday";
                                            }
                                            sql = "select * from timetable1 where weekday='"+week+"'";
                                            sql1 = "select slot_no from facultyslottransfer where faculty_to_transfer='"+faculty+"' and status='Approved'";
                                            Class.forName("oracle.jdbc.OracleDriver");
                                            cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "hr", "superman");
                                            st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            rs = st.executeQuery(sql);
                                            rs1 = st1.executeQuery(sql1);
                                            if(rs1.next())
                                            {
                                                flag = 1;
                                            }
                                            i = 0;
                                            cnt = 0;
                                            w = 10;
                                            int a = 0; 
                                            rs.first();
                                            sql = "select distinct hour from studentattendance where faculty='"+faculty+"' and sadate='"+day+"'";
                                            cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "hr", "superman");
                                            st2 = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            rs2 = st1.executeQuery(sql);
                                            while( w > 0 )
                                            {
                                                i++;
                                                if(rs.getString(i).equals(faculty))
                                                {
                                                    %>
                                                    <%if (i==2){%><option>1</option>
                                        <% }
                                        if (i==3){%><option>2</option>
                                        <% }                                      
                                        if (i==4){%><option>3</option>
                                        <% }
                                        if (i==5){%><option>4</option>
                                        <% }
                                        if (i==6){%><option>5</option>
                                        <% }
                                        if (i==7){%><option>6</option>
                                        <% }
                                        if (i==8){%><option>7</option>
                                        <% }
                                        if (i==9){%><option>8</option>
                                        <% }
                                                }
                                            w--;
                                            }
                                            if( flag == 1 )
                                            {
                                            %><option><%=rs1.getInt(1)%></option><%
                                            }
                                        %>
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

        <div id="showattendancepopup">
            <div id="logstudent">
                <form action="ShowAttendancePage.jsp">
                    <div id="loglogo">
                        <img src="images/logo.JPG"/>
                        <ul id="list">
                            <span style="cursor: default;" onclick="document.getElementById('addattendancepopup').style.display = 'block'"><li><a>Add Attendance</a></li></span>
                            <span style="cursor: default;" onclick="document.getElementById('showattendancepopup').style.display = 'block'"><li><a>Show Attendance</a></li></span>
                        </ul>
                    </div>
                    <div id="logcon">
                        <span onclick="document.getElementById('showattendancepopup').style.display = 'none';document.getElementById('attendancepopup').style.display = 'none'" id="close">&times;</span>
                        <table align="center">
                            <h1>Submit The Options For Displaying The Attendance</h1>
                            <tr>
                                <td><select name="t1" id="combo">
                                        <option style="opacity: 0.1">Department</option>
                                        <%
                                        sql = "select distinct department from subject where faculty='"+faculty+"'";
                                        rs = st.executeQuery(sql);
                                       while(rs.next())
                                       {
                                        %><option><%=rs.getString(1)%></option><%
                                       }
                                    %>
                                    </select></td>
                            </tr>
                            <tr>

                                <td><select name="t2" id="combo">
                                        <option style="opacity: 0.1">Semester</option>
                                        <%
                                        sql = "select distinct semester from subject where faculty='"+faculty+"'";
                                        rs = st.executeQuery(sql);
                                       while(rs.next())
                                       {
                                        %><option><%=rs.getString(1)%></option><%
                                       }
                                    %>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><select name="t3" id="combo">
                                        <option style="opacity: 0.1">Section</option>
                                        <%
                                        sql = "select distinct section from subject where faculty='"+faculty+"'";
                                        rs = st.executeQuery(sql);
                                       while(rs.next())
                                       {
                                        %><option><%=rs.getString(1)%></option><%
                                       }
                                    %>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><select name="t4" id="combo">
                                        <option style="opacity: 0.1">Subject</option>
                                    <%
                                        sql = "select subject from subject where faculty='"+faculty+"'";
                                        rs = st.executeQuery(sql);
                                       while(rs.next())
                                       {
                                        %><option><%=rs.getString(1)%></option><%
                                       }
                                    %>
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
        </div>
        </div>
    </body>
</html>
