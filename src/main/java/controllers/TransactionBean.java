package controllers;

import java.sql.Timestamp;

public class TransactionBean
{
    private long transaction_id;
    private long sender_account;
    private long receiver_account;
    private float amount;
    private String transaction_type;
    private Timestamp transaction_date;

    public long getTransaction_id()
    {
        return transaction_id;
    }

    public void setTransaction_id(long transaction_id)
    {
        this.transaction_id = transaction_id;
    }

    public long getSender_account()
    {
        return sender_account;
    }

    public void setSender_account(long sender_account)
    {
        this.sender_account = sender_account;
    }

    public long getReceiver_account()
    {
        return receiver_account;
    }

    public void setReceiver_account(long receiver_account)
    {
        this.receiver_account = receiver_account;
    }

    public float getAmount()
    {
        return amount;
    }

    public void setAmount(float amount)
    {
        this.amount = amount;
    }

    public String getTransaction_type()
    {
        return transaction_type;
    }

    public void setTransaction_type(String transaction_type)
    {
        this.transaction_type = transaction_type;
    }

    public Timestamp getTransaction_date()
    {
        return transaction_date;
    }

    public void setTransaction_date(Timestamp transaction_date)
    {
        this.transaction_date = transaction_date;
    }
}