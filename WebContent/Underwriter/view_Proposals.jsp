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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Home | </title>

    <!-- Bootstrap core CSS -->
		<jsp:include page="cssLinks.jsp"/>
		
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







<body class="nav-md">
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
                            <h3>View all Proposals</h3>
                        </div>
                        
                    </div>
					<div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_content">
                                    <br />
                                    <form id="form_View_Proposal" class="form-horizontal form-label-left" data-parsley-validate>

                                        <div class="form-group">
										<div id="container">
                                  
	
											
											
			<div class="demo_jui">
			<table border="0" cellspacing="5" cellpadding="5">
				<tr>
					<td>Minimum CGPA:</td>
					<td><input type="text" id="min" name="min"></td>
				</tr>
				<tr>
					<td>Maximum CGPA:</td>
					<td><input type="text" id="max" name="max"></td>
				</tr>
				
			</table>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
	<thead>
		<tr>
			<th>Enrollment No.</th>
			<th>Name</th>
			<th>CS601</th>
			<th>CS602</th>
			<th>CS603</th>
			<!--<th>CS604</th>
			<th>CS605</th>-->
			<th>SGPA</th>
			<th>CGPA</th>
			
		</tr>
	</thead>
	<tbody>
		<tr class="gradeC">
		<td>0808CS101048</td>
		<td>Vinay P</td>
		<td class="center">C</td>
		<td class="center">B+</td>
		<td class="center">B</td>
	<!--	<td class="center">C+</td>
		<td class="center">A+</td>-->
		<td class="center">1.50</td>
		<td class="center">2.36</td>
		</tr>
		<tr class="gradeC">
		<td>0808CS101049</td>
		<td>Niharika Pandey</td>
		<td class="center">A</td>
		<td class="center">A+</td>
		<td class="center">C</td>
		<!--<td class="center">B+</td>
		<td class="center">A+</td>-->
		<td class="center">8.50</td>
		<td class="center">9.36</td>
		</tr>
		<tr class="gradeC">
		<td>0808cs101003</td>
		<td>Popo Kumar</td>
		<td class="center">A</td>
		<td class="center">B+</td>
		<td class="center">B</td>
		<!--<td class="center">B+</td>
		<td class="center">A+</td>-->
		<td class="center">7.40</td>
		<td class="center">7.36</td>
		</tr>
		
	</tbody>
	<tfoot>
		<tr>
			<th><input type="text" name="search_eno." placeholder="Search Enrollment" class="search_init" /></th>
			<th><input type="text" name="search_students" placeholder="Search Students" class="search_init" /></th>
			<th><input type="text" name="search_CS601" placeholder="Search CS601 grades" class="search_init" /></th>
			<th><input type="text" name="search_CS602" placeholder="Search CS602 grades" class="search_init" /></th>
			<th><input type="text" name="search_CS603" placeholder="Search CS603 grades" class="search_init" /></th>
		<!--	<th><input type="text" name="search_CS604" placeholder="Search CS604 grades" class="search_init" /></th>
			<th><input type="text" name="search_CS605" placeholder="Search CS605 grades" class="search_init" /></th>-->
			<th><input type="text" name="search_sgpa" placeholder="Search SGPA" class="search_init" /></th>
			<th><input type="text" name="search_cgpa" placeholder="Search CGPA" class="search_init" /></th>
			
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
											
											
										</div>
                                        
                                    <input type="hidden" name="action" value="view_Proposal">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
           
                    
                </div>
                    
   
                </div>
                <!-- /page content -->

                <!-- footer content -->
                <footer>
                    <div class="" >
                        <p class="pull-right">Hello <a>Hi</a>. |
                            <span class="lead"> <i class="fa fa-paw"></i>Hi</span>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </footer>
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
                    placeholder: "Select a status",
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