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
                    response.sendRedirect("index.html");
                }
    %>
        <div class="popupout">
            <div id="popupin">
                <table>
                        <%Connection cn;
            Statement st;
            ResultSet rs;
            int cnt=0, sem;
            String dept, sec;
            dept = request.getParameter("t1");
            sem = Integer.parseInt(request.getParameter("t2"));
            sec = request.getParameter("t3");
            String sql = "select * from TimeTable1 where department='"+dept+"' and semester="+sem+" and section='"+sec+"' order by weekday";
            
                Class.forName("oracle.jdbc.OracleDriver");
                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = st.executeQuery(sql);
                while(rs.next())
                {
                    cnt++;
                }
            
        %>
        <tr>
                            <td><b>Weekday</b></td>
                            <td><b>Slot 1</b></td>
                            <td><b>Slot 2</b></td>
                            <td><b>Slot 3</b></td>
                            <td><b>Slot 4</b></td>
                            <td><b>Slot 5</b></td>
                            <td><b>Slot 6</b></td>
                            <td><b>Slot 7</b></td>
                        </tr>
                        <%
                        rs.first();
                        do
                        {
                            %>
                            <tr>
                            <td><b><%=rs.getString(1)%></b></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><%=rs.getString(8)%></td>
                            </tr>
                            <%
                        }while(rs.next());
                        %>
                </table>
                        <a href="javascript:history.go(-1)" id="alink">Go Back</a>
    </div>
        </div>
        
    </body>
</html>
