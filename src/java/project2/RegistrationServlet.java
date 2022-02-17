package project2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegistrationServlet extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
            int flag=0;
            int _fid=0;
            String department = null;
            String gender=request.getParameter("gender");
            String course=request.getParameter("course");
            String p1=request.getParameter("p1");
            String p2=request.getParameter("p2");
            String p3=request.getParameter("p3");
            String fid=request.getParameter("fid");
            String depart=request.getParameter("department");
            String board1=request.getParameter("board1");
            String board2=request.getParameter("board2");
            
            Connection con2=Connectify.getConnection();
            PreparedStatement ps=null;
            ResultSet rs1=null;

            if(course==null)
                flag=1;
            else if(gender==null)
                flag=1;
            else if(board1==null)
                flag=1;
            else if(board2==null)
                flag=1;
            
            else if(p1!=null)
            {
                if(p2==null && p3==null)
                    flag=0;
                else if( p1.equals(p2) || p1.equals(p3) || (p2.equals(p3) ))
                    flag=1;
            }
            
            else if(p1==null)
                flag=1;
            
            if(flag==0)
            {
                if(fid.length()==0 && depart==null)
                flag=0;
                else if((fid.length()!=0 && depart==null) || (fid.length()==0 && depart!=null))
                flag=1;
                else
                {
                    _fid=Integer.parseInt(fid);
                    ps=con2.prepareStatement("select * from admission.faculty where facultyid=?");
                    ps.setInt(1,_fid);
                    ResultSet rs=ps.executeQuery();
            
                    if(rs.next())
                    {
                        department=rs.getString("department");
                        if(!(department.equals(depart)))
                         flag=1;
                    }
                    else flag=1;
                }
            }
           
            if(flag==1)
            {
                
                RequestDispatcher rd=request.getRequestDispatcher("home2.jsp");
                rd.forward(request, response); 
            }
            
            else
            {
                HttpSession session=request.getSession();
                ps=con2.prepareStatement("update admission.applicant set address=?,dob=?,p1=?,p2=?,p3=?,fid=?,cid=?,gender=? where appid=?");
                ps.setString(1,request.getParameter("address"));
                ps.setString(2,request.getParameter("dob"));
                ps.setString(3,p1);
                ps.setString(4,p2);
                ps.setString(5,p3);
                ps.setInt(6,_fid);
               
                int cid;
                PreparedStatement ps1=null;
                PreparedStatement ps2=null;
                PreparedStatement ps3=null;
                
                if(course.equals("B.Tech"))
                {
                    cid=1001;
                    ps1=con2.prepareStatement("insert into admission.rank1(appid,ranking) values(?,?)");
                    ps1.setString(1,(String)session.getAttribute("appid"));
                    ps1.setInt(2, Integer.parseInt(request.getParameter("rank")));
                    ps1.executeUpdate();
                }
                    
                else if(course.equals("M.Tech"))
                {
                    cid=1002; 
                    ps1=con2.prepareStatement("insert into admission.rank2(appid,ranking) values(?,?)");
                    ps1.setString(1,(String)session.getAttribute("appid"));
                    ps1.setInt(2, Integer.parseInt(request.getParameter("rank")));
                    ps1.executeUpdate();
                }
                
                else 
                {
                    cid=1003;
                    ps1=con2.prepareStatement("insert into admission.rank3(appid,ranking) values(?,?)");
                    ps1.setString(1,(String)session.getAttribute("appid"));
                    ps1.setInt(2, Integer.parseInt(request.getParameter("rank")));
                    ps1.executeUpdate();
                }
   
                ps.setInt(7,cid);
                ps.setString(8,gender);
                ps.setString(9,(String)session.getAttribute("appid"));
                ps.executeUpdate();
                
                ps2=con2.prepareStatement("insert into admission.guardian(gname,appid,gmobno,gocc) values(?,?,?,?)");
                ps2.setString(1,request.getParameter("gname"));
                ps2.setString(2,(String)session.getAttribute("appid"));
                ps2.setString(3, request.getParameter("gmobno"));
                ps2.setString(4, request.getParameter("gocc"));
                ps2.executeUpdate();
                
                ps3=con2.prepareStatement("insert into admission.class(appid,ten_b,ten_y,ten_p,twelve_b,twelve_y,twelve_p) values(?,?,?,?,?,?,?)");
                ps3.setString(1,(String)session.getAttribute("appid"));
                ps3.setString(2,request.getParameter("board1"));
                ps3.setInt(3, Integer.parseInt(request.getParameter("year1")));
                ps3.setFloat(4, Float.parseFloat(request.getParameter("percent1")));
                ps3.setString(5,request.getParameter("board2"));
                ps3.setInt(6,Integer.parseInt(request.getParameter("year2")));
                ps3.setFloat(7,Float.parseFloat(request.getParameter("percent2")));
                ps3.executeUpdate();
                    
                RequestDispatcher rd=request.getRequestDispatcher("home3.jsp");
                rd.forward(request, response);
            }
        } 
        finally 
        {            
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
