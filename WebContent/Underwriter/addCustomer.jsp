<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Add Customer </title>

    <!-- Bootstrap core CSS -->
		<jsp:include page="cssLinks.jsp"/>

   

    <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

<script>
function preferedBrowser() {
       var a = new String(document.getElementById("insuranceType").value);
       var c = null;
       //document.write("hi");
	    if(a == "Individual")
        {	 
		      document.getElementById("d1").style.display = 'block';
		      document.getElementById("d2").style.display = 'block';
			  
        }	
	  
	    if(a == "Group")
        {	
	         document.getElementById("d2").style.display = 'none';
		     document.getElementById("d1").style.display = 'block';
			 document.getElementById("gender").value = c;
        }	

	   if(a == "Family")
       {	 
		    document.getElementById("d1").style.display = 'none';
			document.getElementById("d2").style.display = 'none';
			document.getElementById("gender").value = c;
			document.getElementById("occupation").value = c;
       }	    
     }
</script>
<script type="text/javascript">
 function abc() {
	 <%if(session.getAttribute("onload")!=null){%>
	  var modal = document.getElementById('myModal');
      $("#myModal").modal('show')
	 <%}%>
	  
	}

</script>
</head>
<body class="nav-md" onload ="abc()">
 <%if(session.getId()!=session.getAttribute("session")){

	 response.sendRedirect("../Admin/login.jsp");
	
} %> 

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
                            <h3>Add Customer</h3>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                               <div class="x_content">
                                    <br />
                                    <form id="demo-form2" class="form-horizontal form-label-left" data-parsley-validate action="../controller_UnderWriter">

                                        <div class="form-group">
										
                                         <label class="control-label col-md-3 col-sm-3 col-xs-12" for="lbl-first-name">Insurance Type <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                               <select id="insuranceType"  name ="insuranceType" required="required" class="form-control col-md-7 col-xs-12" rows="3" onchange="preferedBrowser()">
											            <option value="">Select Insurance Type</option>
														<option value="Individual">Individual</option> 	<!-- call d1  d2-->
														<option value="Group">Group</option>			<!-- call d2 -->
														<option value="Family">Family</option>		<!-- --> 
													</select>
                                            </div>
                                        
										 </div>
										 
										 
										 <!-- individual -->
										   
										 <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Customer Name <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="username" type="text" id="first-name" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div id="d1" hidden>
                                         <div  class="form-group" >
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Occupation <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                             <div class="radio radio-primary">
											  <label>
											    <input class="flat" type="radio" name="optionsRadios" id="optionsRadios1" value="Mining and Nuclear field">
											    Mining and Nuclear field
											  </label>
											 </div>
											<div class="radio radio-primary">
											  <label>
											    <input  class="flat" type="radio" name="optionsRadios" id="optionsRadios2" value="others">
											    Others
											  </label>
											</div>
                                           
                                            </div>
                                        </div>
                                       </div>
                                         <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Age<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="age" type="number" id="first-name" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                       <div id ="d2"  hidden> 
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Gender</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <div id="status"  name="status"  class="btn-group" data-toggle="buttons">
                                                    <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                        <input type="radio" name="gender" value="male"> Male &nbsp;
                                                    </label>
                                                    <label class="btn btn-primary active" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                        <input type="radio" name="gender" value="female" > Female
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
	                                   </div>
										
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="lbl-address">Address <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <textarea id="address" required="required" class="form-control col-md-7 col-xs-12" name="address">
                                                </textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="lbl-city">City <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="city" name="city" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="lbl-state" class="control-label col-md-3 col-sm-3 col-xs-12">State <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                               <!-- <input id="state" class="form-control col-md-7 col-xs-12" type="text" name="state" required>
										 Script by hscripts.com -->
		<select name="state" class="select2_single form-control" >
<script language="javascript">
var states = new Array("Andaman and Nicobar Islands", "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chandigarh", "Chhattisgarh", "Dadra and Nagar Haveli",
 "Daman and Diu", "Delhi", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Lakshadweep", "Madhya Pradesh",
 "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Orissa", "Pondicherry", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Tripura", "Uttaranchal", "Uttar Pradesh", "West Bengal");
for(var hi=0; hi<states.length; hi++)
document.write("<option value=\""+states[hi]+"\">"+states[hi]+"</option>");
</script>


</select>
<!-- Script by hscripts.com -->
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="lbl-zip">Zip Code <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="number" id="zip" maxlength="10" name="zip" required="required" data-parsley-length="[6, 6]" data-parsley-length-message="ZipCode must be 6 characters long" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="lbl-mobile-number">Mobile Number <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="number" id="mobile-number" name="mobnumber" required="required"  data-parsley-length-message="Please enter a 10 digit mobile number" data-parsley-length="[10,10]" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        
                                     
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="reset" class="btn btn-primary">Cancel</button>
                                                <button type="submit" class="btn btn-success">Submit</button>
                                            </div>
                                        </div>
                                         
										<input type="hidden" name="action" value="add_Customer">
	<!-- Modal -->
		          
		          <div  aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal"  name="myModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">Success!</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p><%=session.getAttribute("onload")%> 
		                           <% session.setAttribute("onload", null);%>
		                          </p>
		                         
		
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
                        </div>
                    </div>
                    </div>
					
                </div>
                <!-- /page content -->

                <!-- footer content -->
              
                <!-- /footer content -->
	<jsp:include page="footer.jsp"/>
            </div>

        </div>
 

        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>
		
			 <jsp:include page="jsLinks.jsp"/>
			
        <script>
            autosize($('.resizable_textarea'));
        </script>
       
        <script type="text/javascript">
            $(function () {
                'use strict';
                var countriesArray = $.map(countries, function (value, key) {
                    return {
                        value: value,
                        data: key
                    };
                });
                // Initialize autocomplete with custom appendTo:
                $('#autocomplete-custom-append').autocomplete({
                    lookup: countriesArray,
                    appendTo: '#autocomplete-container'
                });
            });
        </script>
      


        <!-- select2 -->
        <script>
            $(document).ready(function () {
                $(".select2_single").select2({
                    placeholder: "Select a state",
                    allowClear: true
                });
                $(".select2_group").select2({});
                $(".select2_multiple").select2({
                    maximumSelectionLength: 4,
                    placeholder: "With Max Selection limit 4",
                    allowClear: true
                });
            });
        </script>
        <!-- /select2 -->
        <!-- input tags -->
 
        <!-- /input tags -->
        <!-- form validation -->
       
        <!-- /form validation -->
        <!-- editor -->
  
        <!-- /editor -->
</body>
</html>