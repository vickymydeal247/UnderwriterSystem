<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Lock Screen</title>

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
</head>
<body onload="getTime()">

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  	<div class="container">
	  	
	  		<div id="showtime"></div>
	  			<div class="col-lg-4 col-lg-offset-4">
	  				<div class="lock-screen">
		  				<h2><a data-toggle="modal" href="#myModal"><i class="fa fa-lock"></i></a></h2>
		  				<p style="color:white;">UNLOCK</p>
		  				
				          <!-- Modal -->
				          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
				           
				              <div class="modal-dialog">
				                  <div class="modal-content">
				                  
				                      <div class="modal-header">
				                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                          <h4 class="modal-title">Welcome Back</h4>
				                      </div>
				                       <form  action="../ControllerServlet" method="post">
				                      <div class="modal-body">
				                     
				                          <input type="text" name="userid" placeholder="Username" autocomplete="off" class="form-control placeholder-no-fix">
				                          <input type="password" name="password" placeholder="Password" autocomplete="off" class="form-control placeholder-no-fix">
				                           <input type="hidden" name="action" value="authentication">
										
				                      </div>
				                      <div class="modal-footer">
				                      
				                          <button data-dismiss="modal" class="btn btn-danger" type="button">Cancel</button>
				                          <button type="submit" class="btn btn-primary" type="button">Login</button>
				                      </div>
				                      </form>
				                    
				                  </div>
				              </div>
				             
				          </div>
				          <!-- modal -->
		  				
		  				
	  				</div> <!--/lock-screen -->
	  			</div><!-- /col-lg-4 -->
	  	
	  	</div><!-- /container -->

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
        $.backstretch("../images/material-3.png", {speed: 500});
    </script>

    <script>
        function getTime()
        {
            var today=new Date();
            var h=today.getHours();
            var m=today.getMinutes();
            var s=today.getSeconds();
            // add a zero in front of numbers<10
            m=checkTime(m);
            s=checkTime(s);
            document.getElementById('showtime').innerHTML=h+":"+m+":"+s;
            t=setTimeout(function(){getTime()},500);
        }

        function checkTime(i)
        {
            if (i<10)
            {
                i="0" + i;
            }
            return i;
        }
    </script>

  </body>
</html>