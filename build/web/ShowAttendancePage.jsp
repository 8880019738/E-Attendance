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
        <div id="content">
                <%
            Connection cn;
            Statement st, st1;
            ResultSet rs, rs1;
            int cnt=0,sem;
            String sec,dept,sub;
            dept = request.getParameter("t1");
            sem = Integer.parseInt(request.getParameter("t2"));
            sec = request.getParameter("t3");
            sub = request.getParameter("t4");
            String sql = "select distinct sadate from studentattendance where department='"+dept+"' and semester="+sem+" and faculty='"+faculty+"' and subject='"+sub+"' order by sadate";
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
        <table>
            <tr>
                <td>Faculty Name</td>
                <td style="color: blue;font-size: 20px"><%=fac%></td>
                <td>Department</td>
                <td style="color: blue;font-size: 20px"><%=dept%></td>
                <td>Semester</td>
                <td style="color: blue;font-size: 20px"><%=sem%></td>
            </tr>
        </table>
        <table>
            <tr>
                <td>Student RegNO</td>
                <td>Student Name</td>
                <%
                  while(rs.next())
                  {
                      %><td><%=rs.getString(1)%></td><%
                  }
                }
                catch(Exception e)
                {
                 response.sendRedirect("FacultyError.jsp");
                }
                %>
            </tr>
            <%
               sql = "select sadate,status from studentattendance where department='"+dept+"' and semester="+sem+" and faculty='"+faculty+"' and subject='"+sub+"' order by studentid,sadate";
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
                       <td style="color: blue"><%=rs1.getString(1)%></td>
                       <td style="color: blue"><%=rs1.getString(2)+" "+rs1.getString(3)%></td>
                    <%  
                        int c = cnt;
                        while( cnt != 0 )
                       {
                    %>
                       <td><%=rs.getString(2)%></td><%rs.next();cnt--;%>
                   <%
                       
                       }
                      cnt = c;
               }
                   %>
              
        </table>
                   <a href="FacultySuccess.jsp" id="alink">Go Back</a>
            </div>
    </body>
</html>
