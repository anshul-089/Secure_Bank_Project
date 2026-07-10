package models;

import java.sql.*;

import controllers.UserBean;

public class ViewProfileDAO
{
    public UserBean getProfile(long accNo)
    {
    	// Validation
        if(accNo<=0)
        {
            return null;
        }

        UserBean ub=null;

        try(
            Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement("SELECT * FROM users WHERE account_number=?");
        )
        {
            ps.setLong(1,accNo);

            try(ResultSet rs=ps.executeQuery())
            {
                if(rs.next())
                {
                    ub=new UserBean();

                    ub.setUser_id(rs.getString("user_id"));
                    ub.setF_name(rs.getString("f_name"));
                    ub.setL_name(rs.getString("l_name"));
                    ub.setEmail(rs.getString("email"));
                    ub.setPassword(rs.getString("password"));
                    ub.setPhone_no(rs.getLong("phone_no"));
                    ub.setAddress(rs.getString("address"));
                    ub.setAccount_number(rs.getLong("account_number"));
                    ub.setOpen_balance(rs.getFloat("open_balance"));
                    ub.setTransaction_pin(rs.getString("transaction_pin"));
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return ub;
    }
}