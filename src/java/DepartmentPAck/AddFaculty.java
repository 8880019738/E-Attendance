/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DepartmentPAck;

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
import javax.websocket.Session;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "AddFaculty", urlPatterns = {"/AddFaculty"})
public class AddFaculty extends HttpServlet {
    Connection cn;
    Statement st;
    PreparedStatement pst;
    ResultSet rs;
    String sql ;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int fid;
            String fn, ln, gn, dob, dg, dp, un, ps;
            fid = Integer.parseInt(request.getParameter("t1"));
            fn = request.getParameter("t2");
            ln = request.getParameter("t3");
            gn = request.getParameter("t4");
            dob = request.getParameter("t5");
            dp = request.getParameter("t6");
            un = request.getParameter("t7");
            ps = request.getParameter("t8");
            java.util.Date dd = new java.util.Date(dob);
            
            Date d = new Date(dd.getTime());
            HttpSession session = request.getSession(true);
            try 
            {
                boolean flag = false;
                sql = "insert into faculty values(?,?,?,?,?,?,?,?)";
                Class.forName("oracle.jdbc.OracleDriver");
                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                pst = cn.prepareStatement(sql);
                pst.setInt(1, fid);
                pst.setString(2, fn);
                pst.setString(3, ln);
                pst.setString(4, gn);
                pst.setDate(5, d);
                pst.setString(6, dp);
                pst.setString(7, un);
                pst.setString(8, ps);
                pst.executeUpdate();
                cn.close();
                session.setAttribute("msg", "Success");
                response.sendRedirect("AdminFaculty.jsp");
            } 
            catch (Exception e) 
            {
                System.out.println("Database Error : "+e);
                session.setAttribute("msg", "Error");
                response.sendRedirect("AdminFaculty.jsp");
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
