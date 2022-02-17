package project2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DatabaseServlet extends HttpServlet 
{
    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {   
            Connection con1=Connectify.getConnection();
            PreparedStatement ps=con1.prepareStatement("select * from admission.applicant where appid=? and  pwd=?");
            ps.setString(1,request.getParameter("appid"));
            ps.setString(2,request.getParameter("password"));
            ResultSet rs=ps.executeQuery();
           
            if((request.getParameter("appid").equals("admin1") && request.getParameter("password").equals("password1")) || (request.getParameter("appid").equals("admin2") && request.getParameter("password").equals("password2")))
            {
                RequestDispatcher rd=request.getRequestDispatcher("admin.html");
                rd.forward(request, response);
            }

            else if(rs.next())
            {
                HttpSession session=request.getSession();
                String temp1=rs.getString("fname"); //fetching from database
                String temp2=rs.getString("lname");
                String temp=temp1+" "+temp2;
                session.setAttribute("appid",rs.getString("appid"));
                session.setAttribute("fname",temp1);
                session.setAttribute("lname",temp2);
                session.setAttribute("email",rs.getString("email"));
                session.setAttribute("mobno",rs.getString("mobno"));
                session.setAttribute("username",temp);
                session.setAttribute("address",rs.getString("address"));
                
        
                if(rs.getString("address")!=null)
                {
                    RequestDispatcher rd=request.getRequestDispatcher("home4.jsp");
                    rd.forward(request, response);
                }
                else 
                {
                    RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
                    rd.forward(request, response);
                }
            }
            
           else
           {
               RequestDispatcher rd=request.getRequestDispatcher("invalid.html");
               rd.include(request,response);
           }
        }
        catch(Exception e)
            {
                System.out.println("error:"+e);
            }
        
}
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
