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
            int fid = Integer.parseInt(request.getParameter("t1"));
            Connection cn;
            Statement st;
            ResultSet rs;
            String sql = "select * from faculty where facultyid = "+fid;
            long mno=0;
            String fn="", ln="", gn="", dob="", dg="", ms="", dp="", em="", un="", ps="";
            int dd,mm,yy;
            try
            {
                Class.forName("oracle.jdbc.OracleDriver");
                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = st.executeQuery(sql);
                rs.first();
                fid = rs.getInt(1);
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
                un = rs.getString(7);
                ps = rs.getString(8);
            }
            catch(Exception e)
            {
                session.setAttribute("msg", "ModifyError");
                response.sendRedirect("AdminFaculty.jsp");
            }
        %>
        
        <form action="ModifyFaculty">
	  <table width="706">
	    <tr>
	      <td width="702" colspan="4"><h3 align="center">Faculty Data Modification Form !</h3></td>
        </tr>
	    <tr>
	      <td>
                  <input name="t1" type="text" placeholder="Faculty ID"  value="<%=fid%>" id="textb1"/>
	      <td></td>
        </tr>
	    <tr>
	      <td>
		<input name="t2" type="text" placeholder="First Name" value="<%=fn%>" id="textb1"/></td>
	      <td>
                  <input name="t6" type="text" placeholder="Department" value="<%=dp%>" id="textb1"/></td>
        </tr>
	    <tr>
	      <td>
                  <input name="t3" type="text" placeholder="Last Name" value="<%=ln%>" id="textb1"></td>
        </tr>
	    <tr>
	      <td>
		<input name="t4" type="text" placeholder="Gender" value="<%=gn%>" id="textb1"/></td>
        </tr>
	    <tr>
	      <td>
		<input name="t5" type="text" size="20" placeholder="DOB(dd-Mon-yyyy)" value="<%=dob%>" id="textb1"/></td>
	      <td>
		<input name="t7" type="text" placeholder="Username" value="<%=un%>" id="textb1"/></td>
        </tr>
	    <tr>
	      <td>
	      <td>
		<input name="t8" type="text" placeholder="Password" value="<%=ps%>" id="textb1"/></td>
        </tr>
        <tr>
          <td colspan="4">
			<input type="submit" id="send" value="Send" style="float: right" tabindex="13" /></td>
        </tr>
        </table>
      </form>
        </div> 
    </body>
</html>
