<script>
    alert("Registration failed...Please try again");
</script>

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
	
                    <li ><a href="registration.jsp" title=""><div style="margin-left:13px;">FULL REGISTRATION</div></a></li>
			
			<br/>
			<br/>
                    <li><a href="programs.html" title=""><div style="margin-left:-12px;">PROGRAMMES OFFERED</div> </a></li>
			<br/>
			<br/>
			<li><a href="contact.html" title=""><div style="margin-left:20px">CONTACT US</div></a></li>	
                </ul>
            </li>



            
        </ul>
</div>
<!--<div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div>
<br/>-->
<div style="margin-left:520px;margin-top:-25px;"> <img src="images/log_out.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="Logout">LogOut</a> </div>
             <!-- <div style="margin-left:520px;"> <img src="images/icon.jpg" alt="" title="" /> &nbsp; &nbsp; &nbsp;<a href="#">Settings</a> </div> -->
<div style="margin-left:190px;margin-top:50px;">
<h2><b><u>VISION:  </u><b> </h2>
 	</div>
        <div style="margin-left:190px;margin-top:20px;" >
	<p>
		To establish world class platform for creation of knowledge through quality research    
		and its dissemination through technologically enabled teaching and learning pedagogy
		in the field of science, technology, engineering, arts and management.To become a catalyst in the societal and national development, by ensuring
		continuous interaction with industry and other academic and research institutions in India and abroad.
	</p>	
	</div>

        

      </div><!-- tab-content -->

</div> <!-- /form -->

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="js/index.js"></script>

</body>

</html>