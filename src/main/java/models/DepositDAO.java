package models;

import java.sql.*;
import java.util.*;

public class DepositDAO 
{
	public int addMoney(long acno,String pin,int amount)
	{
		int a=0;
		
		// Amount Validation
        if(amount <= 0)
        {
            return 0;
        }

        // PIN Validation
        if(pin == null || !pin.matches("\\d{4}"))
        {
            return 0;
        }
		
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("select *From users where account_number=? and transaction_pin=?");
			ps.setLong(1, acno);
			ps.setString(2, pin);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				PreparedStatement ps1=con.prepareStatement("update users SET open_balance=open_balance+? where account_number=?");
				ps1.setInt(1, amount);
				ps1.setLong(2, acno);
				int k=ps1.executeUpdate();
				
				if(k>0)
				{
					PreparedStatement ps2=con.prepareStatement("insert into transactions(transaction_id, sender_account,receiver_account,amount,transaction_type) VALUES(?,?,?,?,?)");
					
					String type="Deposit";
					Random random=new Random();
					long tid;
					tid = 100000000000L + (long)(random.nextDouble()*900000000000L);
					
					ps2.setLong(1, tid);
					ps2.setLong(2, acno);
					ps2.setLong(3, acno);
					ps2.setInt(4, amount);
					ps2.setString(5, type);
					
					a=ps2.executeUpdate();
				}
				else
				{
					return 0;
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
		return a;
	}
}
