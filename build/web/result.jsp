<%@page import="project2.Allot2"%>
<%@page import="javax.swing.text.AbstractDocument.BranchElement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.ibm.db2.psmd.mgr.PSMDMgrComposer"%>
<%@page import="java.sql.Connection"%>
<%@page import="project2.Connectify"%>
<%@page import="java.util.HashMap"%>
<%@page import="project2.Allot"%>

<% 
    String id=(String)session.getAttribute("appid");        
    Connection con=Connectify.getConnection();
    PreparedStatement ps2=con.prepareStatement("select status from admission.applicant where appid=?");
    ps2.setString(1,id);
    ResultSet rs=ps2.executeQuery();
    if(rs.next())
    {
        if(rs.getInt("status")==0)
          {
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

  <meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <asp:ContentPlaceHolder id="head" runat="server">
    </asp:ContentPlaceHolder>



 
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="css/normalize.css">

    <link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>

     <script type="text/javascript" src="js/functions.js"></script>
     <link href="css/css.css" type="text/css" rel="stylesheet" media="screen" /> 

<!-- Theme Start -->

<link href="css/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.sc-button{
    -moz-transition: all 0.1s ease-in-out 0s;
    border: 0 none;
    cursor: pointer;
    display: inline-block;
    font-family: Arial,sans-serif;
	font-size:13px;
	font-weight: bold;
    padding: 5px 5px;
    width: auto;
	color:#fff;
	margin-left:39px;
	/*margin:0 0.3em 1em 0 !important;*/
	text-decoration:none;
}
.sc-button.round 
{
    border-radius:3px;
    
    }

.sc-button.light-blue{ background-color:#0a83d2;}

</style>

</head>

<body>
  <div class="form"  style="height:739px" >
  <img src="images/coverpic1.jpg" alt="Mountain" style="width:668px;height:180px;margin-left:-25px;margin-top:-26px;margin-bottom:10px;box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);"></img>
      <div class="tab-content" style="height:739px">
	  
        
    

<!--<div class="logo floatleft"><b>WELCOME USER</b> </div>-->
<h1 style="margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;color:#FF8800;border-radius: 4px; "><b>Welcome <%=(String)session.getAttribute("username") %></b></h1>
          <h1 style="color:white;margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;background-color:#FF8800;border-radius: 4px;height:35px;"><b>The LNM Institute Of Information Technology</b></h1>
<!--<div class="welcome_img floatleft" style="margin-left:300px;margin-top:100px;"> <img src="images/profile_image.jpg" alt="" title="" height="70px" width="70px"/></div>-->

<!--<div class="left_title_text"> Categories </div>-->

<div id="left_section" class="floatleft" style="margin-left:-25px;margin-top:-25px;height:400px;	"> 
<!--<div style="background-color:#ff8800;margin-left:-25px;margin-top:-25px;height:400px;width:200px;">-->
<br/>


<ul id="nav" name="nav" style="margin-top:-25px; margin-left:10px;">

<li>

		<!--<a class="expanded heading">	Your Text </a>-->	

		<ul class="navigation">                
			<br/>
								                   

                    <li ><a href="home.jsp" title="" ><div style="margin-left:40px;margin-top:25px;"> HOME</div></a></li>
			<br/>
			<br/>		
	
                    <li ><a href="read.jsp" title=""><div style="margin-left:13px;">PERSONAL INFO</div></a></li>
			
			<br/>
			<br/>
                    <li><a href="programs4.html" title=""><div style="margin-left:-12px;">PROGRAMMES OFFERED</div> </a></li>
			<br/>
			<br/>		
			<li><a href="result.jsp" title="">ALLOTMENT RESULT</a></li>
			<br/>
			<br/>
			<li><a href="contact4.html" title=""><div style="margin-left:20px">CONTACT US</div></a></li>	
                </ul>
            </li>



            
        </ul>
</div>
<!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div>
<br/>-->
<div style="margin-left:520px;margin-top:-25px;"> <img src="images/log_out.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="Logout">LogOut</a> </div>
              <!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div> -->    
              
              <div style="margin-left:200px;">
<h3>The list has not been declared   </h3>
 	</div>
              
<ul id="nav" name="nav" style=" margin-top:70px;margin-left:300px;">

<li>
       
 
</li>
</ul>
      </div><!-- tab-content -->

</div> <!-- /form -->

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="js/index.js"></script>

</body>

</html>

<%
    }
    else if(rs.getInt("status")==1)
     {  
        Allot allot=new Allot();
        HashMap<String,String>map=allot.round1();
        HashMap<String,String>hash=allot.waitUpgrade();
        String branch=map.get(id);
        if(hash.get(id).equals("2") || hash.get(id).equals("3"))
        {
%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

  <meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <asp:ContentPlaceHolder id="head" runat="server">
    </asp:ContentPlaceHolder>



 
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="css/normalize.css">

    <link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>

     <script type="text/javascript" src="js/functions.js"></script>
     <link href="css/css.css" type="text/css" rel="stylesheet" media="screen" /> 

<!-- Theme Start -->

<link href="css/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.sc-button{
    -moz-transition: all 0.1s ease-in-out 0s;
    border: 0 none;
    cursor: pointer;
    display: inline-block;
    font-family: Arial,sans-serif;
	font-size:13px;
	font-weight: bold;
    padding: 5px 5px;
    width: auto;
	color:#fff;
	margin-left:39px;
	/*margin:0 0.3em 1em 0 !important;*/
	text-decoration:none;
}
.sc-button.round 
{
    border-radius:3px;
    
    }

.sc-button.light-blue{ background-color:#0a83d2;}

</style>

</head>

<body>
  <div class="form"  style="height:739px" >
  <img src="images/coverpic1.jpg" alt="Mountain" style="width:668px;height:180px;margin-left:-25px;margin-top:-26px;margin-bottom:10px;box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);"></img>
      <div class="tab-content" style="height:739px">
	  
        
    

<!--<div class="logo floatleft"><b>WELCOME USER</b> </div>-->
<h1 style="margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;color:#FF8800;border-radius: 4px; "><b>Welcome <%=(String)session.getAttribute("username") %></b></h1>
          <h1 style="color:white;margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;background-color:#FF8800;border-radius: 4px;height:35px;"><b>The LNM Institute Of Information Technology</b></h1>
<!--<div class="welcome_img floatleft" style="margin-left:300px;margin-top:100px;"> <img src="images/profile_image.jpg" alt="" title="" height="70px" width="70px"/></div>-->

<!--<div class="left_title_text"> Categories </div>-->

<div id="left_section" class="floatleft" style="margin-left:-25px;margin-top:-25px;height:400px;	"> 
<!--<div style="background-color:#ff8800;margin-left:-25px;margin-top:-25px;height:400px;width:200px;">-->
<br/>


<ul id="nav" name="nav" style="margin-top:-25px; margin-left:10px;">

<li>

		<!--<a class="expanded heading">	Your Text </a>-->	

		<ul class="navigation">                
			<br/>
								                   

                    <li ><a href="home4.jsp" title="" ><div style="margin-left:40px;margin-top:25px;"> HOME</div></a></li>
			<br/>
			<br/>		
	
                    <li ><a href="read.jsp" title=""><div style="margin-left:13px;">PERSONAL INFO</div></a></li>
			
			<br/>
			<br/>
                    <li><a href="programs4.html" title=""><div style="margin-left:-12px;">PROGRAMMES OFFERED</div> </a></li>
			<br/>
			<br/>		
			<li><a href="result.jsp" title="">ALLOTMENT RESULT</a></li>
			<br/>
			<br/>
			<li><a href="contact4.html" title=""><div style="margin-left:20px">CONTACT US</div></a></li>	
                </ul>
            </li>



            
        </ul>
</div>
<!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div>
<br/>-->
<div style="margin-left:520px;margin-top:-25px;"> <img src="images/log_out.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="Logout">LogOut</a> </div>
              <!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div> -->    
              <div style="margin-left:200px;"><h3 >CONGRATS!! The Branch Alloted To You Is <%=branch%></h3></div>

<ul id="nav" name="nav" style=" margin-top:70px;margin-left:300px;">

<li>
       
 <ul class="navigation"><li><a href="ConfirmServlet" title=""><div style="margin-left:-16px;"><center>CONFIRM</center></div> </a></li>
			<br/>
			<br/>		
			<li><a href="WaitServlet" title="">WAIT FOR UPGRADE</a></li>
			<br/>
			<br/>
			<li><a href="DeclineServlet" title=""><div style="margin-left:35px">DECLINE</div></a></li>
</ul>
</li>
</ul>

      </div><!-- tab-content -->

</div> <!-- /form -->

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="js/index.js"></script>

</body>

</html>

<%
    }
        else if(hash.get(id).equals("1"))
        {
%>
            
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

  <meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <asp:ContentPlaceHolder id="head" runat="server">
    </asp:ContentPlaceHolder>



 
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="css/normalize.css">

    <link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>

     <script type="text/javascript" src="js/functions.js"></script>
     <link href="css/css.css" type="text/css" rel="stylesheet" media="screen" /> 

<!-- Theme Start -->

<link href="css/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.sc-button{
    -moz-transition: all 0.1s ease-in-out 0s;
    border: 0 none;
    cursor: pointer;
    display: inline-block;
    font-family: Arial,sans-serif;
	font-size:13px;
	font-weight: bold;
    padding: 5px 5px;
    width: auto;
	color:#fff;
	margin-left:39px;
	/*margin:0 0.3em 1em 0 !important;*/
	text-decoration:none;
}
.sc-button.round 
{
    border-radius:3px;
    
    }

.sc-button.light-blue{ background-color:#0a83d2;}

</style>

</head>

<body>
  <div class="form"  style="height:739px" >
  <img src="images/coverpic1.jpg" alt="Mountain" style="width:668px;height:180px;margin-left:-25px;margin-top:-26px;margin-bottom:10px;box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);"></img>
      <div class="tab-content" style="height:739px">
	  
        
    

<!--<div class="logo floatleft"><b>WELCOME USER</b> </div>-->
<h1 style="margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;color:#FF8800;border-radius: 4px; "><b>Welcome <%=(String)session.getAttribute("username") %></b></h1>
          <h1 style="color:white;margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;background-color:#FF8800;border-radius: 4px;height:35px;"><b>The LNM Institute Of Information Technology</b></h1>
<!--<div class="welcome_img floatleft" style="margin-left:300px;margin-top:100px;"> <img src="images/profile_image.jpg" alt="" title="" height="70px" width="70px"/></div>-->

<!--<div class="left_title_text"> Categories </div>-->

<div id="left_section" class="floatleft" style="margin-left:-25px;margin-top:-25px;height:400px;	"> 
<!--<div style="background-color:#ff8800;margin-left:-25px;margin-top:-25px;height:400px;width:200px;">-->
<br/>


<ul id="nav" name="nav" style="margin-top:-25px; margin-left:10px;">

<li>

		<!--<a class="expanded heading">	Your Text </a>-->	

		<ul class="navigation">                
			<br/>
								                   

                    <li ><a href="home4.jsp" title="" ><div style="margin-left:40px;margin-top:25px;"> HOME</div></a></li>
			<br/>
			<br/>		
	
                    <li ><a href="read.jsp" title=""><div style="margin-left:13px;">PERSONAL INFO</div></a></li>
			
			<br/>
			<br/>
                    <li><a href="programs4.html" title=""><div style="margin-left:-12px;">PROGRAMMES OFFERED</div> </a></li>
			<br/>
			<br/>		
			<li><a href="result.jsp" title="">ALLOTMENT RESULT</a></li>
			<br/>
			<br/>
			<li><a href="contact4.html" title=""><div style="margin-left:20px">CONTACT US</div></a></li>	
                </ul>
            </li>



            
        </ul>
</div>
<!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div>
<br/>-->
<div style="margin-left:520px;margin-top:-25px;"> <img src="images/log_out.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="Logout">LogOut</a> </div>
              <!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div> -->    
              <div style="margin-left:200px;"><h3 >CONGRATS!! The Branch Alloted To You Is <%=branch%></h3></div>
<ul id="nav" name="nav" style=" margin-top:70px;margin-left:300px;">

<li>
       
 <ul class="navigation"><li><a href="ConfirmServlet" title=""><div style="margin-left:-16px;"><center>CONFIRM</center></div> </a></li>
			<br/>
			<br/>	
			<li><a href="DeclineServlet" title=""><div style="margin-left:35px">DECLINE</div></a></li>
</ul>
</li>
</ul>

      </div><!-- tab-content -->

</div> <!-- /form -->

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="js/index.js"></script>

</body>

</html>


<%
        }
    }
     
     else if(rs.getInt("status")==2)
     {  
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

  <meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <asp:ContentPlaceHolder id="head" runat="server">
    </asp:ContentPlaceHolder>



 
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="css/normalize.css">

    <link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>

     <script type="text/javascript" src="js/functions.js"></script>
     <link href="css/css.css" type="text/css" rel="stylesheet" media="screen" /> 

<!-- Theme Start -->

<link href="css/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.sc-button{
    -moz-transition: all 0.1s ease-in-out 0s;
    border: 0 none;
    cursor: pointer;
    display: inline-block;
    font-family: Arial,sans-serif;
	font-size:13px;
	font-weight: bold;
    padding: 5px 5px;
    width: auto;
	color:#fff;
	margin-left:39px;
	/*margin:0 0.3em 1em 0 !important;*/
	text-decoration:none;
}
.sc-button.round 
{
    border-radius:3px;
    
    }

.sc-button.light-blue{ background-color:#0a83d2;}

</style>

</head>

<body>
  <div class="form"  style="height:739px" >
  <img src="images/coverpic1.jpg" alt="Mountain" style="width:668px;height:180px;margin-left:-25px;margin-top:-26px;margin-bottom:10px;box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);"></img>
      <div class="tab-content" style="height:739px">
	  
        
    

<!--<div class="logo floatleft"><b>WELCOME USER</b> </div>-->
<h1 style="margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;color:#FF8800;border-radius: 4px; "><b>Welcome <%=(String)session.getAttribute("username") %></b></h1>
          <h1 style="color:white;margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;background-color:#FF8800;border-radius: 4px;height:35px;"><b>The LNM Institute Of Information Technology</b></h1>
<!--<div class="welcome_img floatleft" style="margin-left:300px;margin-top:100px;"> <img src="images/profile_image.jpg" alt="" title="" height="70px" width="70px"/></div>-->

<!--<div class="left_title_text"> Categories </div>-->

<div id="left_section" class="floatleft" style="margin-left:-25px;margin-top:-25px;height:400px;	"> 
<!--<div style="background-color:#ff8800;margin-left:-25px;margin-top:-25px;height:400px;width:200px;">-->
<br/>


<ul id="nav" name="nav" style="margin-top:-25px; margin-left:10px;">

<li>

		<!--<a class="expanded heading">	Your Text </a>-->	

		<ul class="navigation">                
			<br/>
								                   

                    <li ><a href="home4.jsp" title="" ><div style="margin-left:40px;margin-top:25px;"> HOME</div></a></li>
			<br/>
			<br/>		
	
                    <li ><a href="read.jsp" title=""><div style="margin-left:13px;">PERSONAL INFO</div></a></li>
			
			<br/>
			<br/>
                    <li><a href="programs4.html" title=""><div style="margin-left:-12px;">PROGRAMMES OFFERED</div> </a></li>
			<br/>
			<br/>		
			<li><a href="result.jsp" title="">ALLOTMENT RESULT</a></li>
			<br/>
			<br/>
			<li><a href="contact4.html" title=""><div style="margin-left:20px">CONTACT US</div></a></li>	
                </ul>
            </li>



            
        </ul>
</div>
<!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div>
<br/>-->
<div style="margin-left:520px;margin-top:-25px;"> <img src="images/log_out.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="Logout">LogOut</a> </div>
              <!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div> -->    
              <div style="margin-left:200px;">
<h3>You are in waiting list </h3>
 	</div>
              
<ul id="nav" name="nav" style=" margin-top:70px;margin-left:300px;">

<li>
       
 
</li>
</ul>
        


      </div><!-- tab-content -->

</div> <!-- /form -->

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="js/index.js"></script>

</body>

</html>

<%
    }

    else if(rs.getInt("status")==4)
    {        
      String branch;
        ps2=con.prepareStatement("select bid from admission.applicant where appid=?");
        ps2.setString(1,id);
        ResultSet rs2=ps2.executeQuery();
        if(rs2.next())
        {
            int bid=rs2.getInt("bid");
            if(bid==101)
                branch="CSE";
            else if(bid==102)
                branch="CCE";
            else if(bid==103)
                branch="ECE";
            else if(bid==104)
                branch="MME";
            else branch="IT";
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

  <meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <asp:ContentPlaceHolder id="head" runat="server">
    </asp:ContentPlaceHolder>



 
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="css/normalize.css">

    <link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>

     <script type="text/javascript" src="js/functions.js"></script>
     <link href="css/css.css" type="text/css" rel="stylesheet" media="screen" /> 

<!-- Theme Start -->

<link href="css/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.sc-button{
    -moz-transition: all 0.1s ease-in-out 0s;
    border: 0 none;
    cursor: pointer;
    display: inline-block;
    font-family: Arial,sans-serif;
	font-size:13px;
	font-weight: bold;
    padding: 5px 5px;
    width: auto;
	color:#fff;
	margin-left:39px;
	/*margin:0 0.3em 1em 0 !important;*/
	text-decoration:none;
}
.sc-button.round 
{
    border-radius:3px;
    
    }

.sc-button.light-blue{ background-color:#0a83d2;}

</style>

</head>

<body>
  <div class="form"  style="height:739px" >
  <img src="images/coverpic1.jpg" alt="Mountain" style="width:668px;height:180px;margin-left:-25px;margin-top:-26px;margin-bottom:10px;box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);"></img>
      <div class="tab-content" style="height:739px">
	  
        
    

<!--<div class="logo floatleft"><b>WELCOME USER</b> </div>-->
<h1 style="margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;color:#FF8800;border-radius: 4px; "><b>Welcome <%=(String)session.getAttribute("username") %></b></h1>
          <h1 style="color:white;margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;background-color:#FF8800;border-radius: 4px;height:35px;"><b>The LNM Institute Of Information Technology</b></h1>
<!--<div class="welcome_img floatleft" style="margin-left:300px;margin-top:100px;"> <img src="images/profile_image.jpg" alt="" title="" height="70px" width="70px"/></div>-->

<!--<div class="left_title_text"> Categories </div>-->

<div id="left_section" class="floatleft" style="margin-left:-25px;margin-top:-25px;height:400px;	"> 
<!--<div style="background-color:#ff8800;margin-left:-25px;margin-top:-25px;height:400px;width:200px;">-->
<br/>


<ul id="nav" name="nav" style="margin-top:-25px; margin-left:10px;">

<li>

		<!--<a class="expanded heading">	Your Text </a>-->	

		<ul class="navigation">                
			<br/>
								                   

                    <li ><a href="home4.jsp" title="" ><div style="margin-left:40px;margin-top:25px;"> HOME</div></a></li>
			<br/>
			<br/>		
	
                    <li ><a href="read.jsp" title=""><div style="margin-left:13px;">PERSONAL INFO</div></a></li>
			
			<br/>
			<br/>
                    <li><a href="programs4.html" title=""><div style="margin-left:-12px;">PROGRAMMES OFFERED</div> </a></li>
			<br/>
			<br/>		
			<li><a href="result.jsp" title="">ALLOTMENT RESULT</a></li>
			<br/>
			<br/>
			<li><a href="contact4.html" title=""><div style="margin-left:20px">CONTACT US</div></a></li>	
                </ul>
            </li>



            
        </ul>
</div>
<!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div>
<br/>-->
<div style="margin-left:520px;margin-top:-25px;"> <img src="images/log_out.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="Logout">LogOut</a> </div>
              <!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div> -->    
              <!--<div style="margin-left:400px;"><h3 >Congrats!! You have been enrolled in  branch </h3></div>-->
              <!--<div style="margin-left:200px;"><h3 >CONGRATS!! The Branch Alloted To You Is </h3></div>-->
<div style="margin-left:200px;"><h3 >CONGRATS!! YOU HAVE BEEN ENROLLED IN <%=branch%> branch</h3></div>
<ul id="nav" name="nav" style=" margin-top:70px;margin-left:300px;width:0px;">

<li>
       
 
</li>
</ul>

      </div><!-- tab-content -->

</div> <!-- /form -->

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="js/index.js"></script>

</body>

</html>

<%
      }  
    
  }  
     else if(rs.getInt("status")==3)
     {                  
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

  <meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <asp:ContentPlaceHolder id="head" runat="server">
    </asp:ContentPlaceHolder>



 
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="css/normalize.css">

    <link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>

     <script type="text/javascript" src="js/functions.js"></script>
     <link href="css/css.css" type="text/css" rel="stylesheet" media="screen" /> 

<!-- Theme Start -->

<link href="css/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.sc-button{
    -moz-transition: all 0.1s ease-in-out 0s;
    border: 0 none;
    cursor: pointer;
    display: inline-block;
    font-family: Arial,sans-serif;
	font-size:13px;
	font-weight: bold;
    padding: 5px 5px;
    width: auto;
	color:#fff;
	margin-left:39px;
	/*margin:0 0.3em 1em 0 !important;*/
	text-decoration:none;
}
.sc-button.round 
{
    border-radius:3px;
    
    }

.sc-button.light-blue{ background-color:#0a83d2;}

</style>

</head>

<body>
  <div class="form"  style="height:739px" >
  <img src="images/coverpic1.jpg" alt="Mountain" style="width:668px;height:180px;margin-left:-25px;margin-top:-26px;margin-bottom:10px;box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);"></img>
      <div class="tab-content" style="height:739px">
	  
        
    

<!--<div class="logo floatleft"><b>WELCOME USER</b> </div>-->
<h1 style="margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;color:#FF8800;border-radius: 4px; "><b>Welcome <%=(String)session.getAttribute("username") %></b></h1>
          <h1 style="color:white;margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;background-color:#FF8800;border-radius: 4px;height:35px;"><b>The LNM Institute Of Information Technology</b></h1>
<!--<div class="welcome_img floatleft" style="margin-left:300px;margin-top:100px;"> <img src="images/profile_image.jpg" alt="" title="" height="70px" width="70px"/></div>-->

<!--<div class="left_title_text"> Categories </div>-->

<div id="left_section" class="floatleft" style="margin-left:-25px;margin-top:-25px;height:400px;	"> 
<!--<div style="background-color:#ff8800;margin-left:-25px;margin-top:-25px;height:400px;width:200px;">-->
<br/>


<ul id="nav" name="nav" style="margin-top:-25px; margin-left:10px;">

<li>

		<!--<a class="expanded heading">	Your Text </a>-->	

		<ul class="navigation">                
			<br/>
								                   

                    <li ><a href="home4.jsp" title="" ><div style="margin-left:40px;margin-top:25px;"> HOME</div></a></li>
			<br/>
			<br/>		
	
                    <li ><a href="read.jsp" title=""><div style="margin-left:13px;">PERSONAL INFO</div></a></li>
			
			<br/>
			<br/>
                    <li><a href="programs4.html" title=""><div style="margin-left:-12px;">PROGRAMMES OFFERED</div> </a></li>
			<br/>
			<br/>		
			<li><a href="result.jsp" title="">ALLOTMENT RESULT</a></li>
			<br/>
			<br/>
			<li><a href="contact4.html" title=""><div style="margin-left:20px">CONTACT US</div></a></li>	
                </ul>
            </li>



            
        </ul>
</div>
<!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div>
<br/>-->
<div style="margin-left:520px;margin-top:-25px;"> <img src="images/log_out.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="Logout">LogOut</a> </div>
              <!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div> -->    
              <div style="margin-left:200px;">
<h3>Wait for Round 2</h3>
 	</div>
              
<ul id="nav" name="nav" style=" margin-top:70px;margin-left:300px;">

<li>
       
 
</li>
</ul>
        


      </div><!-- tab-content -->

</div> <!-- /form -->

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="js/index.js"></script>

</body>

</html>

<%
     }
      
    else if(rs.getInt("status")==5)
     {
%>
     
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

  <meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <asp:ContentPlaceHolder id="head" runat="server">
    </asp:ContentPlaceHolder>



 
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="css/normalize.css">

    <link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>

     <script type="text/javascript" src="js/functions.js"></script>
     <link href="css/css.css" type="text/css" rel="stylesheet" media="screen" /> 

<!-- Theme Start -->

<link href="css/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.sc-button{
    -moz-transition: all 0.1s ease-in-out 0s;
    border: 0 none;
    cursor: pointer;
    display: inline-block;
    font-family: Arial,sans-serif;
	font-size:13px;
	font-weight: bold;
    padding: 5px 5px;
    width: auto;
	color:#fff;
	margin-left:39px;
	/*margin:0 0.3em 1em 0 !important;*/
	text-decoration:none;
}
.sc-button.round 
{
    border-radius:3px;
    
    }

.sc-button.light-blue{ background-color:#0a83d2;}

</style>

</head>

<body>
  <div class="form"  style="height:739px" >
  <img src="images/coverpic1.jpg" alt="Mountain" style="width:668px;height:180px;margin-left:-25px;margin-top:-26px;margin-bottom:10px;box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);"></img>
      <div class="tab-content" style="height:739px">
	  
        
    

<!--<div class="logo floatleft"><b>WELCOME USER</b> </div>-->
<h1 style="margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;color:#FF8800;border-radius: 4px; "><b>Welcome <%=(String)session.getAttribute("username") %></b></h1>
          <h1 style="color:white;margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;background-color:#FF8800;border-radius: 4px;height:35px;"><b>The LNM Institute Of Information Technology</b></h1>
<!--<div class="welcome_img floatleft" style="margin-left:300px;margin-top:100px;"> <img src="images/profile_image.jpg" alt="" title="" height="70px" width="70px"/></div>-->

<!--<div class="left_title_text"> Categories </div>-->

<div id="left_section" class="floatleft" style="margin-left:-25px;margin-top:-25px;height:400px;	"> 
<!--<div style="background-color:#ff8800;margin-left:-25px;margin-top:-25px;height:400px;width:200px;">-->
<br/>


<ul id="nav" name="nav" style="margin-top:-25px; margin-left:10px;">

<li>

		<!--<a class="expanded heading">	Your Text </a>-->	

		<ul class="navigation">                
			<br/>
								                   

                    <li ><a href="home4.jsp" title="" ><div style="margin-left:40px;margin-top:25px;"> HOME</div></a></li>
			<br/>
			<br/>		
	
                    <li ><a href="read.jsp" title=""><div style="margin-left:13px;">PERSONAL INFO</div></a></li>
			
			<br/>
			<br/>
                    <li><a href="programs4.html" title=""><div style="margin-left:-12px;">PROGRAMMES OFFERED</div> </a></li>
			<br/>
			<br/>		
			<li><a href="result.jsp" title="">ALLOTMENT RESULT</a></li>
			<br/>
			<br/>
			<li><a href="contact4.html" title=""><div style="margin-left:20px">CONTACT US</div></a></li>	
                </ul>
            </li>



            
        </ul>
</div>
<!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div>
<br/>-->
<div style="margin-left:520px;margin-top:-25px;"> <img src="images/log_out.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="Logout">LogOut</a> </div>
              <!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div> -->    
              <div style="margin-left:200px;">
<h3>Thank you for registering into our college</h3>
 	</div>
              
<ul id="nav" name="nav" style=" margin-top:70px;margin-left:300px;">

<li>
       
 
</li>
</ul>
        


      </div><!-- tab-content -->

</div> <!-- /form -->

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="js/index.js"></script>

</body>

</html>


<%        
    }       
    else if(rs.getInt("status")==6)
    {
        
        Allot2 allot=new Allot2();
        HashMap<String,String>map1=allot.round2();
        String branch=map1.get(id);
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

  <meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <asp:ContentPlaceHolder id="head" runat="server">
    </asp:ContentPlaceHolder>



 
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="css/normalize.css">

    <link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>

     <script type="text/javascript" src="js/functions.js"></script>
     <link href="css/css.css" type="text/css" rel="stylesheet" media="screen" /> 

<!-- Theme Start -->

<link href="css/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.sc-button{
    -moz-transition: all 0.1s ease-in-out 0s;
    border: 0 none;
    cursor: pointer;
    display: inline-block;
    font-family: Arial,sans-serif;
	font-size:13px;
	font-weight: bold;
    padding: 5px 5px;
    width: auto;
	color:#fff;
	margin-left:39px;
	/*margin:0 0.3em 1em 0 !important;*/
	text-decoration:none;
}
.sc-button.round 
{
    border-radius:3px;
    
    }

.sc-button.light-blue{ background-color:#0a83d2;}

</style>

</head>

<body>
  <div class="form"  style="height:739px" >
  <img src="images/coverpic1.jpg" alt="Mountain" style="width:668px;height:180px;margin-left:-25px;margin-top:-26px;margin-bottom:10px;box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);"></img>
      <div class="tab-content" style="height:739px">
	  
        
    

<!--<div class="logo floatleft"><b>WELCOME USER</b> </div>-->
<h1 style="margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;color:#FF8800;border-radius: 4px; "><b>Welcome <%=(String)session.getAttribute("username") %></b></h1>
          <h1 style="color:white;margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;background-color:#FF8800;border-radius: 4px;height:35px;"><b>The LNM Institute Of Information Technology</b></h1>
<!--<div class="welcome_img floatleft" style="margin-left:300px;margin-top:100px;"> <img src="images/profile_image.jpg" alt="" title="" height="70px" width="70px"/></div>-->

<!--<div class="left_title_text"> Categories </div>-->

<div id="left_section" class="floatleft" style="margin-left:-25px;margin-top:-25px;height:400px;	"> 
<!--<div style="background-color:#ff8800;margin-left:-25px;margin-top:-25px;height:400px;width:200px;">-->
<br/>


<ul id="nav" name="nav" style="margin-top:-25px; margin-left:10px;">

<li>

		<!--<a class="expanded heading">	Your Text </a>-->	

		<ul class="navigation">                
			<br/>
								                   

                    <li ><a href="home4.jsp" title="" ><div style="margin-left:40px;margin-top:25px;"> HOME</div></a></li>
			<br/>
			<br/>		
	
                    <li ><a href="read.jsp" title=""><div style="margin-left:13px;">PERSONAL INFO</div></a></li>
			
			<br/>
			<br/>
                    <li><a href="programs4.html" title=""><div style="margin-left:-12px;">PROGRAMMES OFFERED</div> </a></li>
			<br/>
			<br/>		
			<li><a href="result2.jsp" title="">ALLOTMENT RESULT</a></li>
			<br/>
			<br/>
			<li><a href="contact4.html" title=""><div style="margin-left:20px">CONTACT US</div></a></li>	
                </ul>
            </li>



            
        </ul>
</div>
<!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div>
<br/>-->
<div style="margin-left:520px;margin-top:-25px;"> <img src="images/log_out.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="Logout">LogOut</a> </div>
              <!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div> -->    
              <div style="margin-left:200px;"><h3 >CONGRATS!! The Branch Alloted To You Is <%=branch%></h3></div>

<ul id="nav" name="nav" style=" margin-top:70px;margin-left:300px;">

<li>
       
 <ul class="navigation"><li><a href="ConfirmServlet" title=""><div style="margin-left:-16px;"><center>CONFIRM</center></div> </a></li>
			<br/>
			<br/>		
			
			<li><a href="DeclineServlet" title=""><div style="margin-left:35px">DECLINE</div></a></li>
</ul>
</li>
</ul>

      </div><!-- tab-content -->

</div> <!-- /form -->

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="js/index.js"></script>

</body>

</html>
<%
    }
        
  else if(rs.getInt("status")==7)
  {
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

  <meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <asp:ContentPlaceHolder id="head" runat="server">
    </asp:ContentPlaceHolder>



 
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="css/normalize.css">

    <link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>

     <script type="text/javascript" src="js/functions.js"></script>
     <link href="css/css.css" type="text/css" rel="stylesheet" media="screen" /> 

<!-- Theme Start -->

<link href="css/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.sc-button{
    -moz-transition: all 0.1s ease-in-out 0s;
    border: 0 none;
    cursor: pointer;
    display: inline-block;
    font-family: Arial,sans-serif;
	font-size:13px;
	font-weight: bold;
    padding: 5px 5px;
    width: auto;
	color:#fff;
	margin-left:39px;
	/*margin:0 0.3em 1em 0 !important;*/
	text-decoration:none;
}
.sc-button.round 
{
    border-radius:3px;
    
    }

.sc-button.light-blue{ background-color:#0a83d2;}

</style>

</head>

<body>
  <div class="form"  style="height:739px" >
  <img src="images/coverpic1.jpg" alt="Mountain" style="width:668px;height:180px;margin-left:-25px;margin-top:-26px;margin-bottom:10px;box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);"></img>
      <div class="tab-content" style="height:739px">
	  
        
    

<!--<div class="logo floatleft"><b>WELCOME USER</b> </div>-->
<h1 style="margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;color:#FF8800;border-radius: 4px; "><b>Welcome <%=(String)session.getAttribute("username") %></b></h1>
          <h1 style="color:white;margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;background-color:#FF8800;border-radius: 4px;height:35px;"><b>The LNM Institute Of Information Technology</b></h1>
<!--<div class="welcome_img floatleft" style="margin-left:300px;margin-top:100px;"> <img src="images/profile_image.jpg" alt="" title="" height="70px" width="70px"/></div>-->

<!--<div class="left_title_text"> Categories </div>-->

<div id="left_section" class="floatleft" style="margin-left:-25px;margin-top:-25px;height:400px;	"> 
<!--<div style="background-color:#ff8800;margin-left:-25px;margin-top:-25px;height:400px;width:200px;">-->
<br/>


<ul id="nav" name="nav" style="margin-top:-25px; margin-left:10px;">

<li>

		<!--<a class="expanded heading">	Your Text </a>-->	

		<ul class="navigation">                
			<br/>
								                   

                    <li ><a href="home4.jsp" title="" ><div style="margin-left:40px;margin-top:25px;"> HOME</div></a></li>
			<br/>
			<br/>		
	
                    <li ><a href="read.jsp" title=""><div style="margin-left:13px;">PERSONAL INFO</div></a></li>
			
			<br/>
			<br/>
                    <li><a href="programs4.html" title=""><div style="margin-left:-12px;">PROGRAMMES OFFERED</div> </a></li>
			<br/>
			<br/>		
			<li><a href="result.jsp" title="">ALLOTMENT RESULT</a></li>
			<br/>
			<br/>
			<li><a href="contact4.html" title=""><div style="margin-left:20px">CONTACT US</div></a></li>	
                </ul>
            </li>



            
        </ul>
</div>
<!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div>
<br/>-->
<div style="margin-left:520px;margin-top:-25px;"> <img src="images/log_out.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="Logout">LogOut</a> </div>
              <!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div> -->    
              <div style="margin-left:200px;">
<h3>You have not been alloted any branch.Thank you for registering into our college</h3>
 	</div>
              
<ul id="nav" name="nav" style=" margin-top:70px;margin-left:300px;">

<li>
       
 
</li>
</ul>
        


      </div><!-- tab-content -->

</div> <!-- /form -->

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="js/index.js"></script>

</body>

</html>


<%
  }          
}
%>