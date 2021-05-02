<%-- 
    Document   : GetTillDate
    Created on : Mar 22, 2018, 7:58:35 PM
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
        String admin="";
                
                if((admin = (String)session.getAttribute("admin"))=="" || (admin = (String)session.getAttribute("admin"))==null)
                {
                    response.sendRedirect("index.html");
                }
    %>
                <div id="loginerror">
                <span href="javascript:history.go(-1)" id="close">&times;</span>
                <div style="margin: 40px 40px 40px 40px;font-size: 25px;">
            <%
                String msg="";
                
                if((msg = (String)session.getAttribute("msg2"))=="" || (msg = (String)session.getAttribute("msg2"))==null)
                {
                    msg = "";
                }
 
                if(msg.equals("Success"))
                {
                    msg = "Student Added Successfully";
                }
                else if(msg.equals("Error"))
                {
                    msg = "Oops Some Database Error Please Do Check and Add New Student";
                }
                else if(msg.equals("ModifyError"))
                {
                    msg = "Student Does Not Exist";
                }
                else if(msg.equals("ModifyDataError"))
                {
                    msg = "Student Does Not Exist";
                }
                else if(msg.equals("ModifySuccess"))
                {
                    msg = "Student Modified Successfully";
                }
                else if(msg.equals("DeleteSuccess"))
                {
                    msg = "Student Deleted Successfully";
                }
                else if(msg.equals("ModifyDataError"))
                {
                    msg = "Student Was Not Deleted";
                }
        %>
				<h3><%=msg%></h3>
       </div>
       <a href="javascript:history.go(-1)" id="button">OK</a>
       </div>
    </body>
</html>
