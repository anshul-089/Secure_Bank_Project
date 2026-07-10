package controllers;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import models.ViewProfileDAO;

import java.io.*;

@SuppressWarnings("serial")
@WebServlet("/viewEditProfile")

public class ViewEditProfile extends HttpServlet
{
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		HttpSession session=req.getSession(false);
		
		if(session==null || session.getAttribute("user")==null)
		{
			res.sendRedirect("login.jsp");
			return;
		}
		
		Long accNo=(Long) session.getAttribute("accountNo");
		
		if(accNo==null)
		{
		    res.sendRedirect("login.jsp");
		    return;
		}
		
		ViewProfileDAO dao=new ViewProfileDAO();
		
		UserBean ub=dao.getProfile(accNo);
		
		if(ub==null)
		{
		    res.sendRedirect("profile.jsp");
		    return;
		}
		
		req.setAttribute("profile", ub);
		
		req.getRequestDispatcher("editProfile.jsp").forward(req, res);
	}
}
