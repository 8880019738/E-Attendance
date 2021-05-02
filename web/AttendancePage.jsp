<%-- 
    Document   : AttendancePage
    Created on : Mar 14, 2018, 8:22:47 PM
    Author     : DELL
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        
        <div class="wrapper light">

        <%
            Connection cn;
            Statement st;
            ResultSet rs;
            int cnt=0,sem;
            String sec,dept,hour,sub,day, month = null, week = null;
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
            day =  date+"-"+month+"-"+year;
            dept = request.getParameter("t1");
            sem = Integer.parseInt(request.getParameter("t2"));
            sec = request.getParameter("t3");
            sub = request.getParameter("t4");
            hour = request.getParameter("t5");
            String sql = "select * from Student where department='"+dept+"' and semester="+sem+" and section='"+sec+"' order by student_id";
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
            
        %>
        <div id="content">
                <a href="FacultySuccess.jsp" id="close">&times;</a>
        <form name="frm1" action="StudentAttendanceSuccess.jsp">
            <table>
                        <tr>
                            <td>
                                <h3 align="center">Student Attendance Form !</h3>
                            </td>
                        </tr>
                        
                        <tr>
                            <td><b>Attendance Date</b></td>
                            <td><input type="date" name="D1" size="20" id="txtDate" value="<%=day%>"></td>
                            <td><b>Faculty</b></td>
                            <td>
                                <input type="text" name="D2" readonly size="20" value="<%=fac%>"></td>
                        </tr>
                        <tr>
                            <td><b>Faculty</b></td>
                            <td>
                                <input type="text" name="D3" readonly size="20" value="<%=sub%>"></td>
                            <td><b>Department</b></td>
                            <td>
                                <input type="text" name="D4" readonly size="20" value="<%=dept%>"></td>
                        </tr>
                        <tr>
                            <td><b>Semester</b></td>
                            <td>
                                <input type="text" name="D5" readonly size="20" value="<%=sem%>"></td>
                            <td><b>Section</b></td>
                            <td>
                                <input type="text" readonly name="D6" size="20" value="<%=sec%>"></td>
                        </tr>
                        <tr>
                            <td><b>Hour</b></td>
                            <td>
                                <input type="text" name="D7" readonly size="20" value="<%=hour%>"></td>
                        </tr>
                        
                        <tr>
                            <td><b>Student ID</b></td>
                            <td><b>First Name</b></td>
                            <td><b>Last Name</b></td>
                            <td><b>Attendance Status</b></td>
                        </tr>
                        <%  
                        int i=1,j=1;
                        rs.first();
                        do
                        {
                            %>
                            <tr>
                                <td><b><input type="text" value="<%=rs.getString(1)%>" name="t<%=i++%>" readonly /></b></td>
                            <td><input type="text" value="<%=rs.getString(2)%>" readonly/></td>
                            <td><input type="text" value="<%=rs.getString(3)%>" readonly/></td>
                            <td><input type="radio" name="R<%=j%>" value="Present" Checked/>Present <input type="radio" name="R<%=j++%>" value="Absent" />Absent 
                            </td>
                            </tr>
                            <%
                        }while(rs.next());
            }
            catch(Exception e)
            {
                System.out.println("Error : "+e);
                session.setAttribute("msg4", "Error");
                response.sendRedirect("FacultyAttenceError.jsp");
            }
                        %>
                        <tr>
                            <td colspan="5" align="right">
                                <input type="submit" value="Send" id="button" />
                            </td>
                        </tr>
                    </table>
                    </form>
        </div>
        </div>
    </body>
</html>
