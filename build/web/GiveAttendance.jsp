<%-- 
    Document   : GiveAttendance
    Created on : Mar 22, 2018, 7:58:35 PM
    Author     : DELL
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    
    <div class="popupout">
            <div id="popupin">
               <%
            Connection cn;
            Statement st, st1;
            ResultSet rs, rs1;
            int cnt=0,sem;
            String sec,dept;
            dept = request.getParameter("t1");
            sem = Integer.parseInt(request.getParameter("t2"));
            sec = request.getParameter("t3");
            String sql = "select subject from subject where department='"+dept+"' and semester="+sem+" and section='"+sec+"'";
            String fac = (String)session.getAttribute("username");
                try
                {
                Class.forName("oracle.jdbc.OracleDriver");
                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = st.executeQuery(sql);
        %>
            <form action="PrincipalTotal.jsp">
        <table>
            <tr>
                <td>Department</td>
                <td><input type="text" name="t1" style="color:red;font-size: 20px;" value="<%=dept%>"/></td>
            <tr>
                <td>Semester</td>
                <td><input type="text" name="t2" style="color:red;font-size: 20px;" value="<%=sem%>"/></td>
            </tr>
            <tr>
                <td>Section</td>
                <td><input type="text" name="t3" style="color:red;font-size: 20px;" value="<%=sec%>"/></td>
            </tr>
            <tr>
                <td></td>
                <td><select name="d1" id="combo" style="margin-left: 20px;">
               <%
                   while(rs.next())
                   {
                   %><option><%=rs.getString(1)%></option><%
                   }
                }
                catch(Exception e)
                {
                   %><h1><%=e%></h1><%
                }
               %>
                    </select></td>
            <tr>
                <td><input type="submit" value="Send" id="button"/></td>
            </tr>
        </table>
            </form>
            </div>
        </div>
    </body>
</html>
