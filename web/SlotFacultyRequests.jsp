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
            String fac = (String) session.getAttribute("username");
            Connection cn;
            Statement st;
            ResultSet rs;
            int cnt = 0;
            String sql = "select * from FACULTYSLOTTRANSFER where FACULTY_TO_TRANSFER = '" + fac + "' and status = 'Pending' order by Transfer_id ";
            System.out.println("SQL " + sql);
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
                <form action="SlotChangeSuccess.jsp">
                    <div><h3 align="center" style="padding: 15px;">Other Faculties Requesting Faculty <%=fac%> to handle the Slot</h3></div>
                    <table style="margin: 0px;padding: 0px;">
                        <tr>
                        </tr>
                        <%
                            int i = 0;
                            rs.first();
                            do {
                        %>
                        <tr>
                            <td>Transfer ID</td>
                            <td><input type="text" name="t<%=i++%>" readonly  value="<%=rs.getInt(1)%>" id="textb"/></td>
                        </tr>
                        <tr>
                            <td>Weekday</td>
                            <td><input type="text" name="t<%=i++%>" readonly  value="<%=rs.getString(2)%>" id="textb"/></td>
                        </tr>
                        <td>Slot</td>
                        <td><input type="text" name="t<%=i++%>" readonly  value="<%=rs.getInt(3)%>" id="textb"/></td>
                        <tr>
                            <td>Transfer Requested By</td>
                            <td><input type="text" name="t<%=i++%>" readonly  value="<%=rs.getString(5)%>" id="textb"/></td>
                        </tr>
                        <tr>
                            <td>Subject</td>
                            <td><input type="text" name="t<%=i++%>" readonly  value="<%=rs.getString(4)%>" id="textb"/></td>
                        </tr>
                        <tr>
                            <td>Status</td>
                            <td><input type="radio" name="r<%=i%>"   value="<%=rs.getString(7)%>" checked />Pending
                                    <input type="radio" name="r<%=i%>"   value="Approved" />Approve
                                    <input type="radio" name="r<%=i++%>"   value="Rejected" />Reject</td>
                        </tr>
                            <%
                                    } while (rs.next());
                                } catch (Exception e) {
                                    session.setAttribute("msg", "RequestedError");
                                    response.sendRedirect("FacultySuccess.jsp");
                                }
                            %>
                            <tr>
                                <td align="right">
                                    <input type="submit" value="Send" name="b1" id="button" />
                                </td>
                            </tr>                   

                    </table>
                            </form>
            </div>
        </div>
        
    </body>
</html>
