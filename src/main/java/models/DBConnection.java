package models;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection
{
    private static final String URL =
            "jdbc:mysql://gateway01.ap-southeast-1.prod.aws.tidbcloud.com:4000/bankdb?sslMode=VERIFY_IDENTITY";

    // Correct username from your TiDB Cloud Connect page
    private static final String USERNAME = "3tLRqcGUxTz5abU.root";

    // Your TiDB Cloud password
    private static final String PASSWORD = "c6tC2qaw6SqPCiy2";

    public static Connection getConnection()
    {
        Connection con = null;

        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("Database Connected Successfully!");
        }
        catch (Exception e)
        {
            System.out.println("Database Connection Failed!");
            e.printStackTrace();
        }

        return con;
    }
}