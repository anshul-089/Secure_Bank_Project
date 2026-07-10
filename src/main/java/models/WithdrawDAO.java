package models;

import java.sql.*;
import java.util.Random;

public class WithdrawDAO 
{
	public int withdrawMoney(long acno,String pin,int amount)
	{
		int a=0;
		
		// Amount Validation
        if(amount<=0)
        {
            return 0;
        }

        // PIN Validation
        if(pin==null || !pin.matches("\\d{4}"))
        {
            return 0;
        }
        
        Connection con=null;
        PreparedStatement ps=null;
        PreparedStatement ps1=null;
        PreparedStatement ps2=null;
        ResultSet rs=null;

        try
        {
            con=DBConnection.getConnection();

            ps=con.prepareStatement("SELECT open_balance FROM users WHERE account_number=? AND transaction_pin=?");

            ps.setLong(1,acno);
            ps.setString(2,pin);

            rs=ps.executeQuery();

            if(rs.next())
            {
                int balance=rs.getInt("open_balance");

                // Sufficient Balance Validation
                if(balance<amount)
                {
                    return 0;
                }

                ps1=con.prepareStatement("UPDATE users SET open_balance=open_balance-? WHERE account_number=?");

                ps1.setInt(1,amount);
                ps1.setLong(2,acno);

                int k=ps1.executeUpdate();

                if(k>0)
                {
                    ps2=con.prepareStatement("INSERT INTO transactions(transaction_id,sender_account,receiver_account,amount,transaction_type) VALUES(?,?,?,?,?)");

                    Random random=new Random();

                    long tid=100000000000L+(long)(random.nextDouble()*900000000000L);

                    ps2.setLong(1,tid);
                    ps2.setLong(2,acno);
                    ps2.setLong(3,acno);
                    ps2.setInt(4,amount);
                    ps2.setString(5,"Withdraw");

                    a=ps2.executeUpdate();
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try{ if(rs!=null) rs.close(); }catch(Exception e){}
            try{ if(ps!=null) ps.close(); }catch(Exception e){}
            try{ if(ps1!=null) ps1.close(); }catch(Exception e){}
            try{ if(ps2!=null) ps2.close(); }catch(Exception e){}
            try{ if(con!=null) con.close(); }catch(Exception e){}
        }

        return a;
	}
}
