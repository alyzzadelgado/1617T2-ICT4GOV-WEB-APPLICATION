/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UserDAO;
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
public class personal extends HttpServlet {

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
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String nextStep="";
        User user = new User();
        User currOfficer = new User();
        
        String avail_days="", avail_time="";
        
        if (request.getParameter("firstname")!=null)
            session.setAttribute("client_firstname", request.getParameter("firstname"));
        
        if (request.getParameter("lastname")!=null)
            session.setAttribute("client_lastname", request.getParameter("lastname"));
        
        if (request.getParameter("middle")!=null)
        {
            session.setAttribute("client_middle", request.getParameter("middle"));
        }
        
        if (request.getParameter("phone")!=null)
            session.setAttribute("client_phone", request.getParameter("phone"));
        
            
        String[] days;
        days = request.getParameterValues("dayCheck");
        StringBuilder stringBuilder = new StringBuilder();
        for(String s: days)
        {
            stringBuilder.append(s);
            stringBuilder.append(" ");
            session.setAttribute("pickDay", "true");
        }
        avail_days = stringBuilder.toString();
        
        String[] time;
        time = request.getParameterValues("timeCheck");
        StringBuilder stringBuilder1 = new StringBuilder();
        for(String t: time)
        {
            stringBuilder1.append(t);
            stringBuilder1.append(" ");
            session.setAttribute("pickTime", "true");
        }
        avail_time = stringBuilder1.toString();
        
        session.setAttribute("avail_days", avail_days);
        session.setAttribute("avail_time", avail_time);
        
        if (request.getParameter("register")!=null)
        {
            
            if (session.getAttribute("client_middle").toString().contains(".") == false)
                session.setAttribute("client_middle", request.getParameter("middle")+".");
            
            
                user.setTin_no(session.getAttribute("client_tin").toString());
                user.setUsername(session.getAttribute("client_username").toString());
                user.setPassword(session.getAttribute("client_password").toString());
                user.setMiddle_initial(session.getAttribute("client_middle").toString());
                user.setFirst_name(session.getAttribute("client_firstname").toString());
                user.setLast_name(session.getAttribute("client_lastname").toString());
                user.setPhone_no(session.getAttribute("client_phone").toString());
                user.setAvail_days(session.getAttribute("avail_days").toString());
                user.setAvail_time(session.getAttribute("avail_time").toString());
                

                UserDAO userDB = new UserDAO();
                User currUser = userDB.register(user);
                
                /*session.setAttribute("currUserNum", currUser.getUser_no());
                session.setAttribute("currUserOfficer", currUser.getOfficer_no());
                
                currOfficer = userDB.find(currUser.getOfficer_no());
                    
                    session.setAttribute("currOfficerName", currOfficer.getFirst_name() + " " + currOfficer.getMiddle_initial() + " " + currOfficer.getLast_name());
                    session.setAttribute("currOfficerDay", currOfficer.getAvail_days());
                    session.setAttribute("currOfficerTime", currOfficer.getAvail_time());
                    session.setAttribute("currOfficerPhone", currOfficer.getPhone_no());
                
                */
                    
                    session.setAttribute("client_tin", null);
                session.setAttribute("client_username", null);
                session.setAttribute("client_password", null);
                session.setAttribute("client_firstname", null);
                session.setAttribute("client_lastname", null);
                session.setAttribute("client_phone", null);
                session.setAttribute("avail_days", null);
                session.setAttribute("avail_time", null);
                session.setAttribute("client_middle", null);
                
                if (currUser != null)
                    nextStep="/index.jsp";
        }
        else if (request.getParameter("back")!=null)
        {
            nextStep = "/client_register.jsp";
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
