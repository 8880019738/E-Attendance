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
        <div class="popupout">
            <div id="popupin">
                <%
                    String wd = request.getParameter("wd");
                    String fac = (String) session.getAttribute("username");
                    Connection cn;
                    Statement st,st2 = null;
                    ResultSet rs,rs2=null;
                    int slt = 0;
                    
                    String sql = "select * from TimeTable1 where weekday = '" + wd + "' and (SLOT1_FACUTLY= '" + fac + "' or SLOT2_FACULTY= '" + fac + "' or SLOT3_FACULTY= '" + fac + "' or SLOT4_FACULTY= '" + fac + "' or SLOT5_FACULTY= '" + fac + "' or SLOT6_FACULTY= '" + fac + "' or SLOT7_FACULTY= '" + fac + "' )";
                    try 
                    {
                        Class.forName("oracle.jdbc.OracleDriver");
                        cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "hr", "superman");
                        st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        rs = st.executeQuery(sql);
                        rs.first();
                        if (rs.getString(2).equals(fac)) {
                            slt = 1;
                        } else if (rs.getString(3).equals(fac)) {
                            slt = 2;
                        } else if (rs.getString(4).equals(fac)) {
                            slt = 3;
                        } else if (rs.getString(5).equals(fac)) {
                            slt = 4;
                        } else if (rs.getString(5).equals(fac)) {
                            slt = 5;
                        } else if (rs.getString(5).equals(fac)) {
                            slt = 6;
                        } else if (rs.getString(5).equals(fac)) {
                            slt = 7;
                        }
                        rs2 = st.executeQuery("select firstname from faculty where firstname not in('"+fac+"')");
                        rs2.first();
                    } catch (Exception e) {
                        session.setAttribute("msg", "NoData");
                        response.sendRedirect("FacultyTimeTablePage.jsp");
                    }
                %>
                <form action="SlotTransfer">
                    <div><h3 align="center" style="padding: 15px;">Transfer Slot to Other 
                                    Faculty Form !</h3></div>
                    <table>
                        <tr>
                            <td>
                                <p><b>Weekday</b></td>
                            <td>
                                <input name="T1" size="20" value="<%=wd%>" id="textb" style="float: left"></td>
                        </tr>
                        <tr>
                            <td>
                                <p><b>Slot Number</b></td>
                            <td>
                                <input name="T2" size="20" value="<%=slt%>" id="textb" style="float: left"></td>
                        </tr>
                        <tr>
                            <td >
                                <p><b>Faculty Transferring</b></td>
                            <td>
                                <input name="T3" size="20" value="<%=fac%>" id="textb" style="float: left"></td>
                        </tr>
                        <tr>
                            <td>
                                <p><b>Transfer To Faculty</b></td>
                            <td>
                                <p>
                                    <select size="1" name="T4" id="combo">
                                        <%
                                            try {
                                                rs2.first();
                                                do {
                                        %>
                                        <option value='<%=rs2.getString(1)%>'><%=rs2.getString(1)%></option>
                                        <%
                                                } while (rs2.next());
                                            } catch (Exception e) {
                                                session.setAttribute("msg3", "TimeTableError");
                                            }
                                        %>
                                    </select></td>
                        </tr>
                        <tr>
                            <td>
                                <p><b>Subject</b></p>
                            </td>
                                <td><select name="T5" id="combo">
                                    <%
                                        sql = "select subject from subject where faculty='"+faculty+"'";
                        cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "hr", "superman");
                        st2 = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                        rs = st2.executeQuery(sql);
                                       while(rs.next())
                                       {
                                        %><option><%=rs.getString(1)%></option><%
                                       }
                                    %>
                                    </select></td>
                            </tr>
                        <tr>
                            <td>
                                <input type="submit" id="button" value="Tranfer" style="float: left" /></td>
                        </tr>
                    </table>
                                    <a href="javascript:history.go(-1)" id="button" >Go Back</a>
                </form>
            </div>
        </div>
    </body>
</html>
