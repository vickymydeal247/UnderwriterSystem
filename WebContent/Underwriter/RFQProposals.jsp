<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.underwriter.controller.DBConnection"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
 	<%if(session.getId()!=session.getAttribute("session")){
	
	response.sendRedirect("../Admin/login.jsp");
	
} %>			 							
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css" title="currentStyle">
@import "media/css/demo_page.css";

@import "media/css/demo_table_jui.css";

 @import "media/support/themes/smoothness/jquery-ui-1.8.4.custom.css";
</style>

		<script>
		 
function preferedBrowser() { 
    var a = new String(document.getElementById("proposals").value); 	
    if(a == "p0")
    {	
		   document.getElementById("d0").style.display = 'block';
		   document.getElementById("d1").style.display = 'none';
		   document.getElementById("d10").style.display = 'none';
		   document.getElementById("d9").style.display = 'none';
	       document.getElementById("d8").style.display = 'none';
		   document.getElementById("d7").style.display = 'none';
	       document.getElementById("d6").style.display = 'none';
		   document.getElementById("d5").style.display = 'none';
           document.getElementById("d4").style.display = 'none';
		   document.getElementById("d3").style.display = 'none';  	   
	       document.getElementById("d2").style.display = 'none';
		   
    }		
    
    
    if(a == "p1")
       {	
    	   document.getElementById("d0").style.display = 'none';
		   document.getElementById("d1").style.display = 'block';
		   document.getElementById("d10").style.display = 'none';
		   document.getElementById("d9").style.display = 'none';
	       document.getElementById("d8").style.display = 'none';
		   document.getElementById("d7").style.display = 'none';
	       document.getElementById("d6").style.display = 'none';
		   document.getElementById("d5").style.display = 'none';
           document.getElementById("d4").style.display = 'none';
		   document.getElementById("d3").style.display = 'none';  	   
	       document.getElementById("d2").style.display = 'none';
       }		   
	    
        	if(a == "p2")
       {	
	       document.getElementById("d9").style.display = 'none';
	       document.getElementById("d8").style.display = 'none';
		   document.getElementById("d10").style.display = 'none';
		   document.getElementById("d7").style.display = 'none';
	       document.getElementById("d6").style.display = 'none';
		   document.getElementById("d5").style.display = 'none';
           document.getElementById("d4").style.display = 'none';
		   document.getElementById("d3").style.display = 'none';  	   
	       document.getElementById("d2").style.display = 'block';
		   document.getElementById("d1").style.display = 'none';
		   document.getElementById("d0").style.display = 'none';
       }	
	  
	  if(a == "p3")
       {	
	       document.getElementById("d9").style.display = 'none';
	       document.getElementById("d8").style.display = 'none';
		   document.getElementById("d10").style.display = 'none';
		   document.getElementById("d7").style.display = 'none';
	       document.getElementById("d6").style.display = 'none';
		   document.getElementById("d5").style.display = 'none';
           document.getElementById("d4").style.display = 'none';
		   document.getElementById("d3").style.display = 'block';  	   
	       document.getElementById("d2").style.display = 'none';
		   document.getElementById("d1").style.display = 'none';
		   document.getElementById("d0").style.display = 'none';
       }	
	  
	  if(a == "p4")
       {	
	       document.getElementById("d9").style.display = 'none';
	       document.getElementById("d8").style.display = 'none';
		   document.getElementById("d10").style.display = 'none';
		   document.getElementById("d7").style.display = 'none';
	       document.getElementById("d6").style.display = 'none';
		   document.getElementById("d5").style.display = 'none';
           document.getElementById("d4").style.display = 'block';
		   document.getElementById("d3").style.display = 'none';  	   
	       document.getElementById("d2").style.display = 'none';
		   document.getElementById("d1").style.display = 'none';
		   document.getElementById("d0").style.display = 'none';
       }	

	   if(a == "p5")
       {	
	       document.getElementById("d9").style.display = 'none';
	       document.getElementById("d8").style.display = 'none';
		   document.getElementById("d10").style.display = 'none';
		   document.getElementById("d7").style.display = 'none';
	       document.getElementById("d6").style.display = 'none';
		   document.getElementById("d5").style.display = 'block';
           document.getElementById("d4").style.display = 'none';
		   document.getElementById("d3").style.display = 'none';  	   
	       document.getElementById("d2").style.display = 'none';
		   document.getElementById("d1").style.display = 'none';
		   document.getElementById("d0").style.display = 'none';
       }	
	   
	   if(a == "p6")
       {	
	       document.getElementById("d9").style.display = 'none';
	       document.getElementById("d8").style.display = 'none';
		   document.getElementById("d10").style.display = 'none';
		   document.getElementById("d7").style.display = 'none';
	       document.getElementById("d6").style.display = 'block';
		   document.getElementById("d5").style.display = 'none';
           document.getElementById("d4").style.display = 'none';
		   document.getElementById("d3").style.display = 'none';  	   
	       document.getElementById("d2").style.display = 'none';
		   document.getElementById("d1").style.display = 'none';
		   document.getElementById("d0").style.display = 'none';
       }	
	   
	   if(a == "p7")
       {	
	       document.getElementById("d9").style.display = 'none';
	       document.getElementById("d8").style.display = 'none';
		   document.getElementById("d10").style.display = 'none';
		   document.getElementById("d7").style.display = 'block';
	       document.getElementById("d6").style.display = 'none';
		   document.getElementById("d5").style.display = 'none';
           document.getElementById("d4").style.display = 'none';
		   document.getElementById("d3").style.display = 'none';  	   
	       document.getElementById("d2").style.display = 'none';
		   document.getElementById("d1").style.display = 'none';
		   document.getElementById("d0").style.display = 'none';
       }	
	   
	   if(a == "p8")
       {	
	       document.getElementById("d9").style.display = 'none';
	       document.getElementById("d8").style.display = 'block';
		   document.getElementById("d10").style.display = 'none';
		   document.getElementById("d7").style.display = 'none';
	       document.getElementById("d6").style.display = 'none';
		   document.getElementById("d5").style.display = 'none';
           document.getElementById("d4").style.display = 'none';
		   document.getElementById("d3").style.display = 'none';  	   
	       document.getElementById("d2").style.display = 'none';
		   document.getElementById("d1").style.display = 'none';
		   document.getElementById("d0").style.display = 'none';
       }	
	   
	   if(a == "p9")
       {	
	       document.getElementById("d9").style.display = 'block';
	       document.getElementById("d8").style.display = 'none';
		   document.getElementById("d10").style.display = 'none';
		   document.getElementById("d7").style.display = 'none';
	       document.getElementById("d6").style.display = 'none';
		   document.getElementById("d5").style.display = 'none';
           document.getElementById("d4").style.display = 'none';
		   document.getElementById("d3").style.display = 'none';  	   
	       document.getElementById("d2").style.display = 'none';
		   document.getElementById("d1").style.display = 'none';
		   document.getElementById("d0").style.display = 'none';
       }	
	   
	   if(a == "p10")
       {	
	       document.getElementById("d9").style.display = 'none';
	       document.getElementById("d8").style.display = 'none';
		   document.getElementById("d10").style.display = 'block';
		   document.getElementById("d7").style.display = 'none';
	       document.getElementById("d6").style.display = 'none';
		   document.getElementById("d5").style.display = 'none';
           document.getElementById("d4").style.display = 'none';
		   document.getElementById("d3").style.display = 'none';  	   
	       document.getElementById("d2").style.display = 'none';
		   document.getElementById("d1").style.display = 'none';
		   document.getElementById("d0").style.display = 'none';
       }
}

</script>
<!-- <script type="text/JavaScript">

function timedRefresh(timeoutPeriod) {
	setTimeout("location.reload(true);",timeoutPeriod);
}
 
</script> -->

<script type="text/javascript" language="javascript"
	src="../js/jquery-1.11.3.js"></script>
<script type="text/javascript" language="javascript"
	src="media/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf-8">
	var asInitVals = new Array();
	$(document).ready(function() {
		/* Initialise the DataTable */
		var oTable = $('#example').dataTable({
			"bJQueryUI" : true,
			"sPaginationType" : "full_numbers",
			"oLanguage" : {
				"sSearch" : "Search all columns:"
			}
		});

		$("tfoot input").keyup(function() {
			/* Filter on the column (the index) of this element */
			oTable.fnFilter(this.value, $("tfoot input").index(this));
		});

		/*
		 * Support functions to provide a little bit of 'user friendlyness' to the textboxes in 
		 * the footer
		 */
		$("tfoot input").each(function(i) {
			asInitVals[i] = this.value;
		});

		$("tfoot input").focus(function() {
			if (this.className == "search_init") {
				this.className = "";
				this.value = "";
			}
		});

		$("tfoot input").blur(function(i) {
			if (this.value == "") {
				this.className = "search_init";
				this.value = asInitVals[$("tfoot input").index(this)];
			}
		});
		/* Add event listeners to the two range filtering inputs */
		$('#min').keyup(function() {
			oTable.fnDraw();
		});
		$('#max').keyup(function() {
			oTable.fnDraw();
		});

	});

	/* Custom filtering function which will filter data in column four between two values */
	$.fn.dataTableExt.afnFiltering.push(function(oSettings, aData, iDataIndex) {
		var iMin = document.getElementById('min').value * 1;
		var iMax = document.getElementById('max').value * 1;

		var cgpa = aData[8] == "-" ? 0 : aData[8] * 1;

		if (iMin == "" && iMax == "") {
			return true;
		} else if (iMin == "" && cgpa <= iMax) {
			return true;
		} else if (iMin <= cgpa && "" == iMax) {
			return true;
		} else if (iMin <= cgpa && cgpa <= iMax) {
			return true;
		}
		return false;
	});
</script>
<title>Home | Manager</title>

<!-- Bootstrap core CSS -->
<jsp:include page="cssLinks.jsp" />



<!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>
<body class="nav-md" >


	<div class="container body">


		<div class="main_container">

			<div class="col-md-3 left_col">
				<div class="left_col scroll-view" >

					<div class="clearfix"></div>


					<!-- menu prile quick info -->
					<jsp:include page="sideNav.jsp" />

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
							<h3>View all Proposals</h3>
						</div>

					</div>
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_content">
									<br /> 
										<div class="form-group">
                                             <label class="control-label col-md-3 col-sm-3 col-xs-12" for="editCust">Select Proposal Status <span class="required">*</span>
                                             </label>
                                             <div class="col-md-6 col-sm-6 col-xs-12">
											 
													<select id="proposals" required="required"
														class="form-control col-md-7 col-xs-12" rows="3"
														onchange="preferedBrowser()" name="proposals"> 
														<option value="">Select Proposal Status</option> 
														<option value="p0">ALL</option>
														<option value="p1">Premium Not Generated</option>
														<option value="p2">Deviation Not Generated</option>
														<option value="p3">Premium Generated Waiting For Approval</option>
														<!--option value="p4">Premium generated approved by manager</option-->
														<option value="p5">Premium Generated Rejected By Manager</option>
														<option value="p6">Premium Generated Approved By Manager Quote Not Generated</option>
														<!--option value="p7">Premium generated approved by manager quote generated</option-->
														<option value="p8">Quote Generated Waiting For Approval By Customer</option>
														<option value="p9">Quote Generated Approved By Customer</option>
														<option value="p10">Quote Generated Rejected By Customer</option> 
													</select>
													 
									         </div>	
                                           </div>
										<div class="form-group"> 
											<div id="container">
												<div hidden id="d0" > 
												  <div class="demo_jui">
													<table border="0" cellspacing="5" cellpadding="5">
														<tr>
															<td></td>
															<td><input type="hidden" id="min" name="min"></td>
														</tr>
														<tr>
															<td></td>
															<td><input type="hidden" id="max" name="max"></td>
														</tr> 
													</table>
													<table cellpadding="0" cellspacing="0" border="0"
														class="display" id="example">
														<thead>
															<tr>
																<th>Proposal ID</th>
																<th>Status</th> 
                                                                <th>Premium Amount</th>  
															</tr>
														</thead>
														
														<tbody>
												         <%
													      try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_Proposals");
															rs = ps.executeQuery();
													     %>
													     <%
														    while (rs.next()) {
													     %>
															<tr class="gradeC">
																<td class="center"><%=rs.getString(1)%></td>
																<td class="center"><%=rs.getString(2)%></td>
                                                                <td class="center"><%=rs.getInt(3)%></td> 																
															</tr>
													     <%
			                                               }
														   }
														    catch (Exception e) {
														        e.getStackTrace();	
														   } 
			                                            %>
					
												

														</tbody>
														<tfoot>
															<tr>
																<th><input type="text" name="search_eno."
																	placeholder="Search Proposal ID" class="search_init" /></th>
																<th><input type="text" name="search_students"
																	placeholder="Search Status" class="search_init" /></th>
																<th><input type="text" name="search_CS601"
																	placeholder="Search Premium Amount" class="search_init" /></th>


															</tr>
														</tfoot>
													</table>
												</div>
												<div class="spacer"></div>
 
												<style type="text/css">
												@import "media/support/syntax/css/shCore.css";
												</style>
												<script type="text/javascript" language="javascript"
													src="media/support/syntax/js/shCore.js"></script>
											   </div>
											</div>	
                                           </div>
									 <form id="demo-form2" class="form-horizontal form-label-left" data-parsley-validate action="../controller_UnderWriter">
										<div id="d1" hidden>
										  <div class="form-group"> 
											<div id="container">  
											 
							
													<table class="table " id="example">
														<thead>
															<tr>
																<th>Proposal ID</th>
																<th>Status</th> 
                                                                <th>Premium Amount</th>
                                                                <th>Select</th>  
															</tr>
														</thead>
														
														<tbody>
												         <%
													      try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_Proposals where STATUS = 'Premium Not Generated'");
															rs = ps.executeQuery();
													     %>
													     <%
														    while (rs.next()) {
													     %>
															<tr class="gradeC">
																<td class="center"><%=rs.getString(1)%></td>
																<td class="center"><%=rs.getString(2)%></td>
                                                                <td class="center"><%=rs.getInt(3)%></td>
																<td><input type="checkbox" class="flat" name="proposals" value="<%=rs.getString(1)%>"></td>
															</tr>
													     <%
			                                               }
														   }
														    catch (Exception e) {
														        e.getStackTrace();	
														   } 
			                                            %>
					
												

														</tbody>
														
													</table>
												
												<div class="spacer"></div> 
												
										    <div class="ln_solid"></div>
                                            <div class="form-group">
                                               <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="reset" class="btn btn-primary">Cancel</button>
                                                <button type="submit" class="btn btn-success">Submit</button>
                                            </div>
                                           </div>
										    </div>
									       </div>	 
										  </div>
										  <input type="hidden" name="action" value="rfq_Proposals1">
										</form>
										<form id="demo-form2" class="form-horizontal form-label-left" data-parsley-validate action="setDeviation.jsp" >
										
										<div id="d2" hidden>
										  <div class="form-group"> 
											<div id="container">  
											  
													
													<table class="table " id="example">
														<thead>
															<tr>
																<th>Proposal ID</th>
																<th>Status</th> 
                                                                <th>Premium Amount</th>
                                                                <th>Select</th>  
															</tr>
														</thead>
														
														<tbody>
												         <%
													      try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_Proposals where STATUS = 'Deviation Not Generated'");
															rs = ps.executeQuery();
													     %>
													     <%
														    while (rs.next()) {
													     %>
															<tr class="gradeC">
																<td class="center"><%=rs.getString(1)%></td>
																<td class="center"><%=rs.getString(2)%></td>
                                                                <td class="center"><%=rs.getInt(3)%></td>
                                                                <td><button type="submit" name="deviation" class="btn btn-success" value="<%=rs.getString(1)%>">Action</button></td>
                                                                <%-- <td><input class="flat" type="radio" name="deviation" id="deviation" value="<%=rs.getString(1)%>"></td>			 --%>													
															</tr> 
													     <%
			                                               }
														   }
														    catch (Exception e) {
														        e.getStackTrace();	
														   } 
			                                            %> 
					
												

														</tbody>
													
													</table>
												
												<div class="spacer"></div> 
											
										   <!--  <div class="ln_solid"></div>
                                            <div class="form-group">
                                               <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="reset" class="btn btn-primary">Cancel</button>
                                                <button type="submit" class="btn btn-success">Submit</button>
                                            </div>
                                           </div> -->
										    </div>
									       </div>	 
										  </div>
										   <input type="hidden" name="action" value="rfq_Proposals2">
										</form> 
										<div class="form-group">
								
											<div id="container">
											   
											   <div id="d3" hidden>
											   
													<table class="table " id="example">
														<thead>
															<tr>
																<th>Proposal ID</th>
																<th>Status</th> 
                                                                <th>Premium Amount</th>
                                                             
															</tr>
														</thead>
														
														<tbody>
												         <%
													      try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_Proposals where STATUS = 'Premium Generated Waiting For Approval'");
															rs = ps.executeQuery();
													     %>
													     <%
														    while (rs.next()) {
													     %>
															<tr class="gradeC">
																<td class="center"><%=rs.getString(1)%></td>
																<td class="center"><%=rs.getString(2)%></td>  
																<td class="center"><%=rs.getInt(3)%></td>
															</tr>
													     <%
			                                               }
														   }
														    catch (Exception e) {
														        e.getStackTrace();	
														   } 
			                                            %>
					
												

														</tbody>
														
													</table>
												
												<div class="spacer"></div>



												<style type="text/css">
												@import "media/support/syntax/css/shCore.css";
												</style>
												<script type="text/javascript" language="javascript"
													src="media/support/syntax/js/shCore.js"></script>
											   </div>
											   </div>	
                                           </div>
										<div class="form-group">
								
											<div id="container">
											   <div id="d4" hidden>
											   
													<table class="table " id="example">
														<thead>
															<tr>
																<th>Proposal ID</th>
																<th>Status</th> 
                                                                <th>Premium Amount</th>
                                                                <th>Select</th>  
															</tr>
														</thead>
														
														<tbody>
												         <%
													      try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_Proposals where STATUS = 'Premium generated approved by manager'");
															rs = ps.executeQuery();
													     %>
													     <%
														    while (rs.next()) {
													     %>
															<tr class="gradeC">
																<td class="center"><%=rs.getString(1)%></td>
																<td class="center"><%=rs.getString(2)%></td>
                                                                <td class="center"><%=rs.getInt(3)%></td>																
															</tr>
													     <%
			                                               }
														   }
														    catch (Exception e) {
														        e.getStackTrace();	
														   } 
			                                            %>
					
												

														</tbody>
														
													</table>
											
												<div class="spacer"></div>



												
											   </div>
											   </div>	
                                           </div>
										<div class="form-group">
								
											<div id="container">
											   <div id="d5" hidden>
											   
													<table class="table " id="example">
														<thead>
															<tr>
																<th>Proposal ID</th>
																<th>Status</th> 
                                                                <th>Premium Amount</th>  
															</tr>
														</thead>
														
														<tbody>
												         <%
													      try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_Proposals where STATUS = 'Premium Generated Rejected By Manager'");
															rs = ps.executeQuery();
													     %>
													     <%
														    while (rs.next()) {
													     %>
															<tr class="gradeC">
																<td class="center"><%=rs.getString(1)%></td>
																<td class="center"><%=rs.getString(2)%></td> 
                                                                <td class="center"><%=rs.getInt(3)%></td>																
															</tr>
													     <%
			                                               }
														   }
														    catch (Exception e) {
														        e.getStackTrace();	
														   } 
			                                            %>
					
												

														</tbody>
														
													</table>
											
												<div class="spacer"></div>



												
											   </div>
											   </div>	
                                           </div>
										<form id="demo-form2" class="form-horizontal form-label-left" data-parsley-validate action="../controller_UnderWriter">
											<div id="d6" hidden>
											 <div class="form-group"> 
											  <div id="container">
											   <div class="demo_jui">
													<table border="0" cellspacing="5" cellpadding="5">
														<tr>
															<td></td>
															<td><input type="hidden" id="min" name="min"></td>
														</tr>
														<tr>
															<td></td>
															<td><input type="hidden" id="max" name="max"></td>
														</tr>

													</table>
													<table class="table" id="example">
														<thead>
															<tr>
																<th>Proposal ID</th>
																<th>Status</th> 
                                                                <th>Premium Amount</th>
                                                                <th>Select</th>  
															</tr>
														</thead>
														
														<tbody>
												         <%
													      try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_Proposals where STATUS = 'Premium Generated Approved By Manager Quote Not Generated'");
															rs = ps.executeQuery();
													     %>
													     <%
														    while (rs.next()) {
													     %>
															<tr class="gradeC">
																<td class="center"><%=rs.getString(1)%></td>
																<td class="center"><%=rs.getString(2)%></td>
                                                                <td class="center"><%=rs.getInt(3)%></td>
                                                                <td><input type="checkbox" class="flat" name="proposals" value="<%=rs.getString(1)%>"></td>																
															</tr>
													     <%
			                                               }
														   }
														    catch (Exception e) {
														        e.getStackTrace();	
														   } 
			                                            %>
					
												

														</tbody>
														
													</table>
												</div>
												<div class="spacer"></div>
 
												<script type="text/javascript" language="javascript"
													src="media/support/syntax/js/shCore.js"></script>
													<div class="ln_solid"></div>
                                                 <div class="form-group">
                                               <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="reset" class="btn btn-primary">Cancel</button>
                                                <button type="submit" class="btn btn-success">Submit</button>
                                            </div>
                                           </div>
											   </div>
											  </div>	
                                           </div>
										    <input type="hidden" name="action" value="rfq_Proposal6">
										</form>

										<div class="form-group">
								
											<div id="container">
											   <div id="d7" hidden>
											  
													<table class="table" id="example">
														<thead>
															<tr>
																<th>Proposal ID</th>
																<th>Status</th> 
                                                                <th>Premium Amount</th>
                                                                <th>Select</th>  
															</tr>
														</thead>
														
														<tbody>
												         <%
													      try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_Proposals where STATUS = 'Premium generated approved by manager quote generated'");
															rs = ps.executeQuery();
													     %>
													     <%
														    while (rs.next()) {
													     %>
															<tr class="gradeC">
																<td class="center"><%=rs.getString(1)%></td>
																<td class="center"><%=rs.getString(2)%></td>
                                                                <td class="center"><%=rs.getInt(3)%></td>																
															</tr>
													     <%
			                                               }
														   }
														    catch (Exception e) {
														        e.getStackTrace();	
														   } 
			                                            %>
					
												

														</tbody>
														
													</table>
											
												<div class="spacer"></div>



												
											   </div>
											   </div>	
                                           </div>
										<form id="demo-form3" class="form-horizontal form-label-left" data-parsley-validate action="pdfgenerate.jsp">
									   <div id="d8" hidden>
										<div class="form-group">  
											<div id="container">  
													<table cellpadding="0" cellspacing="0" border="0"
														class="display" id="example">
														<thead>
															<tr>
																<th>Proposal ID</th>
																<th>Status</th> 
                                                                <th>Premium Amount</th> 
																<th>Select</th>
															</tr>
														</thead>
														
														<tbody>
												         <%
													      try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_Proposals where STATUS = 'Quote Generated Waiting For Approval By Customer'");
															rs = ps.executeQuery();
													     %>
													     <%
														    while (rs.next()) {
													     %>
															<tr >
																<td class="center"><%=rs.getString(1)%></td>
																<td class="center"><%=rs.getString(2)%></td>
                                                                <td class="center"><%=rs.getInt(3)%></td>
																<td><button type="submit" class="btn btn-success" name="proposals" value="<%=rs.getString(1)%>">Generate PDF</button></td>
                                                       														
															</tr>
													     <%
			                                               }
														   }
														    catch (Exception e) {
														        e.getStackTrace();	
														   } 
			                                            %> 
														</tbody> 
													</table>
												</div>
											  </div>	
										
                                          </div>
										 
										</form>

										<div class="form-group">
								
											<div id="container">
											   <div id="d9" hidden>
											   
													<table class="table " id="example">
														<thead>
															<tr>
																<th>Proposal ID</th>
																<th>Status</th> 
                                                                <th>Premium Amount</th>
															</tr>
														</thead>
														
														<tbody>
												         <%
													      try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_Proposals where STATUS = 'Quote Generated Approved By Customer'");
															rs = ps.executeQuery();
													     %>
													     <%
														    while (rs.next()) {
													     %>
															<tr class="gradeC">
																<td class="center"><%=rs.getString(1)%></td>
																<td class="center"><%=rs.getString(2)%></td>
                                                                <td class="center"><%=rs.getInt(3)%></td>																
															</tr>
													     <%
			                                               }
														   }
														    catch (Exception e) {
														        e.getStackTrace();	
														   } 
			                                            %>
					
												

														</tbody>
														
													</table>
											
												<div class="spacer"></div>



												
											   </div>
											   </div>	
                                           </div>
										<div class="form-group">
								
											<div id="container">
											   <div id="d10" hidden>
											  
													<table class="table " id="example">
														<thead>
															<tr>
																<th>Proposal ID</th>
																<th>Status</th> 
                                                                <th>Premium Amount</th>															
															</tr>
														</thead>
														
														<tbody>
												         <%
													      try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_Proposals where STATUS = 'Quote Generated Rejected By Customer'");
															rs = ps.executeQuery();
													     %>
													     <%
														    while (rs.next()) {
													     %>
															<tr class="gradeC">
																<td class="center"><%=rs.getString(1)%></td>
																<td class="center"><%=rs.getString(2)%></td>
                                                                <td class="center"><%=rs.getInt(3)%></td>																
															</tr>
													     <%
			                                               }
														   }
														    catch (Exception e) {
														        e.getStackTrace();	
														   } 
			                                            %>
					
												

														</tbody>
													
													</table>
											
												<div class="spacer"></div>



												
											   </div> 

											</div>


										</div> 
								</div>
							</div>
						</div>
					</div>


				</div>


			</div>
			<!-- /page content -->

			<!-- footer content -->
			 <jsp:include page="footer.jsp"/>
			<!-- /footer content -->

		</div>

	</div>


	<div id="custom_notifications" class="custom-notifications dsp_none">
		<ul class="list-unstyled notifications clearfix"
			data-tabbed_notifications="notif-group">
		</ul>
		<div class="clearfix"></div>
		<div id="notif-group" class="tabbed_notifications"></div>
	</div>

	<script src="../js/bootstrap.min.js"></script>

	<!-- chart js -->
	<!-- bootstrap progress js -->
	<script src="../js/nicescroll/jquery.nicescroll.min.js"></script>
	<!-- icheck -->
	<script src="../js/icheck/icheck.min.js"></script>
	<!-- tags -->
	<script src="../js/tags/jquery.tagsinput.min.js"></script>
	<!-- switchery -->
	<script src="../js/switchery/switchery.min.js"></script>
	<!-- daterangepicker -->
	<script type="text/javascript" src="../js/moment.min2.js"></script>
	<script type="text/javascript"
		src="../js/datepicker/daterangepicker.js"></script>
	<!-- richtext editor -->
	<script src="../js/editor/bootstrap-wysiwyg.js"></script>
	<script src="../js/editor/external/jquery.hotkeys.js"></script>
	<script src="../js/editor/external/google-code-prettify/prettify.js"></script>
	<!-- select2 -->
	<script src="../js/select/select2.full.js"></script>
	<!-- form validation -->
	<script type="text/javascript" src="../js/parsley/parsley.min.js"></script>
	<!-- textarea resize -->
	<script src="../js/textarea/autosize.min.js"></script>
	<script>
		autosize($('.resizable_textarea'));
	</script>
	<!-- Autocomplete -->
	<script type="text/javascript" src="../js/autocomplete/countries.js"></script>
	<script src="../js/autocomplete/jquery.autocomplete.js"></script>
	<script type="text/javascript">
		$(function() {
			'use strict';
			var countriesArray = $.map(countries, function(value, key) {
				return {
					value : value,
					data : key
				};
			});
			// Initialize autocomplete with custom appendTo:
			$('#autocomplete-custom-append').autocomplete({
				lookup : countriesArray,
				appendTo : '#autocomplete-container'
			});
		});
	</script>
	<script src="../js/custom.js"></script>


	<!-- select2 -->
	<script>
		$(document).ready(function() {
			$(".select2_single").select2({
				placeholder : "Select a status",
				allowClear : true
			});
			$(".select2_group").select2({});
			$(".select2_multiple").select2({
				maximumSelectionLength : 4,
				placeholder : "With Max Selection limit 4",
				allowClear : true
			});
		});
	</script>
	<!-- /select2 -->
	<!-- input tags -->
	<script>
		function onAddTag(tag) {
			alert("Added a tag: " + tag);
		}

		function onRemoveTag(tag) {
			alert("Removed a tag: " + tag);
		}

		function onChangeTag(input, tag) {
			alert("Changed a tag: " + tag);
		}

		$(function() {
			$('#tags_1').tagsInput({
				width : 'auto'
			});
		});
	</script>
	<!-- /input tags -->
	<!-- form validation -->
	<script type="text/javascript">
		$(document).ready(function() {
			$.listen('parsley:field:validate', function() {
				validateFront();
			});
			$('#demo-form .btn').on('click', function() {
				$('#demo-form').parsley().validate();
				validateFront();
			});
			var validateFront = function() {
				if (true === $('#demo-form').parsley().isValid()) {
					$('.bs-callout-info').removeClass('hidden');
					$('.bs-callout-warning').addClass('hidden');
				} else {
					$('.bs-callout-info').addClass('hidden');
					$('.bs-callout-warning').removeClass('hidden');
				}
			};
		});

		$(document).ready(function() {
			$.listen('parsley:field:validate', function() {
				validateFront();
			});
			$('#demo-form2 .btn').on('click', function() {
				$('#demo-form2').parsley().validate();
				validateFront();
			});
			var validateFront = function() {
				if (true === $('#demo-form2').parsley().isValid()) {
					$('.bs-callout-info').removeClass('hidden');
					$('.bs-callout-warning').addClass('hidden');
				} else {
					$('.bs-callout-info').addClass('hidden');
					$('.bs-callout-warning').removeClass('hidden');
				}
			};
		});
		try {
			hljs.initHighlightingOnLoad();
		} catch (err) {
		}
	</script>
	<!-- /form validation -->
	<!-- editor -->
	<script>
		$(document).ready(function() {
			$('.xcxc').click(function() {
				$('#descr').val($('#editor').html());
			});
		});

		$(function() {
			function initToolbarBootstrapBindings() {
				var fonts = [ 'Serif', 'Sans', 'Arial', 'Arial Black',
						'Courier', 'Courier New', 'Comic Sans MS', 'Helvetica',
						'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma',
						'Times', 'Times New Roman', 'Verdana' ], fontTarget = $(
						'[title=Font]').siblings('.dropdown-menu');
				$
						.each(
								fonts,
								function(idx, fontName) {
									fontTarget
											.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">'
													+ fontName + '</a></li>'));
								});
				$('a[title]').tooltip({
					container : 'body'
				});
				$('.dropdown-menu input').click(function() {
					return false;
				}).change(
						function() {
							$(this).parent('.dropdown-menu').siblings(
									'.dropdown-toggle').dropdown('toggle');
						}).keydown('esc', function() {
					this.value = '';
					$(this).change();
				});

				$('[data-role=magic-overlay]').each(
						function() {
							var overlay = $(this), target = $(overlay
									.data('target'));
							overlay.css('opacity', 0).css('position',
									'absolute').offset(target.offset()).width(
									target.outerWidth()).height(
									target.outerHeight());
						});
				if ("onwebkitspeechchange" in document.createElement("input")) {
					var editorOffset = $('#editor').offset();
					$('#voiceBtn').css('position', 'absolute').offset(
							{
								top : editorOffset.top,
								left : editorOffset.left
										+ $('#editor').innerWidth() - 35
							});
				} else {
					$('#voiceBtn').hide();
				}
			}
			;

			function showErrorAlert(reason, detail) {
				var msg = '';
				if (reason === 'unsupported-file-type') {
					msg = "Unsupported format " + detail;
				} else {
					console.log("error uploading file", reason, detail);
				}
				$(
						'<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'
								+ '<strong>File upload error</strong> '
								+ msg
								+ ' </div>').prependTo('#alerts');
			}
			;
			initToolbarBootstrapBindings();
			$('#editor').wysiwyg({
				fileUploadError : showErrorAlert
			});
			window.prettyPrint && prettyPrint();
		});
	</script>
	<!-- /editor -->
</body>
</html>