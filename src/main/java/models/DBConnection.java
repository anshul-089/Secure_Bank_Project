package models;

import java.sql.*;

public class DBConnection
{
    private static final String URL = "jdbc:mysql://gateway01.ap-southeast-1.prod.aws.tidbcloud.com:4000/bankdb?sslMode=VERIFY_IDENTITY&enabledTLSProtocols=TLSv1.2";
    private static final String USERNAME = "3tLRqcGUxTz5.root";
    private static final String PASSWORD = "c6tC2qaw6SqPCiy2";

    public static Connection getConnection()
    {
        Connection con = null;

        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return con;
    }
}