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
    <a href="StudentSuccess.jsp"></a>
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    <body>
        <%
            String student = "", sid = "";
            if ((student = (String) session.getAttribute("sname")) == "" || (student = (String) session.getAttribute("sname")) == null) {
                response.sendRedirect("index.html");
            }
            sid = (String) session.getAttribute("sid");
            Connection cn;
            Statement st;
            ResultSet rs;
            String sql;
            sql = "select *from student where student_id='"+sid+"'";
            Class.forName("oracle.jdbc.OracleDriver");
            cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
            st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = st.executeQuery(sql);
            rs.first();
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
                        <span style="cursor: default;" onclick="document.getElementById('popupout').style.display='block'"><li><a href="#">Get Attendance</a></li></span>
                        <li><a href="Today.jsp">Todays Attendance</a></li></span>
                        <li><a href="AdminLogout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
            </div>
        <div class="wrapper light">
            <div id="content">
                <%
                    String msg = "";
                    if ((msg = (String) session.getAttribute("umsg")) == "" || (msg = (String) session.getAttribute("umsg")) == null) {
                        response.sendRedirect("StudentLoginPage.jsp");
                    }

                    if (msg.equals("login")) {
                %>
                <h3 align="left" style="margin: 40px;font-size: 25px;">Student <%=rs.getString(2)+" "+rs.getString(3)%> Logged In Successfully</h3>
                <%
                } else if (msg.equals("AttendanceError")) {
                %>
                <h3 align="left">No Attendance For The Specified Month</h3>
                <%
                }
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
            
            <div id="popupout">
                <div id="popupin">
                    <form action="GetTillDate.jsp">
                        <span onclick="document.getElementById('popupout').style.display='none'" id="close">&times;</span>
                        <table>
                            <tr><div><h1>Choose The Subject To Get Attendance Percentage</h1></div></tr>
                            <tr>
                                <td>
                                    <%
                                        
                                        sql = " select department,semester from student where student_id = '"+ sid +"'";
                                        Class.forName("oracle.jdbc.OracleDriver");
                                        cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                                        st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                        rs = st.executeQuery(sql);
                                        rs.first();
                                        String dept = rs.getString(1);
                                        int sem = Integer.parseInt(rs.getString(2));
                                        sql = "select subject from subject where department = '" + dept + "' and semester='"+sem+"'";
                                        rs = st.executeQuery(sql);
                                        
                
                                    %>
                                    <select name="t1" id="combo">
                                    <%
                                       while(rs.next())
                                       {
                                        %><option><%=rs.getString(1)%></option><%
                                       }
                                    %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="Get Attendance" id="button"/></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
    </body>
</html>
