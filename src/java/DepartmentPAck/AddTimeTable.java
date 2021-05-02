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

/**
 *
 * @author Administrator
 */
@WebServlet(name = "AddTimeTable", urlPatterns = {"/AddTimeTable"})
public class AddTimeTable extends HttpServlet {
    Connection cn;
    Statement st;
    PreparedStatement pst;
    ResultSet rs;
    String sql ;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String wd, f1, f2, f3, f4, f5, f6, f7, dept, sec;
            int sem;
            wd = request.getParameter("wd");
            f1 = request.getParameter("F1");
            f2 = request.getParameter("F2");
            f3 = request.getParameter("F3");
            f4 = request.getParameter("F4");
            f5 = request.getParameter("F5");
            f6 = request.getParameter("F6");
            f7 = request.getParameter("F7");
            dept = request.getParameter("t1");
            sem = Integer.parseInt(request.getParameter("t2"));
            sec = request.getParameter("t3");
            
            HttpSession session = request.getSession(true);
            try 
            {
                boolean flag = false;
                sql = "insert into TimeTable1 values(?,?,?,?,?,?,?,?,?,?,?)";
                Class.forName("oracle.jdbc.OracleDriver");
                cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","hr","superman");
                pst = cn.prepareStatement(sql);
                pst.setString(1, wd);
                pst.setString(2, f1);
                pst.setString(3, f2);
                pst.setString(4, f3);
                pst.setString(5, f4);
                pst.setString(6, f5);
                pst.setString(7, f6);
                pst.setString(8, f7);
                pst.setString(9, dept);
                pst.setInt(10, sem);
                pst.setString(11, sec);
                pst.executeUpdate();
                cn.close();
                session.setAttribute("msg", "Success");
                response.sendRedirect("AdminTimeTable.jsp");
            } 
            catch (Exception e) 
            {
                System.out.println("Time Table Database Error : "+e);
                session.setAttribute("msg", "Error");
                response.sendRedirect("AdminTimeTable.jsp");
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
