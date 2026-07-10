package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;
import java.sql.ResultSet;

import controllers.UserBean;

public class RegisterDAO {

	public static long generateAccountNumber()
	{
	    Random random = new Random();

	    long accNo;

	    while(true)
	    {
	        accNo = 100000000000L + (long)(random.nextDouble()*900000000000L);

	        try
	        {
	            Connection con = DBConnection.getConnection();

	            PreparedStatement ps = con.prepareStatement(
	                    "select account_number from users where account_number=?");

	            ps.setLong(1, accNo);

	            ResultSet rs = ps.executeQuery();

	            if(!rs.next())
	            {
	                return accNo;
	            }

	        }
	        catch(Exception e)
	        {
	            e.printStackTrace();
	        }
	    }
	}
	
	
	public boolean isUserExists(String email, long mobile)
	{
	    boolean exists = false;
	    try
	    {
	        Connection con = DBConnection.getConnection();

	        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? OR phone_no=?");

	        ps.setString(1, email);
	        ps.setLong(2, mobile);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next())
	        {
	            exists = true;
	        }

	        rs.close();
	        ps.close();
	        con.close();
	    }
	    catch(Exception e)
	    {
	        e.printStackTrace();
	    }

	    return exists;
	}
	
	public int insert(UserBean ub) 
    {

        int k = 0;

        try 
        {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO users(user_id, f_name, l_name, email, password, phone_no, address, account_number, open_balance,transaction_pin) VALUES(?,?,?,?,?,?,?,?,?,?)");

            ps.setString(1, ub.getUser_id());
            ps.setString(2, ub.getF_name());
            ps.setString(3, ub.getL_name());
            ps.setString(4, ub.getEmail());
            ps.setString(5, ub.getPassword());
            ps.setLong(6, ub.getPhone_no());
            ps.setString(7, ub.getAddress());
            ps.setLong(8, ub.getAccount_number());
            ps.setFloat(9, ub.getOpen_balance());
            ps.setString(10, ub.getTransaction_pin());

            // Execute the query
            k = ps.executeUpdate();

            ps.close();
            con.close();

        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }

        return k;
    }
}