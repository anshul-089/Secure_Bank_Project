package models;

import java.sql.*;

public class CheckBalanceDAO
{
	public float checkBalance(long acno,String pin)
	{
		float balance=-1;

		// Account Validation
		if(acno<=0)
		{
			return -1;
		}

		// PIN Validation
		if(pin==null || !pin.matches("\\d{4}"))
		{
			return -1;
		}

		try
		{
			Connection con=DBConnection.getConnection();

			PreparedStatement ps=con.prepareStatement(
			"select open_balance from users where account_number=? and transaction_pin=?");

			ps.setLong(1, acno);
			ps.setString(2, pin);

			ResultSet rs=ps.executeQuery();

			if(rs.next())
			{
				balance=rs.getFloat("open_balance");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return -1;
		}

		return balance;
	}

}