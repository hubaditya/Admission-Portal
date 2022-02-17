package project2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ConfirmServlet", urlPatterns = {"/ConfirmServlet"})
public class ConfirmServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
            HttpSession session=request.getSession();
            int bid=0;
            String id=(String)session.getAttribute("appid");
            Allot allot=new Allot();
            HashMap<String,String>map=allot.round1();
            HashMap<String,String>hash=allot.waitUpgrade();
            String branch=map.get(id);
            
            if(branch.equals("CSE"))
                bid=101;
            else if(branch.equals("CCE"))
                bid=102;
            else if(branch.equals("ECE"))
                bid=103;
            else if(branch.equals("MME"))
                bid=104;
            else bid=105;
            
            Connection con=Connectify.getConnection();
            PreparedStatement ps=con.prepareStatement("update admission.applicant set bid=? where appid=?");
            ps.setInt(1,bid);
            ps.setString(2,id);
            ps.executeUpdate();
            
            PreparedStatement ps1=con.prepareStatement("update admission.applicant set status=? where appid=?");
            ps1.setInt(1,4);
            ps1.setString(2,id);
            ps1.executeUpdate();
           
            
            RequestDispatcher rd=request.getRequestDispatcher("result.jsp");
            rd.forward(request, response);
            
        } finally {            
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ConfirmServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ConfirmServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
