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
        String admin="";
                
                if((admin = (String)session.getAttribute("admin"))=="" || (admin = (String)session.getAttribute("admin"))==null)
                {
                    response.sendRedirect("AdminLoginPage.jsp");
                }
        %>
        <div class="popupout">
            <div id="popupin">
                <form action="AddTimeTable">
                <% Connection cn = null;
            Statement st = null;
            ResultSet rs = null;
            int sem = Integer.parseInt(request.getParameter("t1"));
            String sec = request.getParameter("t2");
            String sql = "select * from Faculty where department='"+admin+"' order by FacultyID";
            try
            {
                Class.forName("oracle.jdbc.OracleDriver");
                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = st.executeQuery(sql);
            }
            catch(Exception e)
            {
                session.setAttribute("msg3", "TimeTableError");
                response.sendRedirect("AdminTimeTablePage.jsp");
            }
    %>
    <table>
        <tr>
            <td>Department</td>
            <td><input type="text" name="t1" value="<%=admin%>" style="border: none;font-size: 15px;color: red;"/></td>
            <td>Semester</td>
            <td><input type="text" name="t2" value="<%=sem%>" style="border: none;font-size: 15px;color: red;"/></td>
            <td>Section</td>
            <td><input type="text" name="t3" value="<%=sec%>" style="border: none;font-size: 15px;color: red;"/></td>
        </tr>
    </table>
    <table>
	    <tr>
	      <td><h3 align="center">Time Table Data Entry Form !</h3></td>
        </tr>
	    <tr>
	      <td><b>Weekday</b></td>
	      <td>
			<select size="1" name="wd">
			<option selected value="Monday">Monday</option>
			<option value="Tuesday">Tuesday</option>
			<option value="Wednesday">Wednesday</option>
			<option value="Thursday">Thursday</option>
			<option value="Friday">Friday</option>
			<option value="Saturday">Saturday</option>
			<option value="Sunday">Sunday</option>
			</select> </td>
            </tr>
	    <tr>
	      <td><b>Slot 1 Faculty</b></td>
	      <td>
                  <select size="1" name="F1">
                        <%
                            try
                            {
                                rs.first();
                                do
                                {
                                    %>
                                    <option value='<%=rs.getString(7)%>'><%=rs.getString(7)%></option>
                                    <%
                                }while(rs.next());
                            }
                            catch(Exception e)
                            {
                                session.setAttribute("msg3", "TimeTableError");
                            }
                        %>
			</select>
		  </td>
        </tr>
	    <tr>
	      <td><b>Slot 2 Faculty</b></td>
	      <td>
                  <select size="1" name="F2">
			<%
                            try
                            {
                                rs.first();
                                do
                                {
                                    %>
                                    <option value='<%=rs.getString(7)%>'><%=rs.getString(7)%></option>
                                    <%
                                }while(rs.next());
                            }
                            catch(Exception e)
                            {
                                session.setAttribute("msg3", "TimeTableError");
                            }
                        %>
			</select>
		  </td>
        </tr>
	    <tr>
	      <td><b>Slot 3 Faculty</b></td>
	      <td>
                  <select size="1" name="F3">
                        <%
                            try
                            {
                                rs.first();
                                do
                                {
                                    %>
                                    <option value='<%=rs.getString(7)%>'><%=rs.getString(7)%></option>
                                    <%
                                }while(rs.next());
                            }
                            catch(Exception e)
                            {
                                session.setAttribute("msg3", "TimeTableError");
                            }
                        %>	
			</select>
		  </td>
        </tr>
	    <tr>
	      <td><b>Slot 4 Faculty</b></td>
	      <td>
                  <select size="1" name="F4">
                        <%
                            try
                            {
                                rs.first();
                                do
                                {
                                    %>
                                    <option value='<%=rs.getString(7)%>'><%=rs.getString(7)%></option>
                                    <%
                                }while(rs.next());
                            }
                            catch(Exception e)
                            {
                                System.out.println("Time Table Error : "+e);
                                session.setAttribute("msg3", "TimeTableError");
                            }
                        %>	
			</select>
		  </td>
        </tr>
        <tr>
	      <td><b>Slot 5 Faculty</b></td>
	      <td>
                  <select size="1" name="F5">
			<%
                            try
                            {
                                rs.first();
                                do
                                {
                                    %>
                                    <option value='<%=rs.getString(7)%>'><%=rs.getString(7)%></option>
                                    <%
                                }while(rs.next());
                            }
                            catch(Exception e)
                            {
                                session.setAttribute("msg3", "TimeTableError");
                            }
                        %>
			</select>
		  </td>
        </tr>
        <tr>
	      <td><b>Slot 6 Faculty</b></td>
	      <td>
                  <select size="1" name="F6">
			<%
                            try
                            {
                                rs.first();
                                do
                                {
                                    %>
                                    <option value='<%=rs.getString(7)%>'><%=rs.getString(7)%></option>
                                    <%
                                }while(rs.next());
                            }
                            catch(Exception e)
                            {
                                session.setAttribute("msg3", "TimeTableError");
                            }
                        %>
			</select>
		  </td>
        </tr>
        <tr>
	      <td><b>Slot 7 Faculty</b></td>
	      <td>
                  <select size="1" name="F7">
			<%
                            try
                            {
                                rs.first();
                                do
                                {
                                    %>
                                    <option value='<%=rs.getString(7)%>'><%=rs.getString(7)%></option>
                                    <%
                                }while(rs.next());
                            }
                            catch(Exception e)
                            {
                                session.setAttribute("msg3", "TimeTableError");
                            }
                        %>
			</select>
		  </td>
        </tr>
        <tr>
          <td>
			<input type="submit" id="button" value="Add" style="float: right"/></td>
        </tr>
        </table>
                    </div>
            </form>
                        </tr>
                        <a href="AdminTimeTablePage.jsp" id="alink">Go Back</a>
                    </table>
    </div>
        </div>
        
    </body>
</html>
