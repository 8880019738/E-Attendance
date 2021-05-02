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
                <div>
                    <h1>Faculty Slot Change Marked and SMS Sent Successfully</h1></div>
                    <table width="70%" border="1">
                        <tr>
                            <td>Transfer ID</td>
                            <td>Weekday</td>
                            <td>Slot Number</td>
                            <td>Faculty Name</td>
                            <td>Subject</td>
                            <td>Status</td>
                        </tr>
                        
                        
<!--
This is the Code to Send SMS.....

/*Send SMS using JAVA*/
//Your authentication key
String APIKey = "Q39nthrmf0W5uH0o7DcOtQ";
//Multiple mobiles numbers separated by comma
String number= "9999999";
//Sender ID should be 6 characters long.
String senderid= "NIITBL";
//Your message to send, Add URL encoding here.
String text = sms;
//define channel for Promotional = 1 for Transactional =2
String channel="2";
//define DCS = 0 for normal 8 for Unicode
String DCS="0";
//define flashsms= 0 for normal 1 for Flash
String flashsms="0";
//define route Blank
String route="";
//Prepare Url
URLConnection myURLConnection=null;
URL myURL=null;
BufferedReader reader=null;
//encoding message
String encoded_message=URLEncoder.encode(message);
//Send SMS API
String mainUrl="https://www.smsgatewayhub.com/api/mt/SendSMS?";
//Prepare parameter string
StringBuilder sbPostData= new StringBuilder(url);
sbPostData.append("APIKey="+ APIKey);
sbPostData.append("&number="+mobiles);
sbPostData.append("&text="+encoded_message);
sbPostData.append("&route="+route);
sbPostData.append("&channel="+channel);
sbPostData.append("&flashsms="+flashsms);
sbPostData.append("&DCS="+DCS);
//final string
mainUrl = sbPostData.toString();
try
{
//prepare connection
myURL = new URL(mainUrl);
myURLConnection = myURL.openConnection();
myURLConnection.connect();
reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
//reading response
String response;
while ((response = reader.readLine()) != null)
//print response
System.out.println(response);
//finally close connection
reader.close();
}
catch (IOException e)
{
e.printStackTrace();
}

-->
                        
                        <%
                            Connection cn;
                            Statement st;
                            PreparedStatement pst;
                            ResultSet rs;
                            String sql;
                            try {
                                boolean flag = false;
                                sql = "update FACULTYSLOTTRANSFER set Status = ? where Transfer_id = ?";
                                Class.forName("oracle.jdbc.OracleDriver");
                                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "hr", "superman");
                                pst = cn.prepareStatement(sql);
                                Enumeration en = request.getParameterNames();
                                Object ob;

                                int tid, slno;
                                String wd, fac, status, subject;
                                while (en.hasMoreElements()) {
                        %>
                        <tr>
                            <%
                                ob = en.nextElement();
                                tid = Integer.parseInt(request.getParameter((String) ob));

                                ob = en.nextElement();
                                wd = (String) (request.getParameter((String) ob));

                                ob = en.nextElement();
                                slno = Integer.parseInt(request.getParameter((String) ob));

                                ob = en.nextElement();
                                fac = (String) (request.getParameter((String) ob));
                                
                                ob = en.nextElement();
                                subject = (String) (request.getParameter((String) ob));

                                ob = en.nextElement();
                                status = (String) (request.getParameter((String) ob));

                                pst.setString(1, status);
                                pst.setInt(2, tid);
                            %>
                            <td><%=tid%></td>
                            <td><%=wd%></td>
                            <td><%=slno%></td>
                            <td><%=fac%></td>
                            <td><%=subject%></td>
                            <td><%=status%></td>
                        </tr>
                        <%
                                    pst.executeUpdate();
                                }
                            } catch (Exception e) {
                                session.setAttribute("msg", "ChangeError");
                            }
                        %>
                    </table>
                    <a href="FacultySuccess.jsp" id="alink">Go Back</a>
                </div>
    </body>
</html>
