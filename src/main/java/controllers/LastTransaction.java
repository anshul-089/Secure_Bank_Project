package controllers;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import models.LastTransactionDAO;

@WebServlet("/lastTransaction")
@SuppressWarnings("serial")
public class LastTransaction extends HttpServlet
{
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("user")==null)
        {
            res.sendRedirect("login.jsp");
            return;
        }
        
        Long accountNo = (Long) session.getAttribute("accountNo");
        
        if(accountNo == null || accountNo<=0)
        {
            res.sendRedirect("login.jsp");
            return;
        }

        LastTransactionDAO dao = new LastTransactionDAO();

        ArrayList<TransactionBean> list = dao.getTransactions(accountNo);

        req.setAttribute("list", list);

        RequestDispatcher rd = req.getRequestDispatcher("lastTransaction.jsp");
        rd.forward(req, res);
    }
}