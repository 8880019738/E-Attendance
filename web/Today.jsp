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
                        Statement st, st1, st2;
                        ResultSet rs, rs1, rs2; 
                        String month = null, week = null;
                    GregorianCalendar cal = new GregorianCalendar();
                                int mon = cal.get(GregorianCalendar.MONTH);
                                int wk = cal.get(GregorianCalendar.DAY_OF_WEEK);
                                int year = cal.get(GregorianCalendar.YEAR);
                                int date = cal.get(GregorianCalendar.DATE);
                                mon = mon+1;
                    if( mon == 1 )
                    {
                        month = "Jan";
                    }
                    else if( mon == 2 )
                    {
                        month = "Feb";
                    }
                    else if( mon == 3 )
                    {
                        month = "Mar";
                    }
                    else if( mon == 4 )
                    {
                        month = "Apr";
                    }
                    else if( mon == 5 )
                    {
                        month = "May";
                    }
                    else if( mon == 6 )
                    {
                        month = "Jun";
                    }
                    else if( mon == 7 )
                    {
                        month = "Jul";
                    }
                    else if( mon == 8 )
                    {
                        month = "Aug";
                    }
                    else if( mon == 9 )
                    {
                        month = "Sep";
                    }
                    else if( mon == 10 )
                    {
                        month = "Oct";
                    }
                    else if( mon == 11 )
                    {
                        month = "Nov";
                    }
                    else if( mon == 12 )
                    {
                        month = "Dec";
                    }
                    
                    if( wk == 1 )
                    {
                        week = "Sunday";
                    }
                    else if( wk == 2 )
                    {
                        week = "Monday";
                    }
                    else if( wk == 3 )
                    {
                        week = "Tuesday";
                    }
                    else if( wk == 4 )
                    {
                        week = "Wednesday";
                    }
                    else if( wk == 5 )
                    {
                        week = "Thursday";
                    }
                    else if( wk == 6 )
                    {
                        week = "Friday";
                    }
                    else if( wk == 7 )
                    {
                        week = "Saturday";
                    }
                 String day =  date+"-"+month+"-"+year;
                  int count = 0, flag = 0;
                 String sql = "select *from studentattendance where sadate='"+day+"' and studentid='"+sid+"' order by hour";
                 try
                 {
                Class.forName("oracle.jdbc.OracleDriver");
                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = st.executeQuery(sql);
                while(rs.next())
                {
                    count++;
                }
                rs.beforeFirst();
                
                    %>
                    <table>
                        <tr>
                            <td><%=week%></td>
                            <td>Hour1</td>
                            <td>Hour2</td>
                            <td>Hour3</td>
                            <td>Hour4</td>
                            <td>Hour5</td>
                            <td>Hour6</td>
                            <td>Hour7</td>
                        </tr>
                        <tr>
                            <td></td>
                                <%
                                    while(count != 0)
                                    {
                                        count--;
                                    while(rs.next())
                                    {
                                        if( rs.getInt(9) == 1 )
                                        {
                                             %><td><%=rs.getString(5)%></td><%
                                             break;
                                        }
                                        if( rs.getInt(9) == 2 )
                                        {
                                             %><td><%=rs.getString(5)%></td><%
                                             break;
                                        }
                                        if( rs.getInt(9) == 3 )
                                        {
                                             %><td><%=rs.getString(5)%></td><%
                                             break;
                                        }
                                        if( rs.getInt(9) == 4 )
                                        {
                                             %><td><%=rs.getString(5)%></td><%
                                             break;
                                        }
                                        if( rs.getInt(9) == 5 )
                                        {
                                             %><td><%=rs.getString(5)%></td><%
                                             break;
                                        }
                                        if( rs.getInt(9) == 6 )
                                        {
                                             %><td><%=rs.getString(5)%></td><%
                                             break;
                                        }
                                        if( rs.getInt(9) == 7 )
                                        {
                                             %><td><%=rs.getString(5)%></td><%
                                             break;
                                        }
                                        if( flag == 0 )
                                        {
                                            %><td>Absent</td><%
                                        }
                                }
                                }
                                }
                                catch(Exception e)
                                {
                                %><h1>Error</h1><br/><%
                                }
                                %>
                        </tr>
                    </table>
                        <a href="StudentSuccess.jsp" id="alink">Go Back</a>
    </div>
        </div>
        
    </body>
</html>
