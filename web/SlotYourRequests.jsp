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
        
        <%
                        String fac = (String)session.getAttribute("username");
                        Connection cn;
                        Statement st;
                        ResultSet rs;
                        int cnt = 0;
                        String sql = "select * from FACULTYSLOTTRANSFER where FACULTY_TRANSFERRING = '"+fac+"' order by Transfer_id";
                        System.out.println("SQL "+sql);
                        try {
                            Class.forName("oracle.jdbc.OracleDriver");
                            cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "hr", "superman");
                            st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            rs = st.executeQuery(sql);
                            while (rs.next()) {
                                cnt++;
                            }
                    %>
        <div class="popupout">
            <div id="popupin">
                                <table>
                                    <tr >
                                        <td colspan="5">
                                            <h3 align="center">Faculty <%=fac%>'s Requests</h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Transfer ID</td>
                                        <td>Weekday</td>
                                        <td>Slot</td>
                                        <td>Transfer Requested To</td>
                                        <td>Status</td>
                                    </tr>
                                    <%
                                        rs.first();
                                        do {
                                    %>
                                    <tr>
                                        <td><%=rs.getInt(1)%></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getInt(3)%></td>
                                        <td><%=rs.getString(5)%></td>
                                        <%
                                           if(rs.getString(7).equals("Approved"))
                                           {
                                        %>
                                        <td><font color="green"><%=rs.getString(7)%></font></td>
                                        <%
                                           }
                                           else if(rs.getString(7).equals("Rejected"))
                                           {
                                        %>
                                        <td><font color="red"><%=rs.getString(7)%></font></td>
                                        <%
                                           }
                                           else
                                           {
                                        %>
                                        <td><font color="Maroon"><%=rs.getString(7)%></font></td>
                                        <%
                                           }
                                        %>
                                    </tr>
                                    <%
                                            } while (rs.next());
                                        } catch (Exception e) {
                                            session.setAttribute("msg", "YourRequestError");
                                            response.sendRedirect("FacultySuccess.jsp");
                                        }
                                    %>
                                </table>
                                <a href="FacultySuccess.jsp" id="alink">Faculty Page</a>
            </div>
        </div>
        
    </body>
</html>
