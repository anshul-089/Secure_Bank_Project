package models;

import java.sql.*;

import controllers.UserBean;

public class LoginDAO 
{
	public UserBean ub1=null;
	
	public UserBean login(UserBean ub)
	{
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("select *from users where user_id=? and password=?");
			ps.setString(1, ub.getUser_id());
			ps.setString(2, ub.getPassword());
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				ub1=new UserBean();
				
				ub1.setUser_id(rs.getString(1));
				ub1.setF_name(rs.getString(2));
				ub1.setL_name(rs.getString(3));
				ub1.setEmail(rs.getString(4));
				ub1.setPassword(rs.getString(5));
				ub1.setPhone_no(rs.getLong(6));
				ub1.setAddress(rs.getString(7));
				ub1.setAccount_number(rs.getLong(8));
				ub1.setOpen_balance(rs.getFloat(9));
			
			}
			
			rs.close();
			ps.close();
			con.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ub1;
	}
}
