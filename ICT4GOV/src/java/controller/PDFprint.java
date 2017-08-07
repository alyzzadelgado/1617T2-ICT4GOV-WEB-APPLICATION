/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.AppointmentDAO;
import DAO.RequirementsDAO;
import DAO.TransactionDAO;
import DAO.UserDAO;
import classes.Appointment;
import classes.PDF;
import classes.Requirements;
import classes.Transaction;
import classes.User;
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
public class PDFprint extends HttpServlet {

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
        
        PDF pdf = new PDF();
        
        Appointment currApp = new Appointment();
        Transaction currTrans = new Transaction();
        Requirements currReq = new Requirements();
        User currUser = new User();
        User currOfficer = new User();
        
        AppointmentDAO appDB = new AppointmentDAO();
        TransactionDAO tDB = new TransactionDAO();
        RequirementsDAO reqDB = new RequirementsDAO();
        UserDAO userDB = new UserDAO();
        UserDAO roDB = new UserDAO();
        
        int user = Integer.parseInt(String.valueOf(session.getAttribute("currUserNum")));
        int RO = Integer.parseInt(String.valueOf(session.getAttribute("currUserOfficer")));
        int aNum = Integer.parseInt(String.valueOf(session.getAttribute("app_no")));
        int tNum = Integer.parseInt(String.valueOf(session.getAttribute("app_trans")));
        
        session.setAttribute("app_trans", request.getParameter("trans_no"));
        
        if (request.getParameter("back")!=null)
        {
            if (session.getAttribute("app_accepted") != null)
                session.setAttribute("app_accepted", null);
            
            nextStep = "/client_manage.jsp";
        }
        else if (request.getParameter("print")!=null)
        {
            currApp = appDB.find(aNum);
            currTrans = tDB.find(tNum);
            currReq = reqDB.find(tNum);
            currUser = userDB.find(user);
            currOfficer = roDB.find(RO);
            
            pdf.createPDF(currUser, currOfficer, currApp, currTrans, currReq);
            
            if (session.getAttribute("app_accepted") != null)
                session.setAttribute("app_accepted", null);
                    
            nextStep = "/client_manage.jsp";
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
