package project2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class Allot 
{
    int countCSE=0,countCCE=0,countECE=0,countMME=0,countIT=0;
    int count=0;
    String str[]=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    HashMap<String,String> map; //appid and branch
    HashMap<String,String> hash;//appid and preference
    
    public String[] getAppID() throws SQLException
    {
        Connection con=Connectify.getConnection();
        int i=0;
        ps=con.prepareStatement("select appid from admission.rank1 order by ranking");
        rs=ps.executeQuery();
        
        while(rs.next())
            ++count;
        
        String s[]=new String[count];
            
        rs=ps.executeQuery();
        
        if(rs.next())
        {
            do
            {
                s[i]=rs.getString("appid");
                i++;
            }
            while(rs.next());
        }
       return s; 
    }
    
    public String getPreference1(String i) throws SQLException
    {
        String s="";
        Connection con=Connectify.getConnection();
        ps=con.prepareStatement("select p1 from admission.applicant where appid=?");
        ps.setString(1,i);
        rs=ps.executeQuery();
        if(rs.next())
            s=rs.getString("p1");
        return s;
    }
    
    public String getPreference2(String i) throws SQLException
    {
        String s="";
        Connection con=Connectify.getConnection();
        ps=con.prepareStatement("select p2 from admission.applicant where appid=?");
        ps.setString(1,i);
        rs=ps.executeQuery();
        if(rs.next())
            s=rs.getString("p2");
        return s;
    }
    
    public String getPreference3(String i) throws SQLException
    {
        String s="";
        Connection con=Connectify.getConnection();
        ps=con.prepareStatement("select p3 from admission.applicant where appid=?");
        ps.setString(1,i);
        rs=ps.executeQuery();
        if(rs.next())
            s=rs.getString("p3");
        return s;
    }
    
    public void call(String i) throws SQLException
    {
        int status=0;
        Connection con=Connectify.getConnection();
        ps=con.prepareStatement("select status from admission.applicant where appid=?");
        ps.setString(1,i);
        ResultSet rs2=ps.executeQuery();
        if(rs2.next())
            status=rs2.getInt("status");
        if(status==0 || status==2)
        {
           ps=con.prepareStatement("update admission.applicant set status=? where appid=?");
           ps.setInt(1,1);
           ps.setString(2,i);
           ps.executeUpdate(); 
        }
    }
    
    public HashMap<String,String> round1() throws SQLException
    {
        map=new HashMap<String,String>(); //appid and branch
        hash=new HashMap<String,String>(); //appid and preference
        str=getAppID();
        PreparedStatement ps1=null;
        
        for(int i=0;i<str.length;i++)
        {
            String flag="4";
            int status=0;
            hash.put(str[i],flag);
            map.put(str[i],"waiting");
            Connection con2=Connectify.getConnection();
            ps=con2.prepareStatement("select status from admission.applicant where appid=?");
            ps.setString(1,str[i]);
            ResultSet rs3=ps.executeQuery();
            if(rs3.next())
                status=rs3.getInt("status");
            if(status==0)
            {
                ps1=con2.prepareStatement("update admission.applicant set status=? where appid=?");
                ps1.setInt(1,2);
                ps1.setString(2,str[i]);
                ps1.executeUpdate();
            }
            
            if(countCSE < 2 && getPreference1(str[i]).equals("CSE"))
            {
                countCSE++;
                flag="1";
                hash.put(str[i], flag);
                map.put(str[i],"CSE");
                call(str[i]);
                continue;
            }
            
            if(countCCE < 2 && getPreference1(str[i]).equals("CCE"))
            {
                countCCE++;
                flag="1";
                hash.put(str[i], flag);
                map.put(str[i],"CCE");
                call(str[i]);
                continue;
            }
            
            if(countECE < 2 && getPreference1(str[i]).equals("ECE"))
            {
                countECE++;
                flag="1";
                hash.put(str[i], flag);
                map.put(str[i],"ECE");
                call(str[i]);
                continue;
            }
            
            if(countMME < 2 && getPreference1(str[i]).equals("MME"))
            {
                countMME++;
                flag="1";
                hash.put(str[i], flag);
                map.put(str[i],"MME");
                call(str[i]);
                continue;
            }
            
            if(countIT < 2 && getPreference1(str[i]).equals("IT"))
            {
                countIT++;
                flag="1";
                hash.put(str[i], flag);
                map.put(str[i],"IT");
                call(str[i]);
                continue;
            }
            
            if(getPreference2(str[i])!=null)
            {
             
                if(countCSE < 2 && getPreference2(str[i]).equals("CSE"))
                {
                    countCSE++;
                    flag="2";
                    hash.put(str[i], flag);
                    map.put(str[i],"CSE");
                    call(str[i]);
                    continue;
                }
                
                if(countCCE < 2 && getPreference2(str[i]).equals("CCE"))
                {
                    countCCE++;
                    flag="2";
                    hash.put(str[i], flag);
                    map.put(str[i],"CCE");
                    call(str[i]);
                    continue;
                }
            
                if(countECE < 2 && getPreference2(str[i]).equals("ECE"))
                {
                    countECE++;
                    flag="2";
                    hash.put(str[i], flag);
                    map.put(str[i],"ECE");
                    call(str[i]);
                    continue;
                }
            
                if(countMME < 2 && getPreference2(str[i]).equals("MME"))
                {
                    countMME++;
                    flag="2";
                    hash.put(str[i], flag);
                    map.put(str[i],"MME");
                    call(str[i]);
                    continue;
                }
            
                if(countIT < 2 && getPreference2(str[i]).equals("IT"))
                {
                    countIT++;
                    flag="2";
                    hash.put(str[i], flag);
                    map.put(str[i],"IT");
                    call(str[i]);
                    continue;
                }
            } 
            
            if(getPreference3(str[i])!=null)
            {
                        
                if(countCSE < 2 && getPreference3(str[i]).equals("CSE"))
                {
                    countCSE++;
                    flag="3";
                    hash.put(str[i], flag);
                    map.put(str[i],"CSE");
                    call(str[i]);
                    continue;
                }
            
                if(countCCE < 2 && getPreference3(str[i]).equals("CCE"))
                {
                    countCCE++;
                    flag="3";
                    hash.put(str[i], flag);
                    map.put(str[i],"CCE");
                    call(str[i]);
                    continue;
                }
            
                if(countECE < 2 && getPreference3(str[i]).equals("ECE"))
                {
                    countECE++;
                    flag="3";
                    hash.put(str[i], flag);
                    map.put(str[i],"ECE");
                    call(str[i]);
                    continue;
                }
            
                if(countMME < 2 && getPreference3(str[i]).equals("MME"))
                {
                    countMME++;
                    flag="3";
                    hash.put(str[i], flag);
                    map.put(str[i],"MME");
                    call(str[i]);
                    continue;
                }
            
                if(countIT < 2 && getPreference3(str[i]).equals("IT"))
                {
                    countIT++;
                    flag="3";
                    hash.put(str[i], flag);
                    map.put(str[i],"IT");
                    call(str[i]);
                    continue;
                } 
            }
        }
        
        return map;
    }
    
    public HashMap<String,String> waitUpgrade() {
        return hash;
    }
}
