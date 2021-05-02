<%-- 
    Document   : GetTillDate
    Created on : Mar 22, 2018, 7:58:35 PM
    Author     : DELL
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Attendance</title>
    </head>
    <body>
        <%
        String admin="";
                
                if((admin = (String)session.getAttribute("admin"))=="" || (admin = (String)session.getAttribute("admin"))==null)
                {
                    response.sendRedirect("index.html");
                }
    %>
        <div width="1000px" height="1000px">
            <%
            int sid = Integer.parseInt(request.getParameter("t1"));
            Connection cn;
            Statement st;
            ResultSet rs;
            String sql = "select * from Students where student_id = "+sid;
            long mno=0;
            String usn="", fn="", ln="", gn="", dob="", dp="", em="", un="", ps="", sec="";
            int dd,mm,yy, sem=0;
            try
            {
                Class.forName("oracle.jdbc.OracleDriver");
                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = st.executeQuery(sql);
                rs.first();
                sid = rs.getInt(1);
                fn = rs.getString(2);
                ln = rs.getString(3);
                gn = rs.getString(4);
                java.util.Date d = new Date(rs.getDate(5).getTime());
                dd = d.getDate();
                mm = d.getMonth()+1;
                yy = d.getYear();
                String sm ="";
                switch(mm)
                {
                    case 1: sm = "Jan";break;
                    case 2: sm = "Feb";break;
                    case 3: sm = "Mar";break;
                    case 4: sm = "Apr";break;
                    case 5: sm = "May";break;
                    case 6: sm = "Jun";break;
                    case 7: sm = "Jul";break;
                    case 8: sm = "Aug";break;
                    case 9: sm = "Sep";break;
                    case 10: sm = "Oct";break;
                    case 11: sm = "Nov";break;
                    case 12: sm = "Dec";break;
                }
                dob = dd+"-"+sm+"-"+yy;
                dp = rs.getString(6);
                sem = rs.getInt(7);
                sec = rs.getString(8);
                un = rs.getString(9);
                ps = rs.getString(10);
            }
            catch(Exception e)
            {
                session.setAttribute("msg2", "ModifyError");
                response.sendRedirect("AdminStudent.jsp");
            }
        %>
<form action="ModifyStudent">
	  <table>
	    <tr>
                <td><h1>Student Data Modification Form !</h1></td>
        </tr>
	    <tr>
	      <td>
                  <input name="t1" type="text" placeholder="Student ID" id="textb1" value="<%=sid%>"/></td>
            </tr>
            <tr>
	      <td>
			<input name="t2" type="text" placeholder="First Name" id="textb1" value="<%=fn%>"/></td>
	      <td>
			<input name="t3" type="text" placeholder="Last Name" id="textb1" value="<%=ln%>"/></td>
        </tr>
        <tr>
	      <td>
			<input name="t4" type="text" placeholder="Gender" id="textb1" value="<%=gn%>"/></td>
	      <td>
			<input name="t5" type="text" placeholder="DOB(dd-Mon-yyyy)" id="textb1" value="<%=dob%>"/></td>
	    
        </tr>
        <tr>
            <td><select name="t6" id="combo1" value="<%=dp%>">
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
	    <td><select name="t7" id="combo1" value="<%=sem%>">
                                        <option style="opacity: 0.1">Semester</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                    </select></td>
            <td><select name="t3" id="combo1" value="<%=sec%>">
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
			<input name="t9" type="text" placeholder="User Name" id="textb1" value="<%=un%>"/></td>
	      <td>
			<input name="t10" type="text" placeholder="Password" id="textb1" value="<%=ps%>"/></td>
        </tr>
	    <tr>
        <tr>
          <td>
			<input type="submit" id="send" value=" " style="float: right" tabindex="13" /></td>
        </tr>
        </table>
      </form>
        </div> 
    </body>
</html>
