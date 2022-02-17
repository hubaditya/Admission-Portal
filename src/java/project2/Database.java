package project2;

import java.sql.*;

public class Database
{
   
    public static String insert(String appid,String fname,String lname,String email,String mobno,String password) throws SQLException 
    {
        Connection con=Connectify.getConnection();
        PreparedStatement ps;
        String returnValue="";
        try
        {
            ps=con.prepareStatement("insert into admission.applicant(appid,fname,lname,email,mobno,pwd) values(?,?,?,?,?,?)");
            ps.setString(1,appid);
            ps.setString(2,fname);
            ps.setString(3,lname);
            ps.setString(4,email);
            ps.setString(5,mobno);
            ps.setString(6,password);
    
            int i=ps.executeUpdate();
            if(i>0)
            { 
                returnValue="successful";
            }
            else
            { returnValue="error occured"; }
        }
        catch(Exception e)
        {
            System.out.println("error:"+e);
        }
        return returnValue;
    }
}