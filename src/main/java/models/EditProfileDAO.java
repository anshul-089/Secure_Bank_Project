package models;

import java.sql.*;
import java.util.*;

import controllers.UserBean;

public class EditProfileDAO 
{
	public int updateProfile(UserBean ub)
	{
		int k=0;
		
		if(ub==null)
		{
		    return 0;
		}

		if(ub.getAccount_number()<=0)
		{
		    return 0;
		}

		if(ub.getF_name()==null ||
		!ub.getF_name().trim().matches("[A-Za-z ]{2,30}"))
		{
		    return 0;
		}

		if(ub.getL_name()==null ||
		!ub.getL_name().trim().matches("[A-Za-z ]{1,30}"))
		{
		    return 0;
		}

		if(ub.getEmail()==null ||
		!ub.getEmail().trim().matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"))
		{
		    return 0;
		}

		String phone=String.valueOf(ub.getPhone_no());

		if(!phone.matches("[6-9][0-9]{9}"))
		{
		    return 0;
		}

		if(ub.getAddress()==null ||
		ub.getAddress().trim().length()<5 ||
		ub.getAddress().trim().length()>150)
		{
		    return 0;
		}
		
		ub.setF_name(ub.getF_name().trim());
		ub.setL_name(ub.getL_name().trim());
		ub.setEmail(ub.getEmail().trim());
		ub.setAddress(ub.getAddress().trim());
		
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update users SET f_name=?,l_name=?,email=?,phone_no=?,address=? where account_number=?");
			
			ps.setString(1, ub.getF_name());
			ps.setString(2, ub.getL_name());
			ps.setString(3, ub.getEmail());
			ps.setLong(4, ub.getPhone_no());
			ps.setString(5, ub.getAddress());
			ps.setLong(6, ub.getAccount_number());
			
			k=ps.executeUpdate();
			
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return k;
	}
}
