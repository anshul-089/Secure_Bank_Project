package models;

import java.sql.*;
import java.util.*;

public class TransferMoneyDAO 
{
	public int transferMoney(long sacno,long racno,String pin,float amount)
	{
		int k = 0;
        Connection con = null;

        try
        {
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

            // Self Transfer Validation
            if(sacno == racno)
            {
                return 0;
            }

            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            // Verify Sender & PIN
            PreparedStatement ps1 = con.prepareStatement("SELECT open_balance FROM users WHERE account_number=? AND transaction_pin=?");

            ps1.setLong(1, sacno);
            ps1.setString(2, pin);

            ResultSet rs1 = ps1.executeQuery();

            if(!rs1.next())
            {
                con.rollback();
                return 0;
            }

            float balance = rs1.getFloat("open_balance");

            // Balance Validation
            if(balance < amount)
            {
                con.rollback();
                return 0;
            }

            // Verify Receiver
            PreparedStatement ps2 = con.prepareStatement("SELECT account_number FROM users WHERE account_number=?");

            ps2.setLong(1, racno);

            ResultSet rs2 = ps2.executeQuery();

            if(!rs2.next())
            {
                con.rollback();
                return 0;
            }

            // Debit Sender
            PreparedStatement ps3 = con.prepareStatement("UPDATE users SET open_balance=open_balance-? WHERE account_number=?");

            ps3.setFloat(1, amount);
            ps3.setLong(2, sacno);

            int debit = ps3.executeUpdate();

            // Credit Receiver
            PreparedStatement ps4 = con.prepareStatement("UPDATE users SET open_balance=open_balance+? WHERE account_number=?");

            ps4.setFloat(1, amount);
            ps4.setLong(2, racno);

            int credit = ps4.executeUpdate();

            if(debit == 1 && credit == 1)
            {
                Random random = new Random();

                long tid = 100000000000L +
                        (long)(random.nextDouble() * 900000000000L);

                PreparedStatement ps5 = con.prepareStatement("INSERT INTO transactions(transaction_id, sender_account, receiver_account, amount, transaction_type) VALUES(?,?,?,?,?)");

                ps5.setLong(1, tid);
                ps5.setLong(2, sacno);
                ps5.setLong(3, racno);
                ps5.setFloat(4, amount);
                ps5.setString(5, "Money Transfer");

                k = ps5.executeUpdate();

                if(k > 0)
                {
                    con.commit();
                }
                else
                {
                    con.rollback();
                    k = 0;
                }
            }
            else
            {
                con.rollback();
                k = 0;
            }
        }
        catch(Exception e)
        {
            try
            {
                if(con != null)
                {
                    con.rollback();
                }
            }
            catch(Exception ex)
            {
                ex.printStackTrace();
            }

            e.printStackTrace();
        }
        finally
        {
            try
            {
                if(con != null)
                {
                    con.setAutoCommit(true);
                    con.close();
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }

        return k;
	}
	
}
