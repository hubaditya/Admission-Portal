package project2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="CheckServlet",urlPatterns={"/CheckServlet"})
public class CheckServlet extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try 
        {   
     
            Connection con1=Connectify.getConnection();
            PreparedStatement ps=con1.prepareStatement("select * from admission.applicant where email=? or  mobno=?");
            ps.setString(1,request.getParameter("email"));
            ps.setString(2,request.getParameter("mobno"));
            ResultSet rs=ps.executeQuery();
           
            if(rs.next())
            {
                  RequestDispatcher rd=request.getRequestDispatcher("index2.html");
                  rd.forward(request, response);
            }
            
            else 
            {
                    RequestDispatcher rd=request.getRequestDispatcher("Register.jsp");
                    rd.forward(request, response);
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
