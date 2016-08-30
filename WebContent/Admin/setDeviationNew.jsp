<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/normalize.css" />
    <link rel="stylesheet" href="../css/ion.rangeSlider.css" />
    <link rel="stylesheet" href="../css/ion.rangeSlider.skinFlat.css" />
<title>Insert title here</title>
</head>
<jsp:include page="cssLinks.jsp"/>
<body>
<%if(session.getId()!=session.getAttribute("session")){

	response.sendRedirect("login.jsp");
	
} %>

<%
System.out.println(request.getParameter("type"));
String pid= request.getParameter("type");

System.out.println("aa2");
HttpSession ses=request.getSession();


//String id=(String) ses.getAttribute("pidval" );
//System.out.println(id);
ses.setAttribute("p", pid);
System.out.println("current val"+pid);


String cid=(String)ses.getAttribute("pidval");
System.out.print("DD : "+cid);
//System.out.print("abcd");
out.print("<center><font color='black' size='5'>Proposal Id  : "+pid+"</font></center>");
%>


    <!--div class="container body">

 <div>
 	<form  action="../ControllerServlet" method="post">
<table align="center" > 
		<tr><td>
        <input type="text" id="range_30" value="" name="range" /></td></tr>
        <!--input id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="20" data-slider-step="1" data-slider-value="14">
        </td></tr>
        <tr><td><input type="submit" value="Submit"></td></tr></table>
</form>
    </div>

        <div class="main_container">

      

        </div>
 			
 			  </div-->
 			  
 			  
 <div class="container body">
<form  action="../ControllerServlet" method="post">
 <div>
        <input type="text" id="range_30" value="" name="range" />
 </div>

  <div class="main_container">  
      </div>
      <input type="submit" value="Submit">
 	</form>		
  </div>
  
 <jsp:include page="jsLinks.jsp"/>
 
<script src="../js/ion_range/ion.rangeSlider.min.js"></script>


<script>
$('#ex1').slider({
	formatter: function(value) {
		return 'Current value: ' + value;
	}
});
</script>

<script>
$('#range_30').slider({
	formatter: function(value) {
		return 'Current value: ' + value;
	}
});
</script>
<script>

$("#range_30").ionRangeSlider({
    type: "single",
    min: -5,
    max: 5,
    from: 0,
    step: 0.10,
    grid: true,
    grid_snap: true
});


</script>

</body>
</html>