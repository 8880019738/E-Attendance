<%@page import="java.util.Enumeration"%>
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
                    response.sendRedirect("FacultyLoginPage.jsp");
                } 
        %>
            <div id="popupin">
                <div style="margin: 40px 0px 0px 0px 40px;"><h3>Student Attendance Was Marked Successfully</h3></div>
                        <%
                            Connection cn;
                            Statement st;
                            PreparedStatement pst;
                            ResultSet rs;
                            String sql;
                            try {
                                boolean flag = false;
                                sql = "insert into StudentAttendance values(?,?,?,?,?,?,?,?,?)";
                                Class.forName("oracle.jdbc.OracleDriver");
                                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "hr", "superman");
                                pst = cn.prepareStatement(sql);
                                

                            Enumeration en = request.getParameterNames();
                            Object ob;
                            String pn;
                            String pv;
                            String dt = request.getParameter((String) en.nextElement());
                            String fac = request.getParameter((String) en.nextElement());
                            String sub = request.getParameter((String) en.nextElement());
                            String dept = request.getParameter((String) en.nextElement());
                            int sem = Integer.parseInt(request.getParameter((String) en.nextElement()));
                            String sec = request.getParameter((String) en.nextElement());
                            String hour = request.getParameter((String) en.nextElement());
                            java.util.Date dd = new java.util.Date(dt);
                            Date d = new Date(dd.getTime());
                            while (en.hasMoreElements()) {
                                pst.setDate(1, d);
                                ob = en.nextElement();
                                pn = (String) ob;
                                pv = request.getParameter(pn);
                                pst.setString(2, pv);
                                pst.setString(3, fac);
                                pst.setString(4, sub);
                                ob = en.nextElement();
                                pn = (String) ob;
                                pv = request.getParameter(pn);
                                pst.setString(5, pv);
                                pst.setInt(6, sem);
                                pst.setString(7, dept);
                                pst.setString(8, sec);
                                pst.setString(9, hour);
                            pst.executeUpdate();
                            }
                            } catch (Exception e) {
                                session.setAttribute("msg", "Error");
                            }
                        %>
                    <a href="FacultySuccess.jsp" id="button">Go Back</a>
                </div>
            </div>
    </body>
</html>
