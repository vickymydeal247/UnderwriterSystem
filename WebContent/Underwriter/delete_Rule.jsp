<!DOCTYPE html>
<html lang="en">

<head>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.DatabaseUtil" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.Connection" %> 
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.ResultSet" %>    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Delete Rule | </title>

     <!-- Bootstrap core CSS -->
		<jsp:include page="cssLinks.jsp"/>
		 <script>
function preferedBrowser() {
    var a = new String(document.getElementById("delete").value);   
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
                            <h3>Delete Rule</h3>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_content">
								<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name"> <span class="required"></span>
                                            </label>
									<div class="col-md-6 col-sm-6 col-xs-12">
									 <select id = "delete" class="select2_single form-control" tabindex="-1" onchange="preferedBrowser()">
												    <option>Select Insurance Type</option>
                                                   <option value="personal">Personal</option>
                                                         <option value="group">Group</option>
                                                         <option value="family">Family</option>
                                                        
                                                    
                                                </select>
                                            </div>
								
								
								
								
								<br><br>
					<div id ="d1" hidden>
                                    <form id="form_Delete_Rule" data-parsley-validate class="form-horizontal form-label-left">

                                       
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            
                                                <button type="button" class="btn btn-danger"   data-toggle="modal" data-target="#myModal">Delete</button>
                                            </div>
                                        </div>
											<input type="hidden" name="action" value="delete_Rule">
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
									
									<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									  <div class="modal-dialog" role="document">
										<div class="modal-content">
										  <div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">Modal title</h4>
										  </div>
										  <div class="modal-body">
											Are you sure you want to delete??
										  </div>
										  <div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-danger">Delete</button>
										  </div>
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
                 <jsp:include page="footer.jsp" />
                <!-- /footer content -->

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
        <!-- Autocomplete -->
        <script type="text/javascript" src="../js/autocomplete/countries.js"></script>
        <script src="../js/autocomplete/jquery.autocomplete.js"></script>
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
        <script src="../js/custom.js"></script>


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
        <script type="text/javascript">
            $(document).ready(function () {
                $.listen('parsley:field:validate', function () {
                    validateFront();
                });
                $('#demo-form .btn').on('click', function () {
                    $('#demo-form').parsley().validate();
                    validateFront();
                });
                var validateFront = function () {
                    if (true === $('#demo-form').parsley().isValid()) {
                        $('.bs-callout-info').removeClass('hidden');
                        $('.bs-callout-warning').addClass('hidden');
                    } else {
                        $('.bs-callout-info').addClass('hidden');
                        $('.bs-callout-warning').removeClass('hidden');
                    }
                };
            });

            $(document).ready(function () {
                $.listen('parsley:field:validate', function () {
                    validateFront();
                });
                $('#demo-form2 .btn').on('click', function () {
                    $('#demo-form2').parsley().validate();
                    validateFront();
                });
                var validateFront = function () {
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
            } catch (err) {}
        </script>
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