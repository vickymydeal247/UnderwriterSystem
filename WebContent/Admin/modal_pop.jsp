<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
 function abc() {
	  var modal = document.getElementById('myModal');
	  $("#myModal").modal('show')
	}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Login</title>
 
 

	
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
<body onload ="abc()">

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  <div id="login-page">
	  	<div class="container">
		      <form class="form-login" action="index.html">
		        
		    <!--    <div class="login-wrap">
		           
		            <label class="checkbox">
		                <span class="pull-right">
		                    <a data-toggle="modal" href="login.html#myModal" style="color:#73879B;"> Forgot Password?</a>
		
		                </span>
		            </label>
					
		            
		           
		        </div> --> 
		
		          <!-- Modal -->
		          
		          <div  aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal"  name="myModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">Success!</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p>Your id is : </p>
		                         
		
		                      </div>
		                      <div class="modal-footer">
		                          <button data-dismiss="modal" class="btn btn-primary" type="button">Close</button>
		                        <!--    <button class="btn btn-primary" type="button">Submit</button>-->
		                      </div>
		                  </div>
		              </div>
		          </div>
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