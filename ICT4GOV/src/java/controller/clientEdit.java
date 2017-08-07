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
public class clientEdit extends HttpServlet {

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
        UserDAO userDB = new UserDAO();
        User user = new User();
        
        String edit_days="", edit_time="";
        
        session.setAttribute("edit_tin", request.getParameter("tin"));
        session.setAttribute("edit_username", request.getParameter("username"));
        session.setAttribute("edit_password", request.getParameter("password"));
        session.setAttribute("edit_phone", request.getParameter("phone"));
        
        String[] days;
        days = request.getParameterValues("dayCheck");
        StringBuilder stringBuilder = new StringBuilder();
        for(String s: days)
        {
            stringBuilder.append(s);
            stringBuilder.append(" ");
        }
        edit_days = stringBuilder.toString();
        
        String[] time;
        time = request.getParameterValues("timeCheck");
        StringBuilder stringBuilder1 = new StringBuilder();
        for(String t: time)
        {
            stringBuilder1.append(t);
            stringBuilder1.append(" ");
        }
        edit_time = stringBuilder1.toString();
        
        session.setAttribute("edit_days", edit_days);
        session.setAttribute("edit_time", edit_time);
        
        if (request.getParameter("save") != null)
        {
            if (session.getAttribute("edit_tin")!=null)
                user.setTin_no(session.getAttribute("edit_tin").toString());
            else
                user.setTin_no("");
            
            user.setUser_no(Integer.parseInt(String.valueOf(session.getAttribute("currUserNum"))));
            user.setUsername(session.getAttribute("edit_username").toString());
            user.setPassword(session.getAttribute("edit_password").toString());
            user.setPhone_no(session.getAttribute("edit_phone").toString());
            user.setAvail_days(session.getAttribute("edit_days").toString());
            user.setAvail_time(session.getAttribute("edit_time").toString());
            
            userDB.editAccount(user);
            
                session.setAttribute("edit_username", "");
                session.setAttribute("edit_password", "");
                session.setAttribute("edit_phone", "");
                session.setAttribute("edit_days", "");
                session.setAttribute("edit_time", "");
                session.setAttribute("edit_tin", "");
                
                nextStep="/client_homepage.jsp";
            
            
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
