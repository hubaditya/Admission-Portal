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
		  <h1 style="margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;color:#FF8800;border-radius: 4px; ">Welcome Back!</h1>
          <h1 style="color:white;margin-left:-25px;margin-right:-25px;margin-top:-20;pxmargin-bottom:-20px;background-color:#FF8800;border-radius: 4px;">Please Fill Your Details</h1>

          <form action="registration" method="post">

          <div class="top-row">
            <div class="field-wrap">
              <label>
              </label>
              <input type="text" name="fname" value="<%=session.getAttribute("fname")%>" required autocomplete="off" readonly />
            </div>

            <div class="field-wrap">
              <label>
              </label>
                <input type="text" name="lname" value="<%=session.getAttribute("lname")%>" required autocomplete="off" readonly/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
             
            </label>
            <!--<input type="email"required autocomplete="on"/>-->
            <input type="email" name="email" value="<%=session.getAttribute("email")%>" required autocomplete="off" readonly />
          </div>
		  
          <div class="field-wrap">
            <label>
              
            </label>
              <input type="digits" name="mobno" value="<%=session.getAttribute("mobno")%>" required autocomplete="off" validaionexpression="\d+" readonly/>
          </div>

          <div class="field-wrap">
            <label>
              Address<span class="req">*</span>
            </label>
            <input type="text" name="address" required autocomplete="off"/>
          </div>

          <div class="field-wrap">
            <label>
              <span class="req"></span>
            </label>
          <!--  <input type="text"required autocomplete="off"/>-->
          <input type="date" size="12" name="dob" required autocomplete="off" max="2000-01-02" min="1995-01-02"/>
          </div>
		  
		  <div class="field-wrap">
            <select name="gender" required autocomplete="off">
                <option disabled selected style="display: none;">Gender<span class="req">*</span></option>
                <option style="background-color:#FF8800">Male</option>
                <option style="background-color:#FF8800">Female</option>
                <option style="background-color:#FF8800">Other</option>
            </select>
        </div><br/><br/>
		  
          <div class="field-wrap">
            <label>
              Gaurdian's Name<span class="req">*</span>
            </label>
            <input type="text" name="gname" required autocomplete="off"/>
          </div>
		  
          <div class="field-wrap">
            <label>
              Gaurdian's Mobile No.<span class="req">*</span>
            </label>
            <input type="number" name="gmobno" min="1000000000" max="9999999999" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Gaurdian's Occupation<span class="req">*</span>
            </label>
            <input type="text" name="gocc" required autocomplete="off"/>
          </div>
          <div class="field-wrap">
            <label>
              JEE-Mains Rank<span class="req">*</span>
            </label>
            <input type="number" name="rank" min="1" max="100000" required autocomplete="off"/>
          </div>
        <div class="feild-wrap">
            <select name="course" required autocomplete="off">
                <option disabled selected style="display: none;">COURSE NAME<span class="req">*</span></option>
                <option style="background-color:#FF8800">B.Tech</option>
                <option style="background-color:#FF8800">M.Tech</option>
                <option style="background-color:#FF8800">Ph.D</option>
            </select>
        </div>
	 <div class="top-row" style="margin-top:40px;">
         
	<select name="p1" required autocomplete="off">
		<option disabled selected style="display: none;"> Preference 1<span class="req">*</span></option>
		<option style="background-color:#FF8800"> CSE</option>
		<option style="background-color:#FF8800"> CCE</option>
		<option style="background-color:#FF8800"> ECE</option>
		<option style="background-color:#FF8800"> MME</option>
		<option style="background-color:#FF8800"> IT</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         
            
	<select name="p2">
		<option disabled selected style="display: none;"> Preference 2</option>
		<option style="background-color:#FF8800"> CSE</option>
		<option style="background-color:#FF8800"> CCE</option>
		<option style="background-color:#FF8800"> ECE</option>
		<option style="background-color:#FF8800"> MME</option>
		<option style="background-color:#FF8800"> IT</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          
           
	<select name="p3">
		<option disabled selected style="display: none;"> Preference 3</option>
		<option style="background-color:#FF8800"> CSE</option>
		<option style="background-color:#FF8800"> CCE</option>
		<option style="background-color:#FF8800"> ECE</option>
		<option style="background-color:#FF8800"> MME</option>
		<option style="background-color:#FF8800"> IT</option>
		</select></div>
	<div class="field-wrap" style="margin-top:40px; margin-bottom:90px;margin-left:135px;">
            <label>
           
                Faculty References(if any)
            </label>
            
    </div>
     <div class="top-row" >
                
		<div class="field-wrap">
            <label>
              Faculty Id
            </label>
            <input type="number" name="fid" min="10101" max="10505"/>
          </div>
         <br>		
            <select name="department">
		<option disabled selected style="display: none;"> Faculty Department</option>
		<option style="background-color:#FF8800"> CSE</option>
		<option style="background-color:#FF8800"> CCE</option>
		<option style="background-color:#FF8800"> ECE</option>
		<option style="background-color:#FF8800"> MME</option>
		<option style="background-color:#FF8800"> IT</option>
		</select>
          </div><br/>
        <div class="field-wrap" style=" margin-left:135px;">
            <label>
            
                Academic Qualifications
            </label>
            
    </div>
    <div class="field-wrap" style="margin-bottom:80px;">
            <label>
                Xth
            </label>
            
    </div>
     <div class="top-row" >
    <div style="width:140px;">
     <select name="board1" required autocomplete="off">
		<option disabled selected style="display: none;"> Board<span class="req">*</span></option>
		<option style="background-color:#FF8800"> CBSE</option>
		<option style="background-color:#FF8800"> RBSE</option>
		<option style="background-color:#FF8800"> ICSE</option>
	</select>
    </div>
     <div class="field-wrap" style="width:140px" >
            <label>
              Percentage<span class="req">*</span>
            </label>
         <input type="number" name="percent1" min="60" max="100" step="any" required autocomplete="off"/>
          </div>
          <div class="field-wrap" style="width:190px" >
            <label>
              Year Of Passing<span class="req">*</span>
            </label>
            <input type="number" name="year1" min="2012" max="2013" required autocomplete="off"/>
          </div>
    </div>
    <div class="field-wrap" >
            <label>
                XIIth
            </label>
            
    </div>
     <div class="top-row" style="width:100%;">
    <div style="width:140px;">
     <select name="board2" required autocomplete="off">
		<option disabled selected style="display: none;"> Board<span class="req">*</span></option>
		<option style="background-color:#FF8800"> CBSE</option>
		<option style="background-color:#FF8800"> RBSE</option>
		<option style="background-color:#FF8800"> ICSE</option>
	</select>
    </div>
     <div class="field-wrap" style="width:140px" >
            <label>
              Percentage<span class="req">*</span>
            </label>
         <input type="number" name="percent2" min="60" max="100" step="any" required autocomplete="off"/>
          </div>
          <div class="field-wrap" style="width:190px" >
            <label>
              Year Of Passing<span class="req">*</span>
            </label>
           <input type="number" name="year2" min="2014" max="2015" required autocomplete="off"/>
          </div>
    </div>
      <!--  <input id="Button1" type="button" value="Submit" class="button button-block" />-->
	<button type="submit" class="button button-block"/>Submit</button>
       
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