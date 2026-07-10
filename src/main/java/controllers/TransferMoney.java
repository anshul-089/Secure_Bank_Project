package controllers;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.*;
import jakarta.servlet.http.HttpSession;
import models.TransferMoneyDAO;


@SuppressWarnings("serial")
@WebServlet("/moneyTransfer")

public class TransferMoney extends HttpServlet
{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		
		HttpSession session=req.getSession(false);

		if(session==null || session.getAttribute("accountNo")==null)
		{
		    res.sendRedirect("login.jsp");
		    return;
		}
		
		long s_acno=(Long) session.getAttribute("accountNo");
		
		String rac = req.getParameter("racno").trim();
		String amt = req.getParameter("tamount").trim();
		String pin = req.getParameter("pin").trim();
		
		if(amt == null || amt.trim().isEmpty())
		{
		    res.sendRedirect("transferMoney.jsp?msg=failed");
		    return;
		}
		
		if(rac==null || !rac.matches("\\d{12}"))
		{
		    res.sendRedirect("transferMoney.jsp?msg=failed");
		    return;
		}
		
		if(pin==null || !pin.matches("\\d{4}"))
		{
		    res.sendRedirect("transferMoney.jsp?msg=failed");
		    return;
		}
		
		long receiver;
		float amount;

		try
		{
		    receiver=Long.parseLong(rac);
		    amount=Float.parseFloat(amt);
		}
		catch(NumberFormatException e)
		{
		    res.sendRedirect("transferMoney.jsp?msg=failed");
		    return;
		}
		
		if(amount<=0)
		{
		    res.sendRedirect("transferMoney.jsp?msg=failed");
		    return;
		}
		
		if(s_acno==receiver)
		{
		    res.sendRedirect("transferMoney.jsp?msg=failed");
		    return;
		}
		
		TransferMoneyDAO dao=new TransferMoneyDAO();
		
//		int k=dao.transferMoney(s_acno,r_acno,t_amount);
		int k=dao.transferMoney(s_acno,receiver,pin,amount);
		
		if(k>0)
		{
			res.sendRedirect("transferMoney.jsp?msg=success");
		}
		else
		{
			res.sendRedirect("transferMoney.jsp?msg=failed");
		}
	}
}
