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
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Home | Manager</title>

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
                    <jsp:include page="sideNavM.jsp"/>
                    <!-- /sidebar menu -->

                    <!-- /menu footer buttons -->
                   
                    <!-- /menu footer buttons -->
                </div>
            </div> 
            <!-- top navigation -->
            <jsp:include page="topNavM.jsp"/>
            <!-- /top navigation -->

            <!-- page content -->
            <div class="right_col" role="main">
                <div class="">

                    <div class="page-title">
                        <div class="title_left">
                            <h3></h3>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_content">
                                
                                <form id="demo-form2" class="form-horizontal form-label-left"
										data-parsley-validate action="../ManagerServlet"> 
                              		<% 
		       String s = request.getParameter("submit");
			//String string = "004-034556";
		
			System.out.println(s);
			%>
			<% 
														try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															//PreparedStatement ps1 = null;
														//	ResultSet rs1 = null;
															String pid=s,sum=null,cid=null;//=null;
															int count =0;
															double sumamt=0;
															int flag=0;
														//	ps1 = c.prepareStatement("select proposalid ,status from TBL_Proposals where STATUS = 'Premium Generated Waiting For Approval'");
														//	rs1 = ps1.executeQuery();
															
															
															
															PreparedStatement ps2 = null;
															ResultSet rs2 = null;
															
															ps2 = c.prepareStatement("select customer_id ,sum_insured from TBL_CREATEPROPOSAL where proposal_id="+pid);
															System.out.println("jj");
															rs2 = ps2.executeQuery();
															
															if(rs2.next())
																
																
															{
																System.out.println("j1j");
																cid=rs2.getString(1);
																System.out.println(cid);
																sum=rs2.getString(2);
																System.out.println(sum);
															}

															PreparedStatement ps3 = null;
															ResultSet rs3 = null;
															System.out.println("pp"+cid);
															ps3=c.prepareStatement("select * from tbl_addclaim where customer_id=?");
															ps3.setString(1, cid);
															rs3 = ps3.executeQuery();
															while(rs3.next()){
															flag=1;
																
															}
															if(flag==1)
															{
															PreparedStatement ps4 = null;
															ResultSet rs4 = null;
															ps4 = c.prepareStatement("select count(*),sum(CLAIM_AMOUNT) from tbl_addclaim where customer_id=?" );
															ps4.setString(1, cid);
															System.out.println("jj");
															rs4 = ps4.executeQuery();
															System.out.println("j22j");
															while(rs4.next())
															{
																System.out.println("j1j");
																sumamt= Double.parseDouble(rs4.getString(2));
																System.out.println(sumamt);
																count= rs4.getInt(1);
																System.out.println(count);
																System.out.println("done");
																
															}
															}
															else
															{
																sumamt=0;
																count=0;
																
															}
																												
														%> 
                                   <table class="table" id="example">
														<thead>
															<tr>
																<th>Proposal ID</th>
																<th>Sum Insured</th>
																<th>Claim Sum</th>
																<th>Claim Count</th>
																
												
															</tr>
														</thead>
														
														<tbody>
													<%-- 	<% 
														while (rs2.next()) {
															//String pid=null;
															pid=rs2.getString(1);
														%> 
														 --%>
															<tr>
																
																<td class="center"> <%=pid%> </td>
																<td class="center"> <%=sum%></td>
																<td class="center"> <%=sumamt%></td>
																<td class="center"> <%=count%></td>
																
																
														</tr>
															
					
									
										
								 						
									<%
										/* 	} */
	
														} catch (Exception e) {
															e.printStackTrace();
															
														}
												
			 %>
					 
												

														</tbody>
														
													</table>
                              
                           <h2>Comment</h2>
                    <div class="col-md-12 col-md-offset-4">
                    <div class="row">
                    <div class="col-md-6">
                  
                    <textarea rows="4" cols="8" name="comment" value=""></textarea>
                      </div>
                       </div>
                        <div class="row">
                       <div class="col-md-6">
                       <input type="hidden" name="pid" value="<%=request.getParameter("submit")%>">
                       <input type="hidden" name="action" value="response">
                        <button type="submit" class="btn btn-success" name="submit" value="Premium Generated Approved By Manager Quote Not Generated" >Accept</button>
                        <button type="submit" class="btn btn-danger" name="submit" value="Premium Generated Rejected By Manager">Reject</button>
                       </div>
                    
                   
                    </div>
                    </div>
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