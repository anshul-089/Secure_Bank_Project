package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import models.EditProfileDAO;
import models.ViewProfileDAO;
import jakarta.servlet.annotation.*;
import java.io.*;

@SuppressWarnings("serial")
@WebServlet("/editProfile")

public class EditProfile extends HttpServlet
{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		// Session Validation
		HttpSession session=req.getSession(false);
		
		if(session==null || session.getAttribute("user")==null)
		{
			res.sendRedirect("login.jsp");
			return;
		}

		// Account Number Validation
		Long accountNo=(Long)session.getAttribute("accountNo");

		if(accountNo==null)
		{
			res.sendRedirect("login.jsp");
			return;
		}

		try
		{
			// Get Parameters
			String fname=req.getParameter("fname");
			String lname=req.getParameter("lname");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String address=req.getParameter("address");

			// Null Validation
			if(fname==null || lname==null || email==null ||
					phone==null || address==null)
			{
					res.getWriter().println("<h2>Invalid Request!</h2>");
					return;
			}

			// Remove Extra Spaces
			fname=fname.trim();
			lname=lname.trim();
			email=email.trim();
			phone=phone.trim();
			address=address.trim();

			// First Name Validation
			if(!fname.matches("[A-Za-z ]{2,30}"))
			{
				res.getWriter().println("<h2>Invalid First Name!</h2>");
				return;
			}

			// Last Name Validation
			if(!lname.matches("[A-Za-z ]{1,30}"))
			{
				res.getWriter().println("<h2>Invalid Last Name!</h2>");
				return;
			}

			// Email Validation
			if(!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"))
			{
				res.getWriter().println("<h2>Invalid Email Address!</h2>");
				return;
			}
			
			// Mobile Validation
			if(!phone.matches("[6-9][0-9]{9}"))
			{
				res.getWriter().println("<h2>Invalid Mobile Number!</h2>");
				return;
			}

			long mobile=Long.parseLong(phone);
			
			// Address Validation
			if(address.length()<5 || address.length()>150)
			{
				res.getWriter().println("<h2>Invalid Address!</h2>");
				return;
			}

			// Store Data in Bean
			UserBean ub=new UserBean();

			ub.setAccount_number(accountNo);
			ub.setF_name(fname);
			ub.setL_name(lname);
			ub.setEmail(email);
			ub.setPhone_no(mobile);
			ub.setAddress(address);

			// Update Profile
			EditProfileDAO dao=new EditProfileDAO();

			int k=dao.updateProfile(ub);
			
			if(k>0)
			{
				// Load Updated Profile
				ViewProfileDAO profileDAO=new ViewProfileDAO();

				UserBean updatedUser=profileDAO.getProfile(accountNo);

				if(updatedUser==null)
				{
					res.getWriter().println("<h2>Unable to Load Updated Profile!</h2>");
					return;
				}

				// Update Session
				session.setAttribute("user",updatedUser);
				session.setAttribute("f_name",updatedUser.getF_name());
				session.setAttribute("userBalance",updatedUser.getOpen_balance());


				res.sendRedirect("viewProfile");
			}
			else
			{
				res.getWriter().println("<h2>Profile Update Failed!</h2>");
			}
		}
		catch(NumberFormatException e)
		{
			res.getWriter().println("<h2>Invalid Mobile Number!</h2>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			res.getWriter().println("<h2>Something Went Wrong. Please Try Again!</h2>");
		}
	}
}
