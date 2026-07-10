package controllers;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import models.ViewProfileDAO;

@WebServlet("/viewProfile")
@SuppressWarnings("serial")

public class ViewProfile extends HttpServlet
{
    protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
    {
        HttpSession session=req.getSession(false);

        if(session==null || session.getAttribute("user")==null)
        {
            res.sendRedirect("login.jsp");
            return;
        }

        Object ob=session.getAttribute("accountNo");
        
        if(!(ob instanceof Long))
        {
            res.sendRedirect("login.jsp");
            return;
        }

        long accNo=(Long)ob;

     // Account Number Validation
        if(accNo<=0)
        {
            res.sendRedirect("login.jsp");
            return;
        }


        ViewProfileDAO dao=new ViewProfileDAO();

        UserBean ub=dao.getProfile(accNo);
        
        if(ub==null)
        {
            session.invalidate();
            res.sendRedirect("login.jsp");
            return;
        }

        req.setAttribute("profile",ub);

        RequestDispatcher rd=req.getRequestDispatcher("viewProfile.jsp");
        rd.forward(req,res);
    }

    protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
    {
        doGet(req,res);
    }
}