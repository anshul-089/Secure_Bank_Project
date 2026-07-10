package controllers;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import models.CheckBalanceDAO;

@WebServlet("/checkBalance")
@SuppressWarnings("serial")

public class CheckBalance extends HttpServlet
{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{

		HttpSession session=req.getSession(false);

		if(session==null || session.getAttribute("user")==null)
		{
			res.sendRedirect("login.jsp");
			return;
		}

		UserBean ub=(UserBean)session.getAttribute("user");

		long acno=ub.getAccount_number();

		String pin=req.getParameter("pin");

		CheckBalanceDAO dao=new CheckBalanceDAO();

		float balance=dao.checkBalance(acno,pin);

		if(balance>=0)
		{
			req.setAttribute("balance", balance);
		}
		else
		{
			req.setAttribute("msg","Invalid Transaction PIN");
		}

		RequestDispatcher rd=req.getRequestDispatcher("checkBalance.jsp");
		rd.forward(req,res);

	}

}