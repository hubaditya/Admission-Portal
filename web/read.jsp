<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="project2.Connectify"%>
<% 
    Connection con=Connectify.getConnection();
    PreparedStatement ps=null;
    
    ps=con.prepareStatement("select * from admission.applicant where appid=?");
    ps.setString(1,(String)session.getAttribute("appid"));
    ResultSet rs1=ps.executeQuery();
    rs1.next();
    
    ps=con.prepareStatement("select * from admission.guardian where appid=?");
    ps.setString(1,(String)session.getAttribute("appid"));
    ResultSet rs2=ps.executeQuery();
    
    ps=con.prepareStatement("select * from admission.rank1 where appid=?");
    ps.setString(1,(String)session.getAttribute("appid"));
    ResultSet rs3=ps.executeQuery();
    
    ps=con.prepareStatement("select * from admission.class where appid=?");
    ps.setString(1,(String)session.getAttribute("appid"));
    ResultSet rs4=ps.executeQuery();
    
    ps=con.prepareStatement("select * from admission.faculty where facultyid=?");
    ps.setInt(1,Integer.parseInt(rs1.getString("fid")));
    ResultSet rs5=ps.executeQuery();
    
    if(rs2.next() && rs3.next() && rs4.next() && rs5.next())
    {
     
%>

<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <title>Admission Details</title>

  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" type="text/css" media="all" href="jsDatePick_ltr.min.css" />
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="jquery.1.4.2.js"></script>
<script type="text/javascript" src="jsDatePick.jquery.min.1.3.js"></script>
<script type="text/javascript">
    window.onload = function () {
        new JsDatePick({
            useMode: 2,
            target: "inputField",
            dateFormat: "%d-%M-%Y"

        });
    };
</script>
</head>

<body>

  <div class="form">
<img src="coverpic1.jpg" alt="Mountain" style="width:668px;height:180px;margin-left:-25px;margin-top:-26px;margin-bottom:10px;box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);"></img>
      <div class="tab-content">
        <div id="signup">
          <h1 style="color:white;margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;background-color:#FF8800;border-radius: 4px;">Personal Information</h1>
          <form action="/" method="post">

          <div class="top-row">
            <div class="field-wrap">First Name
              
              <input type="text" name="fname" value="<%=session.getAttribute("fname")%>" required autocomplete="on" disabled readonly />
            </div>

            <div class="field-wrap">Last Name
              
              <input type="text"required autocomplete="on" name="lname" value="<%=session.getAttribute("lname")%>" disabled readonly />
            </div>
          </div>

          <div class="field-wrap">Email Id
            
            <!--<input type="email"required autocomplete="on"/>-->
            <input type="text" name="email" value="<%=session.getAttribute("email")%>" disabled />
          </div>
		  
          <div class="field-wrap">
            Mobile No.
            <input type="digits"required autocomplete="off" name="mobno" value="<%=session.getAttribute("mobno")%>" validaionexpression="\d+" readonly/>
          </div>

          <div class="field-wrap">Address
            
            <input type="text" name="address" value="<%=session.getAttribute("address")%>" required autocomplete="off" readonly/>
          </div>

          <div class="field-wrap">
           
              Date of Birth
          <!--  <input type="text"required autocomplete="off"/>-->
          <input type="text" size="12" name="dob" id="inputField" value="<%=rs1.getString("dob")%>" required autocomplete="off" disabled readonly/>
          </div>
		  
		  <div class="field-wrap">Gender
            
            <input type="text" name="gender" value="<%=rs1.getString("gender")%>" required autocomplete="off" disabled readonly/>
          </div>
		  
          <div class="field-wrap">
            
              Gaurdian's Name
            <input type="text" name="gname" value="<%=rs2.getString("gname")%>" required autocomplete="off" disabled readonly/>
          </div>
		  
          <div class="field-wrap">
           
              Gaurdian's Mobile No.
            <input type="digits" name="gmobno" value="<%=rs2.getString("gmobno")%>" required autocomplete="off" disabled readonly/>
          </div>
          
          <div class="field-wrap">
            
              Gaurdian's Occupation
            <input type="text" name="gocc" value="<%=rs2.getString("gocc")%>" required autocomplete="off" disabled readonly/>
          </div>
          <div class="field-wrap">
            
              JEE-Mains Rank
            <input type="Digit" name="rank" value="<%=rs3.getString("ranking")%>" required autocomplete="off" disabled readonly/>
          </div>
        <div class="field-wrap">
            
              Course
            <input type="text" name="course" value="B.Tech" required autocomplete="off" disabled readonly/>
          </div>
	 <div class="field-wrap">
            
              Preference 1
            <input type="Digit" name="p1" value="<%=rs1.getString("p1")%>" required autocomplete="off" disabled readonly/>
          </div>
	<div class="field-wrap">
            
              Preference 2
            <input type="text" name="p2" value="<%=rs1.getString("p2")%>" required autocomplete="off" disabled readonly/>
          </div>
    
    <div class="field-wrap">
            
              Preference 3
            <input type="Digit" name="p3" value="<%=rs1.getString("p3")%>" required autocomplete="off" disabled readonly/>
          </div>            
		<div class="field-wrap">
        
              Faculty Id
            
            <input type="text" name="fid" value="<%=rs1.getString("fid")%>" required autocomplete="off" disabled readonly/>
          </div>
				
            <div class="field-wrap">
            
              Faculty Department
            <input type="text" name="department" value="<%=rs5.getString("department")%>" required autocomplete="off" disabled readonly/>
          </div>
		
        <div class="field-wrap" style=" margin-left:185px;">
            <label>
            
                Academic Qualifications
            </label>
            
    </div><br/><br/>
    <div class="field-wrap" style="margin-bottom:50px;">
            <label>
                Xth
            </label>
            
    </div>
    <div class="top-row">
            <div class="field-wrap" style="width:189px">Board
              
              <input type="text" name="board1" value="<%=rs4.getString("ten_b")%>" required autocomplete="on" disabled readonly />
            </div>

            <div class="field-wrap" style="width:189px">Marks
              
              <input type="text" name="percent1" value="<%=rs4.getString("ten_p")%>" required autocomplete="on" disabled readonly/>
            </div>
			<div class="field-wrap"  style="width:189px">Year
              
              <input type="text" name="year1" value="<%=rs4.getString("ten_y")%>" required autocomplete="on" disabled readonly/>
            </div>
          </div>
    <div class="field-wrap" style="margin-bottom:50px" >
            <label>
                XIIth
            </label>
            
    </div>
	<div class="top-row">
            <div class="field-wrap" style="width:189px">Board
              
              <input type="text" name="board2" value="<%=rs4.getString("twelve_b")%>" required autocomplete="on" disabled  readonly/>
            </div>

            <div class="field-wrap" style="width:189px">Marks
              
              <input type="text" name="percent2" value="<%=rs4.getString("twelve_p")%>" required autocomplete="on" disabled readonly/>
            </div>
			<div class="field-wrap"  style="width:189px">Year
              
              <input type="text" year="year2" value="<%=rs4.getString("twelve_y")%>" required autocomplete="on" disabled readonly/>
            </div>
          </div>
       
          </form>

        </div>

        <div id="login">   
          <h1>Welcome Back!</h1>

          <form action="/" method="post">

            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email"required autocomplete="off"/>
          </div>

          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off"/>
          </div>

          <p class="forgot"><a href="#">Forgot Password?</a></p>

          <button class="button button-block"/>Log In</button>

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