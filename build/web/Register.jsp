<%@page import="project2.RandGen.Mode"%>
<%@page import="project2.RandGen"%>
<%@page import="project2.Database" %>

<%   
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String mobno=request.getParameter("mobno");
    String email=request.getParameter("email");
    String appid="LNM"+RandGen.generateRandomString(4,Mode.ALPHANUMERIC);
    String password=RandGen.generateRandomString(7,Mode.ALPHANUMERIC);
    
    String s=Database.insert(appid,fname,lname,email,mobno,password);
   
    if(s.equals("successful"))
   {
%>
   <!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Welcome Applicant</title>

  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="css/normalize.css">

    <link rel="stylesheet" href="css/style.css">

</head>

<body oncopy="return true" oncut="return false" onpaste="return false">
  <div class="form">
  <img src="coverpic1.jpg" alt="Mountain" style="width:668px;height:180px;margin-left:-25px;margin-top:-26px;margin-bottom:10px;box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);"></img>
      <div class="tab-content">
	  
        <div id="signup">
          <h1 style="color:white;margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;background-color:#FF8800;border-radius: 4px; ">YOUR ACCOUNT DETAILS</h1>

          <form action="index.html" method="post">
			<h3 style="color:#000000; font-family: 'Titillium Web', sans-serif;">Application Id</h3>
            <div class="field-wrap">
              <input type="text" name="appid" value="<%=appid%>" required autocomplete="off" disabled/>
            </div>
			<h3 style="color:#000000;  font-family: 'Titillium Web', sans-serif;">Password</h3>
            <div class="field-wrap">
              <input type="text" name="password" value="<%=password%>" required autocomplete="off" disabled />
            </div>
            
          <button type="submit" class="button button-block"/>Ok</button>

          </form>

        </div>

        <div id="login">   
          <h1>Welcome Back!</h1>

          <form action="/" method="post">

            <div class="field-wrap">
            <label>
              Application ID<span class="req">*</span>
            </label>
            <input type="text"required autocomplete="off"/>
          </div>

          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off"/>
          </div>

         <button class="button button-block"/>Home</button>

          </form>

        </div>

      </div><!-- tab-content -->

</div> <!-- /form -->

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>

  <script src="js/index.js"></script>

</body>

</html>

<%
   }
%> 
    
    
