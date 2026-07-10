package controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import models.DepositDAO;

@WebServlet("/deposit")
@SuppressWarnings("serial")
public class Deposit extends HttpServlet
{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		HttpSession session=req.getSession(false);

	    if(session==null || session.getAttribute("accountNo")==null)
	    {
	    	res.sendRedirect("login.jsp");
	        return;
	    }

	    long accountNo=(Long)session.getAttribute("accountNo");

	    String amountStr=req.getParameter("udeposit");
	    String pin=req.getParameter("upin");

	    if(amountStr==null || amountStr.trim().isEmpty())
	    {
	    	res.sendRedirect("deposit.jsp?msg=failed");
	        return;
	    }

	    if(pin==null || pin.trim().isEmpty())
	    {
	    	res.sendRedirect("deposit.jsp?msg=failed");
	        return;
	    }

	    if(!pin.matches("\\d{4}"))
	    {
	    	res.sendRedirect("deposit.jsp?msg=failed");
	        return;
	    }
	    
	    int deposit;

	    try
	    {
	        deposit=Integer.parseInt(amountStr);
	    }
	    catch(NumberFormatException e)
	    {
	        res.sendRedirect("deposit.jsp?msg=failed");
	        return;
	    }

	    if(deposit<=0)
	    {	
	    	res.sendRedirect("deposit.jsp?msg=failed");
			return;
	    }

	    if(deposit>1000000)
	    {
	    	res.sendRedirect("deposit.jsp?msg=failed");
	        return;
	    }

	    DepositDAO dao=new DepositDAO();

	    int k=dao.addMoney(accountNo,pin,deposit);

	    if(k>0)
	    {
	    	res.sendRedirect("deposit.jsp?msg=success");
	    }
	    else
	    {
	    	res.sendRedirect("deposit.jsp?msg=failed");
	    }

	}
}