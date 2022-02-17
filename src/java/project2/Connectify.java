package project2;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connectify                                                                                                     
 {
    public Connectify()
    {
        super();
    }
    
    public static Connection getConnection()
    {
        Connection con=null;
        try
        {
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con=DriverManager.getConnection("jdbc:db2://localhost:50000/portal","ADI","adi@0173");
        }
        catch(Exception e)
        {
            System.out.println("error:"+e);
        }
    return con;
    }

}