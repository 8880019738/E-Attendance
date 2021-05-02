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
            String student = "", sid = "";
            if ((student = (String) session.getAttribute("sname")) == "" || (student = (String) session.getAttribute("sname")) == null) {
                response.sendRedirect("index.html");
            }
            sid = (String) session.getAttribute("sid");
        %>
        <div class="popupout">
            <div id="popupin">
            <%
            Connection cn;
            Statement st;
            ResultSet rs;
            int cnt = 0, ac = 0, attendancepercent = 0;
            String sub;
            sub = request.getParameter("t1");
            String sql = "select count(*) from StudentAttendance where Studentid = '"+sid+"' and subject='"+sub+"' group by studentid ,subject";
            try
            {
                Class.forName("oracle.jdbc.OracleDriver");
                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = st.executeQuery(sql);
                rs.first();
                cnt = rs.getInt(1);
                
                sql = "select count(*) from StudentAttendance where Studentid = '"+sid+"' and subject='"+sub+"' and status='Present' group by studentid ,subject";
                rs = st.executeQuery(sql);
                rs.first();
                ac = rs.getInt(1);
                attendancepercent = ( ac * 100 ) / cnt;
            
        %>
        
        <table>
            <tr>
                <td>
                    <h1>Your Attendance Percentage is</h1>
                </td>
                <td><h1><b><%=attendancepercent%></b></h1></td>
            </tr>
        </table>
            
             <a href="StudentSuccess.jsp" id="alink">Go Back</a>
        <%
        }
        catch(Exception e)
        {
             %><h1>Error</h1><br/>
             <a href="StudentSuccess.jsp" id="alink">Go Back</a><%
        }
        %>
        </div>
        </div>
        
    </body>
</html>
