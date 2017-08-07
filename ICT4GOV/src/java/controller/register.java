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
public class register extends HttpServlet {

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
        
        UserDAO userDB = new UserDAO();
        
         
            session.setAttribute("client_tin", request.getParameter("tin"));
            session.setAttribute("client_username", request.getParameter("username"));
            session.setAttribute("client_password", request.getParameter("password"));
            
            boolean tinExists = userDB.findTin(request.getParameter("tin"));
            boolean usernameExists = userDB.findUsername(request.getParameter("username"));
        
        if (request.getParameter("continue")!=null)
        {
            if (tinExists == false && usernameExists == false)
            {
                //session.setAttribute("tinExists", null);
                //session.setAttribute("usernameExists", null);
                nextStep = "/client_personal.jsp";
            }
            else if (tinExists == true && usernameExists == true)
            {
                session.setAttribute("usernameExists", "true");
                session.setAttribute("tinExists", "true");
                nextStep = "/client_register.jsp";
            }
            else if (usernameExists == true && tinExists == false)
            {
                    session.setAttribute("usernameExists", "true");
                    session.setAttribute("tinExists", null);
                
                nextStep = "/client_register.jsp";
            }
            else if (tinExists == true && usernameExists == false)
            {
                session.setAttribute("tinExists", "true");
                session.setAttribute("usernameExists", null);
                    
                    nextStep = "/client_register.jsp";
            }
            
            
        }
        else if (request.getParameter("cancel")!=null)
        {
            if (Integer.parseInt(String.valueOf(request.getParameter("confirm"))) == 1)
            {
                session.setAttribute("client_tin", "");
                session.setAttribute("client_username", "");
                session.setAttribute("client_password", "");
                session.setAttribute("client_firstname", "");
                session.setAttribute("client_lastname", "");
                session.setAttribute("client_phone", "");
                session.setAttribute("avail_days", "");
                session.setAttribute("avail_time", "");
                
                nextStep = "/index.jsp";
            }
            else
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
