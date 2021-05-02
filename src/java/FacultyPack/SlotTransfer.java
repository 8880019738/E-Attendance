/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FacultyPack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "SlotTransfer", urlPatterns = {"/SlotTransfer"})
public class SlotTransfer extends HttpServlet {
Connection cn;
    Statement st;
    PreparedStatement pst, pst2;
    ResultSet rs;
    String sql ;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String wd, ft, ftt, sub;
            int slno, tid;
            wd = request.getParameter("T1");
            slno = Integer.parseInt(request.getParameter("T2"));
            ft = request.getParameter("T3");
            ftt = request.getParameter("T4");
            sub = request.getParameter("T5");
            
            HttpSession session = request.getSession(true);
            try 
            {
                boolean flag = false;
                sql = "insert into FACULTYSLOTTRANSFER values(?,?,?,?,?,?,?)";
                Class.forName("oracle.jdbc.OracleDriver");
                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                pst = cn.prepareStatement(sql);
                pst2 = cn.prepareStatement("select max(TRANSFER_ID) from FACULTYSLOTTRANSFER", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                try
                {
                    rs = pst2.executeQuery();
                    rs.next();
                    tid = rs.getInt(1);
                    if (tid == 0)
                    {
                        tid = 3001;
                    }
                    else
                    {
                        tid +=1;
                    }
                }
                catch(Exception e)
                {
                    System.out.println("Error : "+e);
                    tid = 3001;
                }
                pst.setInt(1, tid);
                pst.setString(2, wd);
                pst.setInt(3, slno);
                pst.setString(4, sub);
                pst.setString(5, ft);
                pst.setString(6, ftt);
                pst.setString(7, "Pending");
                pst.executeUpdate();
                cn.close();
                
/*
                
//Your authentication key
        String APIKey = "Q39nthrmf0W5uH0o7DcOtQ";
//Multiple mobiles numbers separated by comma
        String number = "9019933447";
//Sender ID should be 6 characters long.
        String senderid = "NIITNL";
//Your message to send, Add URL encoding here.
        String text = "Test message";
//define channel for Promotional = 1 for Transactional =2
        String channel = "2";
//define DCS = 0 for normal 8 for Unicode
        String DCS = "0";
//define flashsms= 0 for normal 1 for Flash
        String flashsms = "0";
//define route Blank
        String route = "";
//Prepare Url
        URLConnection myURLConnection = null;
        URL myURL = null;
        BufferedReader reader = null;
//encoding message
        String encoded_message = URLEncoder.encode(text);
//Send SMS API
        String mainUrl = "https://www.smsgatewayhub.com/api/mt/SendSMS?";
//Prepare parameter string
        StringBuilder sbPostData = new StringBuilder(mainUrl);
        sbPostData.append("APIKey=" + APIKey);
        sbPostData.append("&number=" + number);
        sbPostData.append("&text=" + encoded_message);
        sbPostData.append("&route=" + route);
        sbPostData.append("&channel=" + channel);
        sbPostData.append("&flashsms=" + flashsms);
        sbPostData.append("&DCS=" + DCS);
//final string
        mainUrl = sbPostData.toString();
        try {
//prepare connection
            myURL = new URL(mainUrl);
            myURLConnection = myURL.openConnection();
            myURLConnection.connect();
            reader = new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
//reading response
            String response;
            while ((response = reader.readLine()) != null) //print response
            {
                System.out.println(response);
            }
//finally close connection
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
                
                
*/                
                
                
                session.setAttribute("msg", "TransferSuccess");
                response.sendRedirect("FacultySuccess.jsp");
            } 
            catch (Exception e) 
            {
                System.out.println("Time Table Database Error : "+e);
                session.setAttribute("msg", "TransferError");
                response.sendRedirect("FacultySuccess.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
