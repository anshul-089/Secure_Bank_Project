package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import controllers.TransactionBean;

public class LastTransactionDAO
{
    public ArrayList<TransactionBean> getTransactions(long accountNo)
    {
    	ArrayList<TransactionBean> list=new ArrayList<>();

        if(accountNo<=0)
        {
            return list;
        }

        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;

        try
        {
            con=DBConnection.getConnection();

            ps=con.prepareStatement(
                "SELECT * FROM transactions " +
                "WHERE sender_account=? OR receiver_account=? " +
                "ORDER BY transaction_date DESC LIMIT 10");

            ps.setLong(1,accountNo);
            ps.setLong(2,accountNo);

            rs=ps.executeQuery();

            while(rs.next())
            {
                TransactionBean tb=new TransactionBean();

                tb.setTransaction_id(rs.getLong("transaction_id"));
                tb.setSender_account(rs.getLong("sender_account"));
                tb.setReceiver_account(rs.getLong("receiver_account"));
                tb.setAmount(rs.getFloat("amount"));
                tb.setTransaction_type(rs.getString("transaction_type"));
                tb.setTransaction_date(rs.getTimestamp("transaction_date"));

                list.add(tb);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
            }
            catch(Exception e){}

            try
            {
                if(ps!=null)
                    ps.close();
            }
            catch(Exception e){}

            try
            {
                if(con!=null)
                    con.close();
            }
            catch(Exception e){}
        }

        return list;
    }
}