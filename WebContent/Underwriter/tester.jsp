<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
$('select.changeStatus').change(function(){

    // You can access the value of your select field using the .val() method
    alert('Select field value has changed to' + $('select.changeStatus').val());

   // You can perform an ajax request using the .ajax() method
   $.ajax({
       type: 'GET',
      url: 'changeStatus.php', // This is the url that will be requested

      // This is an object of values that will be passed as GET variables and 
      // available inside changeStatus.php as $_GET['selectFieldValue'] etc...
      data: {selectFieldValue: $('select.changeStatus').val()},

      // This is what to do once a successful request has been completed - if 
      // you want to do nothing then simply don't include it. But I suggest you 
      // add something so that your use knows the db has been updated
      success: function(html){ Do something with the response },
      dataType: 'html'

    	  document.getElementById('1').value = "hi";
    });

}); 
</script>
</head>
<body>
<%if(session.getId()!=session.getAttribute("session")){
	
	response.sendRedirect("../Admin/login.jsp");
	
} %>
<form id ="h1"action="Change-status.php" method="post">
        <select class="changeStatus" name="changeStatus">
                <option value="0">Starting</option>
                <option value="1">Ongoing</option>
                <option value="2">Over</option>
        </select>
        <input class="projectId" type="hidden" name="projectId" value="<?php echo $data['id'];?>"/>
</form>
<form id="hello">
hi<input type="text" name="1" id="1">
</form>

<script src="../js/jquery.min.js"></script>
</body>
</html>