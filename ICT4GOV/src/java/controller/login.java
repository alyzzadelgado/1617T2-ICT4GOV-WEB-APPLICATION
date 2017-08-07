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
public class login extends HttpServlet {
    
    public static User currentUser = new User();
    public static User currentRO = new User();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {   
        // get user input from index.jsp
        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        
        //find user in db
        UserDAO userDB = new UserDAO();
        User currUser = userDB.login(user);
        User currOfficer = new User();
        
        //boolean samePass = userDB.checkPassword(request.getParameter("username"), request.getParameter("password"));
        //boolean sameUsername = userDB.checkPassword(request.getParameter("username"), request.getParameter("password"));
        
        // declare so that user will be redirected to another page
        String nextStep="";
        HttpSession session = request.getSession();
        
        // if no user account was found
        if (currUser.getUser_no() == 0)
            currUser = null;
        
        // if user account was found
        if(request.getParameter("login")!=null) 
        {
            if (currUser != null)
            {
                if (currUser.getOfficer_no() != 0 && currUser.getOfficer_no() != 3)
                {
                    session.setAttribute("login", "success");
                    session.setAttribute("currUserNum", currUser.getUser_no());
                    session.setAttribute("currUserOfficer", currUser.getOfficer_no());
                    
                    currOfficer = userDB.find(currUser.getOfficer_no());
                    
                    if (currOfficer != null)
                    {
                        session.setAttribute("currOfficerName", currOfficer.getFirst_name() + " " + currOfficer.getMiddle_initial() + " " + currOfficer.getLast_name());
                        session.setAttribute("currOfficerDay", currOfficer.getAvail_days());
                        session.setAttribute("currOfficerTime", currOfficer.getAvail_time());
                        session.setAttribute("currOfficerPhone", currOfficer.getPhone_no());
                    }
                    
                    nextStep = "/client_homepage.jsp";
                }
                else if (currUser.getOfficer_no() == 0)
                {
                    session.setAttribute("login", "success");
                    session.setAttribute("currUserNum", currUser.getUser_no());
                    
                    nextStep = "/RO_homepage.jsp";
                }
                else if (currUser.getOfficer_no() == 3 )
                {
                    
                    nextStep = "/index.jsp";
                }

            }
            else
            {
                session.setAttribute("error", "Invalid account!");
                nextStep = "/index.jsp";
            }
        }
        else if (request.getParameter("register")!=null)
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
