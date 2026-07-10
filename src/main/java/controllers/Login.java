package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import models.LoginDAO;
import jakarta.servlet.annotation.*;
import java.io.*;

@WebServlet("/login")
@SuppressWarnings("serial")

public class Login extends HttpServlet
{
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{		
		UserBean ub=new UserBean();
	
		String uid = req.getParameter("uid");
		String pass = req.getParameter("upass");

		if(uid == null || uid.trim().isEmpty() ||
		   pass == null || pass.trim().isEmpty())
		{
		    req.setAttribute("msg","All fields are required.");
		    req.setAttribute("msgColor","red");

		    RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
		    rd.forward(req,res);
		    return;
		}
		
		ub.setUser_id(uid.trim());
		ub.setPassword(pass.trim());
		
		LoginDAO log=new LoginDAO();
		UserBean ub1=log.login(ub);
				
		if(ub1!= null)
		{
		    HttpSession session = req.getSession();
		    session.setMaxInactiveInterval(30*60);

		    session.setAttribute("user", ub1);
		    
		    session.setAttribute("accountNo", ub1.getAccount_number());
		    session.setAttribute("userBalance", ub1.getOpen_balance());
		    session.setAttribute("f_name", ub1.getF_name());
		    
		    res.sendRedirect("profile.jsp");
		}
		else
		{
		    req.setAttribute("msg", "Invalid User ID or Password");
		    req.setAttribute("msgColor", "red");

		    RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
		    rd.forward(req, res);
		}
	}
}
