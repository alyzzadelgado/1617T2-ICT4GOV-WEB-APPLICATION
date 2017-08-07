/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.AppointmentDAO;
import classes.Appointment;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alydoubleza
 */
public class ROBook extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        HttpSession session = request.getSession();
        String nextStep="";
        
        AppointmentDAO cDB = new AppointmentDAO();
        AppointmentDAO rDB = new AppointmentDAO();
        
        Appointment clientAppointment = new Appointment();
        Appointment ROAppointment = new Appointment(); 
        
        session.setAttribute("book_date", request.getParameter("date"));
        session.setAttribute("book_time", request.getParameter("startTime"));
        session.setAttribute("book_transaction", request.getParameter("transaction"));
        session.setAttribute("book_client", request.getParameter("client"));
        session.setAttribute("book_reason", request.getParameter("reason"));
        
        if (request.getParameter("cancel")!=null)
        {
            if (Integer.parseInt(String.valueOf(request.getParameter("confirm"))) == 1)
            {
                session.setAttribute("book_date", null);
                session.setAttribute("book_time", null);
                session.setAttribute("book_transaction", null);
                session.setAttribute("book_client", null);
                session.setAttribute("book_reason", null);
                
                nextStep = "/RO_homepage.jsp";
            }
        }
        else if (request.getParameter("book")!=null)
        {
        clientAppointment.setUser_no(Integer.parseInt(String.valueOf(session.getAttribute("currUserNum"))));
        clientAppointment.setUser_set(Integer.parseInt(String.valueOf(session.getAttribute("book_client"))));
        clientAppointment.setTransaction_no(Integer.parseInt(String.valueOf(session.getAttribute("book_transaction"))));
        clientAppointment.setDate(session.getAttribute("book_date").toString());
        clientAppointment.setTime(session.getAttribute("book_time").toString());
        clientAppointment.setReason(session.getAttribute("book_reason").toString());
        clientAppointment.setStatus("pending");
        
        
            Appointment cBook = cDB.book(clientAppointment);
            
            if (cBook != null)
                nextStep = "/RO_manage.jsp";
        }
        
        
        ServletContext context = getServletContext();
        RequestDispatcher rd = context.getRequestDispatcher(nextStep);
        rd.forward(request, response);
        
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
