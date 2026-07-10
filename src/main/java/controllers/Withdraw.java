package controllers;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import models.WithdrawDAO;

import java.io.*;

@WebServlet("/withdraw")
@SuppressWarnings("serial")

public class Withdraw extends HttpServlet
{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		HttpSession session = req.getSession(false);

		if(session == null || session.getAttribute("accountNo") == null)
		{
		    res.sendRedirect("login.jsp");
		    return;
		}
		
		long accountNo=(Long)session.getAttribute("accountNo");
		
		String amountStr=req.getParameter("uwithdraw");
        String pin=req.getParameter("upin");

        if(pin==null || !pin.matches("\\d{4}"))
        {
            res.sendRedirect("withdraw.jsp?msg=invalid");
            return;
        }

        int amount;

        try
        {
            amount=Integer.parseInt(amountStr);

            if(amount<=0)
            {
                res.sendRedirect("withdraw.jsp?msg=invalid");
                return;
            }
        }
        catch(NumberFormatException e)
        {
            res.sendRedirect("withdraw.jsp?msg=invalid");
            return;
        }

        WithdrawDAO dao=new WithdrawDAO();

        int k=dao.withdrawMoney(accountNo,pin,amount);

        if(k>0)
        {
            res.sendRedirect("withdraw.jsp?msg=success");
        }
        else
        {
            res.sendRedirect("withdraw.jsp?msg=failed");
        }
	}
}
