package project2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class Allot2 
{
    int count1=0;
    int countCSE=0,countCCE=0,countECE=0,countMME=0,countIT=0;
    String id[]=null;
    Allot allot;
    HashMap<String,String>map;
    HashMap<String,String>hash;
    
    public void getCount() throws SQLException
    {
        String id="";
        String branch="";
        Connection con=Connectify.getConnection();
        PreparedStatement ps=con.prepareStatement("select appid from admission.applicant where status=?");
        ps.setInt(1,5);
        ResultSet rs=ps.executeQuery();
        
        int i=0;
        while(rs.next())
        {
            id=rs.getString("appid");
            Allot allot=new Allot();
            HashMap<String,String>map=allot.round1();
            branch=map.get(id);
            if(branch.equals("CSE"))
                countCSE++;
            else if(branch.equals("CCE"))
                countCCE++;
            else if(branch.equals("ECE"))
                countECE++;
            else if(branch.equals("MME"))
                countMME++;
            else
                countIT++;
            i++;
        }  
    }
    
    public HashMap<String,String> round2() throws SQLException
    {
        String p="";
        Connection con=Connectify.getConnection();
        PreparedStatement ps1=con.prepareStatement("select admission.applicant.appid from admission.applicant inner join admission.rank1 on admission.applicant.appid=admission.rank1.appid where status=? or status=? order by ranking");        
        ps1.setInt(1,3);
        ps1.setInt(2,2);
        ResultSet rs1=ps1.executeQuery();
        while(rs1.next())
            ++count1;
        id=new String[count1];
        
        rs1=ps1.executeQuery();
        
        int i=0;
        while(rs1.next())
        {
            id[i]=rs1.getString("appid");
            i++;
        }
        
        allot=new Allot();
        map=allot.round1();
        hash=allot.waitUpgrade();
        
        for(int j=0;j<count1;j++)
        {    
            String pref=hash.get(id[j]);
            
            if(pref.equals("2"))
            {
                ps1=con.prepareStatement("update admission.applicant set status=? where appid=?");
                ps1.setInt(1,6);
                ps1.setString(2,id[j]);
                ps1.executeUpdate();    
                
                ps1=con.prepareStatement("select p1 from admission.applicant where appid=?");
                ps1.setString(1,id[j]);
                rs1=ps1.executeQuery();
                if(rs1.next())
                    p=rs1.getString("p1");
                int flag=check(id[j],p);
                if(flag==0)
                    map.put(id[j],"finish");
            }
            
            else if(pref.equals("3"))
            {
                ps1=con.prepareStatement("update admission.applicant set status=? where appid=?");
                ps1.setInt(1,6);
                ps1.setString(2,id[j]);
                ps1.executeUpdate();    
                
                ps1=con.prepareStatement("select p1 from admission.applicant where appid=?");
                ps1.setString(1,id[j]);
                rs1=ps1.executeQuery();
                if(rs1.next())
                    p=rs1.getString("p1");
                int flag=check(id[j],p);
                
                if(flag==0)
                {
                    ps1=con.prepareStatement("select p2 from admission.applicant where appid=?");
                    ps1.setString(1,id[j]);
                    rs1=ps1.executeQuery();
                    if(rs1.next())
                        p=rs1.getString("p2");
                    flag=check(id[j],p);
                } 
            }
            
            else if(pref.equals("4"))
            {
                
                ps1=con.prepareStatement("update admission.applicant set status=? where appid=?");
                ps1.setInt(1,7);
                ps1.setString(2,id[j]);
                ps1.executeUpdate();    
                
                ps1=con.prepareStatement("select p1 from admission.applicant where appid=?");
                ps1.setString(1,id[j]);
                rs1=ps1.executeQuery();
                if(rs1.next())
                p=rs1.getString("p1");
                int flag=check(id[j],p);
                
                if(flag==0)
                {
                    ps1=con.prepareStatement("select p2 from admission.applicant where appid=?");
                    ps1.setString(1,id[j]);
                    rs1=ps1.executeQuery();
                    if(rs1.next())
                        p=rs1.getString("p2");
                    flag=check(id[j],p);
                }
                
                if(flag==0)
                {
                    ps1=con.prepareStatement("select p3 from admission.applicant where appid=?");
                    ps1.setString(1,id[j]);
                    rs1=ps1.executeQuery();
                    if(rs1.next())
                        p=rs1.getString("p3");
                    flag=check(id[j],p);
                }
                
                if(flag==0)
                    map.put(id[j],"finish");
            }
        }
        
        return map;
     }
    
    public void changeStatus() throws SQLException
    {
        Connection con=Connectify.getConnection();
        PreparedStatement ps=con.prepareStatement("update admission.applicant set status=? where appid=?");
        ps.setInt(1,6);
        ps.executeUpdate(); 
    }
     
     public int check(String appid,String p) throws SQLException
     {
        int flag=0;
         
         if(countCSE>0 && p.equals("CSE"))
         {
             countCSE--;
             flag=1;
             map.put(appid,"CSE");
             changeStatus();
         }
         
         else if(countCCE>0 && p.equals("CCE"))
         {
             countCCE--;
             flag=1;
             map.put(appid,"CCE");
             changeStatus();
         }
         
         else if(countECE>0 && p.equals("ECE"))
         {
             countECE--;
             flag=1;
             map.put(appid,"ECE");
             changeStatus();
         }
         
         else if(countMME>0 && p.equals("MME"))
         {
             countMME--;
             flag=1;
             map.put(appid,"MME");
             changeStatus();
         }
         
         else if(countIT>0 && p.equals("IT"))
         {
             countIT--;
             flag=1;
             map.put(appid,"IT");
             changeStatus();
         }
         
         return flag;
     }
}
