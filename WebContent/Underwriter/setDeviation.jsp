<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Home | </title>

    <!-- Bootstrap core CSS -->
		<jsp:include page="cssLinks.jsp"/>

   
 <link rel="stylesheet" href="../css/normalize.css" />
    <link rel="stylesheet" href="../css/ion.rangeSlider.css" />
    <link rel="stylesheet" href="../css/ion.rangeSlider.skinFlat.css" />
   

    <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<title>Insert title here</title>
</head>
<body class="nav-md">
<%-- <%if(session.getId()!=session.getAttribute("session")){

	response.sendRedirect("login.jsp");
	
} %> --%>
    <div class="container body">


        <div class="main_container">

            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">

                    <div class="clearfix"></div>


                    <!-- menu prile quick info -->
        
                    <!-- /menu prile quick info -->
                <!--    <br />

                    <!-- sidebar menu -->
                    <jsp:include page="sideNav.jsp"/>
                    <!-- /sidebar menu -->

                    <!-- /menu footer buttons -->
                   
                    <!-- /menu footer buttons -->
                </div>
            </div> 
            <!-- top navigation -->
            <jsp:include page="topNav.jsp"/>
            <!-- /top navigation -->

            <!-- page content -->
            <div class="right_col" role="main">
                <div class="">

                    <div class="page-title">
                        <div class="title_left">
                            
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                     <div class="col-md-12 col-sm-12 col-xs-12">
                       <div class="x_panel">
                            <h2>Select Value</h2>
                             <div class="clearfix"></div>
                             <div class="ln_solid"></div>
                             <div class="x_content">
                              	<form action="../controller_UnderWriter">
								    <div class="form-control">
									   <label class="control-label col-md-3 col-sm-3 col-xs-12" for="lbl-first-name">Set Deviation for ID <%=request.getParameter("deviation")%></span>
                                            </label>
									  
									 <input type="hidden" name="id" value="<%=request.getParameter("deviation")%>">
									</div>
 									<div>
       								    <input type="text" id="range_30" value="" name="range" />
   									</div> 
   									<div class="center">
   										<div class="clearfix"></div>
   										<div class="ln_solid"></div>
   		 								<button type="submit" class="btn btn-success">Submit</button>
   		 							</div>
									<input type="hidden" name="action" value="setDeviation">
      							</form>
                             </div>
                        </div>
                     </div> 
                    </div>

   
                </div>
                <!-- /page content -->

                <!-- footer content -->
               
                <!-- /footer content -->

            </div>
 			<jsp:include page="footer.jsp"/>
       		 </div>
 
		  </div>
        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>
         <script src="../js/jquery.min.js"></script>
        <script src="../js/ion_range/ion.rangeSlider.min.js"></script>

<script>
var $range = $(".js-range-slider"),
$result = $(".js-result"),
$getvalues = $(".js-get-values"),

from = 0,
to = 0;

var saveResult = function (data) {
from = data.from;
to = data.to;
};

var writeResult = function () {
var result = "from: " + from + ", to: " + to;
$result.html(result);
};
$("#range_30").ionRangeSlider({
    type: "single",
    min: -5,
    max: 5,
    from: 0,
    step: 0.25,
    grid: true,
    grid_snap: true,
    onStart: function (data) {
        saveResult(data);
        writeResult();
    },
    onChange: saveResult,
    onFinish: saveResult
});

$getvalues.on("click", writeResult);
</script>
        
		
			 <jsp:include page="jsLinks.jsp"/>
			
       
      


        <!-- select2 -->
   
        <!-- /select2 -->
        <!-- input tags -->
 
        <!-- /input tags -->
        <!-- form validation -->
       
        <!-- /form validation -->
        <!-- editor -->

        <!-- /editor -->
</body>
</html>