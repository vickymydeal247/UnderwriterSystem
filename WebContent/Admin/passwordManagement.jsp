<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
document.getElementById("userid"). value = <%request.getParameter("userid");%>
</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Password Management</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="../font-awesome-4.4.0/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/style-responsive.css" rel="stylesheet">
	
	<link href="../css/roboto.min.css" rel="stylesheet">
        <link href="../css/material-fullpalette.css" rel="stylesheet">
        <link href="../css/ripples.min.css" rel="stylesheet">
        <link href="../css/snackbar.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<%if(session.getId()!=session.getAttribute("session")){

	response.sendRedirect("login.jsp");
	
} %>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  <div id="login-page">
	  	<div class="container">
		      <form class="form-login" action="../ControllerServlet">
		        <h2 class="form-login-heading">Password Management</h2>
		        <div class="login-wrap">
		        <form action="../loginController"  ><%String v=request.getParameter("userid");%>
		        <input type="text" name="userid" id="userid" value ="<%=request.getParameter("userid")%>" class="form-control"  >
		            <br>
		        
		            <input type="password" name="pwd1" id="pwd1" class="form-control" placeholder="New Password" autofocus required>
		            <br>
		            <input type="password" name="pwd2" id="pwd2" class="form-control"  placeholder="Confirm Password" required>
	           		<script>
	           			var password = document.getElementById("pwd1")
	          	  			, confirm_password = document.getElementById("pwd2");

	          			function validatePassword(){
	          	  			if(password.value != confirm_password.value) {
	          	    			confirm_password.setCustomValidity("Passwords Don't Match");
	          	  		} else {
	          	   				 confirm_password.setCustomValidity('');
	          	  		}
	          		}

	          	password.onchange = validatePassword;
	          	confirm_password.onkeyup = validatePassword;
	          	</script>
		            <br>	
					<div class="ln_solid"></div>
					<input type="hidden" name="action" value="changePwd" >
		            <button class="btn btn-primary btn-block" href="index.html" type="submit" ><i class="fa fa-lock"></i> Confirm</button>
		             </form>
		        </div>
		
		          <!-- Modal -->
		         
		          <!-- modal -->
		
		      </form>	  	
	  	
	  	</div>
	  </div>
	

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>

	<script src="../js/ripples.min.js"></script>
        <script src="../js/material.min.js"></script>
        <script src="../js/snackbar.min.js"></script>


        <script src="../js/nouislider.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="../js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("../images/material-1.jpg", {speed: 500});
    </script>

  </body>
</html>