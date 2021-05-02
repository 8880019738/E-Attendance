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
        <div class="wrapper light">
        <div id="popupin">
                <%
            Connection cn;
            Statement st, st1;
            ResultSet rs, rs1;
            int cnt=0, sem;
            String sec,dept, sub;
            dept = request.getParameter("t1");
            sem = Integer.parseInt(request.getParameter("t2"));
            sec = request.getParameter("t3");
            sub = request.getParameter("d1");
            String sql = "select distinct sadate from studentattendance where department='"+dept+"' and semester="+sem+" and section='"+sec+"' and subject='"+sub+"' order by sadate";
            String fac = (String)session.getAttribute("username");
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
                rs.beforeFirst();
            
        %>
        <form action="PrincipalAttendanceToday.jsp">
        <table>
            <tr>
                <td>Faculty Name</td>
                <td style="color:red;font-size: 20px"><%=fac%></td>
                <td>Department</td>
                <td style="color:red;font-size: 20px"><%=dept%></td>
                <td>Semester</td>
                <td style="color:red;font-size: 20px"><%=sem%></td>
            </tr>
        </table>
                <%
                  
                }
                catch(Exception e)
                {
                 response.sendRedirect("ShowAttendanceError.jsp");
                }
                %>
            <%
                try
                {
               int total = 0, present = 0, absent = 0;
               sql = "select count(*)from studentattendance where department='"+dept+"' and semester="+sem+" and section='"+sec+"' and subject='"+sub+"' and status='Present' order by studentid,sadate";
               cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
               st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
               rs = st.executeQuery(sql);
               
               sql = "select count(*)from student where department='"+dept+"' and semester="+sem+" order by student_id";
               cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
               st1 = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
               rs1 = st1.executeQuery(sql);
               
               rs.first();
               present = rs.getInt(1);
               
               rs1.first();
               total = rs1.getInt(1);
               
               absent = total - present;
               %>
               <table>
                       <tr>
                           <td>Total Number Of Students</td>
                           <td><%=total%></td>
                       </tr><tr>
                           <td>Total Number Of Students Present</td>
                           <td><%=present%></td>
                       </tr><tr>
                           <td>Total Number Of Students Absent</td>
                           <td><%=absent%></td>
                       </tr>
                   </table>
               <%
               }
               catch(Exception e)
               { 
                 response.sendRedirect("ShowAttendanceError.jsp");
               }
                    %>
              
        </form>
                   <a href="PrinciSuccess.jsp" id="alink">Go Back</a>
            </div>
        </div>
    </body>
</html>
