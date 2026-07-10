package controllers;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.ChangePinDAO;

@SuppressWarnings("serial")
@WebServlet("/changePin")
public class ChangePin extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session = req.getSession(false);

		if(session == null || session.getAttribute("user") == null)
		{
			res.sendRedirect("login.jsp");
			return;
		}

		UserBean ub = (UserBean) session.getAttribute("user");

		long acno = ub.getAccount_number();

		String oldPin = req.getParameter("oldPin");
		String newPin = req.getParameter("newPin");
		String confirmPin = req.getParameter("confirmPin");

		RequestDispatcher rd = req.getRequestDispatcher("changePin.jsp");

		// Empty Validation
		if(oldPin == null || newPin == null || confirmPin == null ||
		   oldPin.trim().isEmpty() ||
		   newPin.trim().isEmpty() ||
		   confirmPin.trim().isEmpty())
		{
			req.setAttribute("msg", "All fields are mandatory.");
			req.setAttribute("color", "#e74c3c");
			rd.forward(req, res);
			return;
		}

		// PIN Format Validation
		if(!oldPin.matches("\\d{4}") ||
		   !newPin.matches("\\d{4}") ||
		   !confirmPin.matches("\\d{4}"))
		{
			req.setAttribute("msg", "PIN must be exactly 4 digits.");
			req.setAttribute("color", "#e74c3c");
			rd.forward(req, res);
			return;
		}

		// Same PIN Validation
		if(oldPin.equals(newPin))
		{
			req.setAttribute("msg", "New PIN cannot be same as current PIN.");
			req.setAttribute("color", "#e74c3c");
			rd.forward(req, res);
			return;
		}

		// Confirm PIN Validation
		if(!newPin.equals(confirmPin))
		{
			req.setAttribute("msg", "Confirm PIN does not match.");
			req.setAttribute("color", "#e74c3c");
			rd.forward(req, res);
			return;
		}

		ChangePinDAO dao = new ChangePinDAO();

		int k = dao.changePin(acno, oldPin, newPin);

		if(k > 0)
		{
			ub.setTransaction_pin(newPin);
			session.setAttribute("user", ub);

			req.setAttribute("msg", "Transaction PIN changed successfully.");
			req.setAttribute("color", "#27ae60");
		}
		else
		{
			req.setAttribute("msg", "Current PIN is incorrect.");
			req.setAttribute("color", "#e74c3c");
		}

		rd.forward(req, res);
	}
}