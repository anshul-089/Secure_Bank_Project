package controllers;

import java.io.IOException;

import models.RegisterDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
@SuppressWarnings("serial")
public class Register extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
    {
        try 
        {
        	String uid = req.getParameter("uid").trim();
        	String fname = req.getParameter("fname").trim();
        	String lname = req.getParameter("lname").trim();
        	String email = req.getParameter("uemail").trim();
        	String password = req.getParameter("upass").trim();
        	String mobile = req.getParameter("umobno").trim();
        	String address = req.getParameter("uaddr").trim();
        	String pin = req.getParameter("pin_no").trim();
        	String balance = req.getParameter("open_bal").trim();

        	// User ID
        	if(!uid.matches("\\d+"))
        	{
        	    throw new Exception("Invalid User ID.");
        	}

        	// First Name
        	if(!fname.matches("[A-Za-z]{2,30}"))
        	{
        	    throw new Exception("Invalid First Name.");
        	}

        	// Last Name
        	if(!lname.matches("[A-Za-z]{2,30}"))
        	{
        	    throw new Exception("Invalid Last Name.");
        	}

        	// Email
        	if(!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"))
        	{
        	    throw new Exception("Invalid Email Address.");
        	}

        	// Password
        	if(!password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&^#]).{8,20}$"))
        	{
        	    throw new Exception("Weak Password.");
        	}

        	// Mobile
        	if(!mobile.matches("[6-9]\\d{9}"))
        	{
        	    throw new Exception("Invalid Mobile Number.");
        	}

        	// Address
        	if(address.length() < 5)
        	{
        	    throw new Exception("Invalid Address.");
        	}

        	// PIN
        	if(!pin.matches("\\d{4}"))
        	{
        	    throw new Exception("PIN must be exactly 4 digits.");
        	}

        	// Opening Balance
        	float openBalance = Float.parseFloat(balance);

        	if(openBalance <= 0)
        	{
        	    throw new Exception("Opening Balance must be greater than zero.");
        	}
            
        	
        	RegisterDAO dao = new RegisterDAO();

        	long phoneNo = Long.parseLong(mobile);

        	if(dao.isUserExists(email, phoneNo))
        	{
        	    req.setAttribute("msg", "Email or Mobile Number already exists!");
        	    req.setAttribute("msgColor", "red");

        	    RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
        	    rd.forward(req, res);
        	    return;
        	}
        	
        	UserBean ub = new UserBean();

        	ub.setUser_id(uid);
        	ub.setF_name(fname);
        	ub.setL_name(lname);
        	ub.setEmail(email);
        	ub.setPassword(password);
        	ub.setPhone_no(phoneNo);
        	ub.setAddress(address);

        	long accountNo = RegisterDAO.generateAccountNumber();
        	ub.setAccount_number(accountNo);

        	ub.setOpen_balance(openBalance);
        	ub.setTransaction_pin(pin);
            int k = dao.insert(ub);
            
            if(k > 0)
            {
                req.setAttribute("msg", "Registration Successful!");
                req.setAttribute("msgColor", "green");

                // Pass generated account number to JSP
                req.setAttribute("accountNo", ub.getAccount_number());

                RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
                rd.forward(req, res);
            }
            else
            {
                req.setAttribute("msg", "Registration Failed!");
                req.setAttribute("msgColor", "red");

                RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
                rd.forward(req, res);
            }

        } 
        catch (Exception e) 
        {
        	req.setAttribute("msg", e.getMessage());
        	req.setAttribute("msgColor", "red");

        	RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
        	rd.forward(req, res);
        }

    }
}