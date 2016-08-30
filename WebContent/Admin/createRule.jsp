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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Create Rule </title>

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
	    document.getElementById("d1").style.display = 'block';  
}
</script>
<script type="text/javascript">
 function abc() {
	 <%if(session.getAttribute("onload")!=null){%>
	  var modal = document.getElementById('mModal');
      $("#mModal").modal('show')
	 <%}%>
	  
	}

</script>
</head>
<body class="nav-md" onload ="abc()">
<%if(session.getId()!=session.getAttribute("session")){

	response.sendRedirect("login.jsp");
	
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
                            <h3>Create Rule</h3>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_content">
                              		<form id="formCreateRule" data-parsley-validate class="form-horizontal form-label-left" action="../ControllerServlet">
									<%
														try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select * from TBL_TYPES where STATUS = 'active'");
															rs = ps.executeQuery();
													%>
													<select id="insuranceType"  name ="id" required="required" class="form-control col-md-7 col-xs-12" rows="3" onchange="preferedBrowser()">
											          <<option value="">Select Insurance Type</option>
														<%
															while (rs.next()) {
														%>
														<option value="<%=rs.getString(1)%>!<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
														<%
															}
														%>

													</select>
													<%
														} catch (Exception e) {
															out.println("wrong entry" + e);
														}
													%>
									  
                                                         
									
									</div>	
									
									
										
										 <div id ="d1" hidden>        
											<table  class="table" border="2">
											
											<thead>
											<tr>
											<th colspan="6"  class="table-primary"><h4>Age Component</h4></th>
											</tr>
												<tr>
													<th>>80 years</th>
													<td colspan="2"><div class="form-group">
															<div class="col-md-6 col-sm-6 col-xs-12">
															<input type="number" id="ageComp" name="ag80"  class="form-control col-md-7 col-xs-12">
															</div>
														</div></td>
													<th>Between 60 and 80 years</th>
													<td colspan="2"><div class="form-group">
													     <div class="col-md-6 col-sm-6 col-xs-12">
														<input type="number" id="ageComp" name="ag60l80"  class="form-control col-md-7 col-xs-12">
														</div>
													
													</td>
												</tr>
												</thead>
												<thead>
													<tr>
														<th> <40 years</th>
														<td colspan="2"><div class="form-group">
													     <div class="col-md-6 col-sm-6 col-xs-12">
														<input type="number" id="ageComp" name="al40"  class="form-control col-md-7 col-xs-12">
														</div>
													</div></td>
														<th>Between 40 and 60 years</th>
													</div>
														<td colspan="2"><div class="form-group">
													     <div class="col-md-6 col-sm-6 col-xs-12">
														<input type="number" id="ageComp" name="ag40l60"  class="form-control col-md-7 col-xs-12">
														</div>
													</div></td>
														
													</tr>
												</thead>
											
											
											

											<div>
											
											
												<thead>
											<tr>
												<th colspan="6" font color="brown" ><h4>Gender Component</h4></th>
											</tr>
											<tr>
												
													<th>Male</th>
													<td colspan="2"><div class="form-group">
													     <div class="col-md-6 col-sm-6 col-xs-12">
														<input type="number" id="gender" name="male"  class="form-control col-md-7 col-xs-12">
														</div>
													</div></td>
												
											    	
													<th>Female</th>
													<td colspan="2"><div class="form-group">
													     <div class="col-md-6 col-sm-6 col-xs-12">
														<input type="number" id="gender" name="female"  class="form-control col-md-7 col-xs-12">
														</div>
													</div></td>
													</div>
													<tr>
													</tr>
											
												
											</thead>
											<div>
											
											<thead>
								
											<tr>
												<th colspan="6" ><h4>Occupation</h4></th>
												</tr>
												<tr>
													<th>>Mining & Nuclear</th>
													<td colspan="2"><div class="form-group">
															<div class="col-md-6 col-sm-6 col-xs-12">
															<input type="number" id="occupation" name="minAndNuclear"  class="form-control col-md-7 col-xs-12">
															</div>
														</div></td>
													<th>Others</th>
													<td colspan="2"><div class="form-group">
													     <div class="col-md-6 col-sm-6 col-xs-12">
														<input type="number" id="occupation" name="others"  class="form-control col-md-7 col-xs-12">
														</div>
													
													</td>
												</tr>
												</thead>
												<thead>
								
											<tr>
												<th colspan="6" font color="red"><h4>Government Tax</h4></font></th>
												</tr>
											<tr>
											<th  colspan="3">Tax Percentage</th>
												<td  colspan="3" >
													<div class="form-group">
													 <div class="col-md-6 col-sm-6 col-xs-12">
													<input type="number" id="tax" name="taxPerc"  class="form-control col-md-7 col-xs-12">
													</div></td>
													</tr>
													</thead>
												
											</table>	
											<div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3 pull-right">
                                                <button type="submit" class="btn btn-primary pull-right">Create Rule</button>
                                            </div>
                                        </div>
											
							
									</div >
									
									 <input type="hidden" name="action" value="createRule">
 <!-- Modal -->
		          
		          <div  aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="mModal"  name="mModal" class="modal fade">
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
				
   				<jsp:include page="footer.jsp"/>
                </div>
                
   				
                <!-- /page content -->

                <!-- footer content -->
               
                <!-- /footer content -->

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

            $(function () {
                $('#tags_1').tagsInput({
                    width: 'auto'
                });
            });
        </script>
        <!-- /input tags -->
        <!-- form validation -->
       
        <!-- /form validation -->
        <!-- editor -->
        <script>
            $(document).ready(function () {
                $('.xcxc').click(function () {
                    $('#descr').val($('#editor').html());
                });
            });

            $(function () {
                function initToolbarBootstrapBindings() {
                    var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
                'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
                'Times New Roman', 'Verdana'],
                        fontTarget = $('[title=Font]').siblings('.dropdown-menu');
                    $.each(fonts, function (idx, fontName) {
                        fontTarget.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">' + fontName + '</a></li>'));
                    });
                    $('a[title]').tooltip({
                        container: 'body'
                    });
                    $('.dropdown-menu input').click(function () {
                            return false;
                        })
                        .change(function () {
                            $(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');
                        })
                        .keydown('esc', function () {
                            this.value = '';
                            $(this).change();
                        });

                    $('[data-role=magic-overlay]').each(function () {
                        var overlay = $(this),
                            target = $(overlay.data('target'));
                        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
                    });
                    if ("onwebkitspeechchange" in document.createElement("input")) {
                        var editorOffset = $('#editor').offset();
                        $('#voiceBtn').css('position', 'absolute').offset({
                            top: editorOffset.top,
                            left: editorOffset.left + $('#editor').innerWidth() - 35
                        });
                    } else {
                        $('#voiceBtn').hide();
                    }
                };

                function showErrorAlert(reason, detail) {
                    var msg = '';
                    if (reason === 'unsupported-file-type') {
                        msg = "Unsupported format " + detail;
                    } else {
                        console.log("error uploading file", reason, detail);
                    }
                    $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
                        '<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
                };
                initToolbarBootstrapBindings();
                $('#editor').wysiwyg({
                    fileUploadError: showErrorAlert
                });
                window.prettyPrint && prettyPrint();
            });
        </script>
        <!-- /editor -->
</body>
</html>