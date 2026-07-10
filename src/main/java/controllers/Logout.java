package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;

@WebServlet("/logout")
@SuppressWarnings("serial")

public class Logout extends HttpServlet
{
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		// Prevent browser caching
        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        res.setHeader("Pragma", "no-cache");
        res.setDateHeader("Expires", 0);
		
		HttpSession session = req.getSession(false);
		
        if (session != null) 
        {
            session.invalidate();
        }

//        res.sendRedirect("login.jsp?msg1=logout");
//        res.sendRedirect("msg1=logout");
        res.sendRedirect("logoutSuccess.jsp");
	}
	
	 protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	 {
        doGet(req, res);
     }
}
