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
        <div id="content">
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
        <table>
            <tr>
                <td>Student RegNO</td>
                <td>Student Name</td>
                <td>Total Percentage</td>
                <%
                  
                }
                catch(Exception e)
                {
                 response.sendRedirect("ShowAttendanceError.jsp");
                }
                %>
            </tr>
            <%
                try
                {
               sql = "select sadate,status from studentattendance where department='"+dept+"' and semester="+sem+" and section='"+sec+"' and subject='"+sub+"' order by studentid,sadate";
               cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
               st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
               rs = st.executeQuery(sql);
               
               sql = "select *from student where department='"+dept+"' and semester="+sem+" order by student_id";
               cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
               st1 = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
               rs1 = st1.executeQuery(sql);
               
               rs.first();
               while(rs1.next())
               {
                   %><tr>
                       <td style="color: green"><input type="text" name="t1" value="<%=rs1.getString(1)%>" style="border: none;color: green;"/></td>
                       <td style="color: green"><%=rs1.getString(2)+" "+rs1.getString(3)%></td>
                    <%  
                        int c = cnt, total = 0, percent = 0;
                        while( cnt != 0 )
                       {
                    if(rs.getString(2).equals("Present"))
                       {
                          total++; 
                       }rs.next();cnt--;
                       }
                      cnt = c;
                      percent = ( total * 100 ) / c;
                      %>
                       <td><%=percent%></td>
                       <td><input type="submit" value="Get Todays Attendance" id="button"/></td>
                    <%
               }
               }
               catch(Exception e)
               { 
                 response.sendRedirect("ShowAttendanceError.jsp");
               }
                    %>
              
        </table>
        </form>
                   <a href="PrinciSuccess.jsp" id="alink">Go Back</a>
            </div>
        </div>
    </body>
</html>
