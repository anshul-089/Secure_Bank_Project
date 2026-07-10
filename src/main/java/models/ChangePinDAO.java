package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ChangePinDAO
{
	public int changePin(long acno, String oldPin, String newPin)
	{
		int k = 0;

		// Account Number Validation
		if(acno <= 0)
		{
			return 0;
		}

		// PIN Validation
		if(oldPin == null || newPin == null)
		{
			return 0;
		}

		oldPin = oldPin.trim();
		newPin = newPin.trim();

		if(!oldPin.matches("\\d{4}") || !newPin.matches("\\d{4}"))
		{
			return 0;
		}

		try
		{
			Connection con = DBConnection.getConnection();

			// Verify Current PIN
			PreparedStatement ps1 = con.prepareStatement("select transaction_pin from users where account_number=?");

			ps1.setLong(1, acno);

			ResultSet rs = ps1.executeQuery();

			if(rs.next())
			{
				String dbPin = rs.getString("transaction_pin");

				if(dbPin.equals(oldPin))
				{
					PreparedStatement ps2 = con.prepareStatement("update users set transaction_pin=? where account_number=?");

					ps2.setString(1, newPin);
					ps2.setLong(2, acno);

					k = ps2.executeUpdate();

					ps2.close();
				}
			}

			rs.close();
			ps1.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return k;
	}
}