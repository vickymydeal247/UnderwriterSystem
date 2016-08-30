<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


	<head>
	
	
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
	
	
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		
		
		<title>DataTables example</title>
		<style type="text/css" title="currentStyle">
			@import "media/css/demo_page.css";
			@import "media/css/demo_table_jui.css";
			@import "media/support/themes/smoothness/jquery-ui-1.8.4.custom.css";
		</style>
		<script type="text/javascript" language="javascript" src="media/js/jquery.js"></script>
		<script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
	
		<script type="text/javascript" charset="utf-8">
		 var asInitVals = new Array();
		 $(document).ready(function() {
				/* Initialise the DataTable */
				var oTable = $('#example').dataTable( {
				  "bJQueryUI": true,
					"sPaginationType": "full_numbers",
					"oLanguage": {
						"sSearch": "Search all columns:"
					}
				} );
				
					$("tfoot input").keyup( function () {
					/* Filter on the column (the index) of this element */
					oTable.fnFilter( this.value, $("tfoot input").index(this) );
				} );
				
				
				
				/*
				 * Support functions to provide a little bit of 'user friendlyness' to the textboxes in 
				 * the footer
				 */
				$("tfoot input").each( function (i) {
					asInitVals[i] = this.value;
				} );
				
				$("tfoot input").focus( function () {
					if ( this.className == "search_init" )
					{
						this.className = "";
						this.value = "";
					}
				} );
				
				$("tfoot input").blur( function (i) {
					if ( this.value == "" )
					{
						this.className = "search_init";
						this.value = asInitVals[$("tfoot input").index(this)];
					}
				} );
				/* Add event listeners to the two range filtering inputs */
				$('#min').keyup( function() { oTable.fnDraw(); } );
				$('#max').keyup( function() { oTable.fnDraw(); } );
				
			
			} );
			
		  /* Custom filtering function which will filter data in column four between two values */
			$.fn.dataTableExt.afnFiltering.push(
				function( oSettings, aData, iDataIndex ) {
					var iMin = document.getElementById('min').value * 1;
					var iMax = document.getElementById('max').value * 1;
					
					var cgpa = aData[8] == "-" ? 0 : aData[8]*1;
					
					if ( iMin == "" && iMax == "" )
					{ 
						return true;
					}
					else if ( iMin == "" && cgpa <= iMax )
					{
						return true;
					}
					else if ( iMin <= cgpa && "" == iMax )
					{
						return true;
					}
					else if ( iMin <= cgpa && cgpa <= iMax )
					{
						return true;
					}
					return false;
				}
			);
		
		</script>
	</head>
	<body id="dt_example">
	<%if(session.getId()!=session.getAttribute("session")){

	response.sendRedirect("login.jsp");
	
} %>
		<div id="container">
			<h2>Status Report</h2>
			<div class="demo_jui">
			<!-- table border="0" cellspacing="5" cellpadding="5">
				<tr>
					<td>Minimum CGPA:</td>
					<td><input type="text" id="min" name="min"></td>
				</tr>
				<tr>
					<td>Maximum CGPA:</td>
					<td><input type="text" id="max" name="max"></td>
				</tr>
				
			</table-->
			
			
			
			<%
														try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_Proposals");
															rs = ps.executeQuery();
													%>
													
												
														
														
														
<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
	<thead>
		<tr>
			<th>Select</th>
			<th>Proposal_ID</th>
			<th>Status</th>
			<th>Premium Amount</th>
			<th>Comment</th>
			<th>Action</th>
			
			
		</tr>
	</thead>
	<%
		while (rs.next()) {
	%>
	<form  action="../ControllerServlet" method="post">
	<tbody>
	
	

		<tr>
		
		<!--  class="gradeC"-->
		<% HttpSession ses=request.getSession(); %>
		<td><label class="checkbox-inline">							
				<input type="checkbox"  name ="type" value="<%=rs.getString(1)%>" class="flat">
			</label>
								    </td>
								    
		<%String pid=rs.getString(1); 
		System.out.println(pid);%>
		<td class="center"><%=rs.getString(1)%></td>
		<td class="center"><%=rs.getString(2)%></td>
		<td class="center"><%=rs.getString(3)%></td>
		<td class="center"><%=rs.getString(4)%></td>
			
		<td><button type="submit" class="btn btn-success">Submit</button></td>
		
		
		
		
		<% ses.setAttribute("pidval", pid); %>
		
		
		</tr>
		
	<tbody>
			<input type="hidden" name="action" value="practice">					
	</form>		
			
	
	
	<%
			}
	
														} catch (Exception e) {
															
														}
			/*  finally
			{
				HttpSession ses=request.getSession();
				ses.setAttribute("pidval", pid);
			}
			 */ 									
			 %>
													
													

													
			
	<!--tbody>
		<tr class="gradeC">
		<td>0808CS101048</td>
		<td>Rahul Bhooteshwar</td>
		<td class="center">A</td>
		<td class="center">B+</td>
		<td class="center">B</td>
		<td class="center">B+</td>
		<td class="center">A+</td>
		<td class="center">8.50</td>
		<td class="center">8.36</td>
		</tr>
		<tr class="gradeC">
		<td>0808CS101048</td>
		<td>Rahul Bhooteshwar</td>
		<td class="center">A</td>
		<td class="center">B+</td>
		<td class="center">B</td>
		<td class="center">B+</td>
		<td class="center">A+</td>
		<td class="center">7.36</td>
		<td class="center">7.00</td>
		</tr>
	</tbody-->
	<tfoot>
		<tr>
			<th><input type="text" name="gradeC" placeholder="Search Enrollment" class="search_init" /></th>
			<th><input type="text" name="gradeC" placeholder="Search Students" class="search_init" /></th>
			<th><input type="text" name="search_CS601" placeholder="Search CS601 grades" class="search_init" /></th>
			<th><input type="text" name="search_CS602" placeholder="Search CS602 grades" class="search_init" /></th>
			<th><input type="text" name="search_CS603" placeholder="Search CS603 grades" class="search_init" /></th>
			<th><input type="text" name="search_CS604" placeholder="Search CS604 grades" class="search_init" /></th>
			
			
		</tr>
	</tfoot>
</table>
			</div>
			<div class="spacer"></div>
			
			
	
			<style type="text/css">
				@import "media/support/syntax/css/shCore.css";
			</style>
			<script type="text/javascript" language="javascript" src="media/support/syntax/js/shCore.js"></script>
			
		
			
			
			
			
		</div>
	</body>
</html>