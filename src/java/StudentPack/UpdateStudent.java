/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package StudentPack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
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
@WebServlet(name = "UpdateStudent", urlPatterns = {"/UpdateStudent"})
public class UpdateStudent extends HttpServlet {

    Connection cn;
    Statement st;
    PreparedStatement pst;
    ResultSet rs;
    String sql ;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int sid, sem;
            long mno;
            String usn, fn, ln, gn, dob, dp, em, un, ps;
            sid = Integer.parseInt(request.getParameter("t1"));
            usn = request.getParameter("t2");
            fn = request.getParameter("t3");
            ln = request.getParameter("t4");
            gn = request.getParameter("t5");
            dob = request.getParameter("t6");
            sem = Integer.parseInt(request.getParameter("t7"));
            dp = request.getParameter("t8");
            em = request.getParameter("t9");
            mno = Long.parseLong(request.getParameter("t10"));
            un = request.getParameter("t11");
            ps = request.getParameter("t12");
            java.util.Date dd = new java.util.Date(dob);
            Date d = new Date(dd.getTime());
            HttpSession session = request.getSession(true);
            try 
            {
                boolean flag = false;
                sql = "update Students set STUDENT_ID=?, STUDENT_USN=?, FIRST_NAME=?, LAST_NAME=?, GENDER=?, DOB=?, SEMESTER=?,  DEPARTMENT=?, EMAILID=?, MOBILENO=?, USERNAME=?, PASSWORD=? where STUDENT_ID = "+sid;
                Class.forName("oracle.jdbc.OracleDriver");
                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                pst = cn.prepareStatement(sql);
                pst.setInt(1, sid);
                pst.setString(2, usn);
                pst.setString(3, fn);
                pst.setString(4, ln);
                pst.setString(5, gn);
                pst.setDate(6, d);
                pst.setInt(7, sem);
                pst.setString(8, dp);
                pst.setString(9, em);
                pst.setLong(10, mno);
                pst.setString(11, un);
                pst.setString(12, ps);
                pst.executeUpdate();
                cn.close();
                session.setAttribute("umsg", "ModifySuccess");
                response.sendRedirect("StudentSuccess.jsp");
            } 
            catch (Exception e) 
            {
                System.out.println("Database Error While Modifying the Data: "+e);
                session.setAttribute("umsg", "ModifyDataError");
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
