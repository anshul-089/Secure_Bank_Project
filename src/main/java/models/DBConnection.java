package models;

import java.sql.*;

public class DBConnection
{
    private static final String URL = "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12832759";
    private static final String USERNAME = "sql12832759";
    private static final String PASSWORD = "jMBfRlJNIw";

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