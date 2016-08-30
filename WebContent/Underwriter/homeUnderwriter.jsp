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
<%@ page import="dao.ManageFunction"%>

												<%
												
												int noOfUsers = 0;
												int noOfPendingProposals = 0;
												int noOfCustomers = 0;
												int noOfClaims = 0;
												/* public enum month
												{
												
													JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC;
													
												} */
												//String[] month = {"JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};
												int count[]=new int[12];
												Arrays.fill(count, 0);
														try {

															DBConnection d = new DBConnection();
															Connection c = d.getConnection();
															PreparedStatement ps = null;
															ResultSet rs = null;
															ps = c.prepareStatement("select count(*) from TBL_login");
															rs = ps.executeQuery();
															rs.next();
															noOfUsers = rs.getInt(1);
															
															ps = c.prepareStatement("select count(*) from TBL_proposals where status=?");
															ps.setString(1, "Premium generated waiting for approval");
															rs = ps.executeQuery();
															rs.next();
															noOfPendingProposals = rs.getInt(1);
															
															ps = c.prepareStatement("select count(*) from TBL_createCustomer");
															rs = ps.executeQuery();
															rs.next();
															noOfCustomers = rs.getInt(1);
															
															ps = c.prepareStatement("select count(*) from TBL_addclaim");
															rs = ps.executeQuery();
															rs.next();
															noOfClaims = rs.getInt(1);
															
															
															ps = c.prepareStatement("select count(*),startmonth from tbl_customer_date group by startMonth");
															rs = ps.executeQuery();
															while(rs.next())
															{
															if(rs.getString(2).equalsIgnoreCase("JAN"))
															{
																count[0] = rs.getInt(1);
															}else if(rs.getString(2).equalsIgnoreCase("FEB"))
															{
																count[1] = rs.getInt(1);
															}else if(rs.getString(2).equalsIgnoreCase("MAR"))
															{
																count[2] = rs.getInt(1);
															}else if(rs.getString(2).equalsIgnoreCase("APR"))
															{
																count[3] = rs.getInt(1);
															}else if(rs.getString(2).equalsIgnoreCase("MAY"))
															{
																count[4] = rs.getInt(1);
															}else if(rs.getString(2).equalsIgnoreCase("JUN"))
															{
																count[5] = rs.getInt(1);
															}else if(rs.getString(2).equalsIgnoreCase("JUL"))
															{
																count[6] = rs.getInt(1);
															}else if(rs.getString(2).equalsIgnoreCase("AUG"))
															{
																count[7] = rs.getInt(1);
															}else if(rs.getString(2).equalsIgnoreCase("SEP"))
															{
																count[8] = rs.getInt(1);
															}else if(rs.getString(2).equalsIgnoreCase("OCT"))
															{
																count[9] = rs.getInt(1);
															}else if(rs.getString(2).equalsIgnoreCase("NOV"))
															{
																count[10] = rs.getInt(1);
															}else if(rs.getString(2).equalsIgnoreCase("DEC"))
															{
																count[11] = rs.getInt(1);
															}
															}
																for(int i=0;i<12;i++)
																{
																	System.out.println(count[i]);
																}
															
											} catch (Exception e) {
												
											}
										
 											
 												
 												%>
													
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Home</title>

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
					<jsp:include page="sideNav.jsp" />
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->


					<!-- /menu footer buttons -->
				</div>
			</div>
			<!-- top navigation -->
			<jsp:include page="topNav.jsp" />
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">

					<div class="page-title">
						<div class="title_left">
							<h3>Home</h3>
						</div>

					</div>
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_content">

									<div class="row">
										<div class="col-lg-3 col-md-6">
											<div class="panel panel-primary">
												<div class="panel-heading">
													<div class="row">
														<div class="col-xs-3"></div>
														<div class="col-xs-9 text-right">
															<div class="huge"><%=noOfUsers%></div>
															<div>User</div>
														</div>
													</div>
												</div>
												<div class="panel-footer">
													<span class="pull-left"></span> <span class="pull-right"></span>
													<div class="clearfix"></div>
												</div>
											</div>
										</div>
										<div class="col-lg-3 col-md-6">
											<div class="panel panel-warning">
												<div class="panel-heading ">
													<div class="row">
														<div class="col-xs-3"></div>
														<div class="col-xs-9 text-right">
															<div class="huge"><%=noOfPendingProposals %></div>
															<div>Pending Proposals</div>
														</div>
													</div>
												</div>

												<div class="panel-footer">
													<span class="pull-left"></span> <span class="pull-right"></span>
													<div class="clearfix"></div>
												</div>

											</div>
										</div>
										<div class="col-lg-3 col-md-6">
											<div class="panel panel-success">
												<div class="panel-heading">
													<div class="row">
														<div class="col-xs-3"></div>
														<div class="col-xs-9 text-right">
															<div class="huge"><%=noOfCustomers %></div>
															<div>Total Customers</div>
														</div>
													</div>
												</div>
												<div class="panel-footer">
													<span class="pull-left"></span> <span class="pull-right"></span>
													<div class="clearfix"></div>
												</div>
											</div>
										</div>
										<div class="col-lg-3 col-md-6">
											<div class="panel panel-danger">
												<div class="panel-heading">
													<div class="row">
														<div class="col-xs-3"></div>
														<div class="col-xs-9 text-right">
															<div class="huge"><%=noOfClaims %></div>
															<div>Claims</div>
														</div>
													</div>
												</div>
												<div class="panel-footer">
													<span class="pull-left"></span> <span class="pull-right"></span>
													<div class="clearfix"></div>
												</div>
												</a>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
					   <div class="col-md-10 col-sm-10 col-md-offset-1 col-xs-12">
							<div class="x_panel">
							<div class="x_title">
                                
                                    <h2>Claims Comparison </h2>
                                  
                                    <div class="clearfix"></div>
                                </div>
								<div class="x_content">
								 <canvas id="canvas000"></canvas>
								</div>
							</div>
						</div>
						</div>
						
						<div hidden>
						<div class="row">
						 <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Bar graph </h2>
                                  
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <canvas id="canvas_bar"></canvas>
                                </div>
                            </div>
                        </div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="x_panel">
							<div class="x_title">
                                
                                    <h2>Claims per product </h2>
                                  
                                    <div class="clearfix"></div>
                                </div>
								<div class="x_content">
								 <canvas id="canvas_pie"></canvas>
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
		<ul class="list-unstyled notifications clearfix"
			data-tabbed_notifications="notif-group">
		</ul>
		<div class="clearfix"></div>
		<div id="notif-group" class="tabbed_notifications"></div>
	</div>

	<jsp:include page="jsLinks.jsp" />

	<script src="../js/chartjs/chart.min.js"></script>
 <script>
        var randomScalingFactor = function () {
            return Math.round(Math.random() * 100)
        };



        var barChartData = {
            labels: ["Manager1", "Manager2", "Manager3", "Manager4", "Manager5", "Manager6"],
            datasets: [
                {
                    fillColor: "#26B99A", //rgba(220,220,220,0.5)
                    strokeColor: "#26B99A", //rgba(220,220,220,0.8)
                    highlightFill: "#36CAAB", //rgba(220,220,220,0.75)
                    highlightStroke: "#36CAAB", //rgba(220,220,220,1)
                    data: [51, 30, 40, 28, 46, 50, ]
            },
              /*   {
                    fillColor: "#03586A", //rgba(151,187,205,0.5)
                    strokeColor: "#03586A", //rgba(151,187,205,0.8)
                    highlightFill: "#066477", //rgba(151,187,205,0.75)
                    highlightStroke: "#066477", //rgba(151,187,205,1)
                    data: [41, 56, 25, 48, 72, 34, 12, 56, 90, 20, 42, 20]
            }
 */        ],
        }

        $(document).ready(function () {
            new Chart($("#canvas_bar").get(0).getContext("2d")).Bar(barChartData, {
                tooltipFillColor: "rgba(51, 51, 51, 0.55)",
                responsive: true,
                barDatasetSpacing: 6,
                barValueSpacing: 5
            });
        });


        var lineChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
            datasets: [
                {
                    label: "My First dataset",
                    fillColor: "rgba(38, 185, 154, 0.31)", //rgba(220,220,220,0.2)
                    strokeColor: "rgba(38, 185, 154, 0.7)", //rgba(220,220,220,1)
                    pointColor: "rgba(38, 185, 154, 0.7)", //rgba(220,220,220,1)
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                  /*   data: [5, 3, 4, 8, 6, 5, 4, 4, 5, 5, 2, 1] */
                  
                    	 data: [  <% for(int i=0;i<12;i++)
					 {%><%=count[i]%>, <% }%>]
					
                    
            },
          /*       {
                    label: "My Second dataset",
                    fillColor: "rgba(3, 88, 106, 0.3)", //rgba(151,187,205,0.2)
                    strokeColor: "rgba(3, 88, 106, 0.70)", //rgba(151,187,205,1)
                    pointColor: "rgba(3, 88, 106, 0.70)", //rgba(151,187,205,1)
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: [41, 56, 25, 48, 72, 34, 12, 56, 90, 20, 42, 20]
            } */
        ]

        }

        $(document).ready(function () {
            new Chart(document.getElementById("canvas000").getContext("2d")).Line(lineChartData, {
                responsive: true,
                tooltipFillColor: "rgba(51, 51, 51, 0.55)"
            });
        });

        var sharePiePolorDoughnutData = [
            {
                value: 30,
                color: "#455C73",
                highlight: "#34495E",
                label: "Product One"
        },
            {
                value: 45,
                color: "#9B59B6",
                highlight: "#B370CF",
                label: "Product two"
        },
            {
                value: 25,
                color: "#BDC3C7",
                highlight: "#CFD4D8",
                label: "Product Three"
        }

    ];

        $(document).ready(function () {
            window.myPie = new Chart(document.getElementById("canvas_pie").getContext("2d")).Pie(sharePiePolorDoughnutData, {
                responsive: true,
                tooltipFillColor: "rgba(51, 51, 51, 0.55)"
            });
        });

        var radarChartData = {
            labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
            datasets: [
                {
                    label: "My First dataset",
                    fillColor: "rgba(3, 88, 106, 0.2)",
                    strokeColor: "rgba(3, 88, 106, 0.80)",
                    pointColor: "rgba(3, 88, 106, 0.80)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: [65, 59, 90, 81, 56, 55, 40]
            },
                {
                    label: "My Second dataset",
                    fillColor: "rgba(38, 185, 154, 0.2)",
                    strokeColor: "rgba(38, 185, 154, 0.85)",
                    pointColor: "rgba(38, 185, 154, 0.85)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: [28, 48, 40, 19, 96, 27, 100]
            }
        ]
        };

        $(document).ready(function () {
            window.myRadar = new Chart(document.getElementById("canvas_radar").getContext("2d")).Radar(radarChartData, {
                responsive: true,
                tooltipFillColor: "rgba(51, 51, 51, 0.55)"
            });
        });

        var polarData = [
            {
                value: 300,
                color: "#F7464A",
                highlight: "#FF5A5E",
                label: "Red	"
        },
            {
                value: 50,
                color: "#46BFBD",
                highlight: "#5AD3D1",
                label: "Green"
        },
            {
                value: 100,
                color: "#FDB45C",
                highlight: "#FFC870",
                label: "Yellow"
        },
            {
                value: 40,
                color: "#949FB1",
                highlight: "#A8B3C5",
                label: "Grey"
        },
            {
                value: 120,
                color: "#4D5360",
                highlight: "#616774",
                label: "Dark Grey"
        }

    ];

        $(document).ready(function () {
            window.myPolarArea = new Chart(document.getElementById("canvas_area").getContext("2d")).PolarArea(sharePiePolorDoughnutData, {
                responsive: true,
                tooltipFillColor: "rgba(51, 51, 51, 0.55)"
            });
        });


        $(document).ready(function () {
            window.myDoughnut = new Chart(document.getElementById("canvas_doughnut").getContext("2d")).Doughnut(sharePiePolorDoughnutData, {
                responsive: true,
                tooltipFillColor: "rgba(51, 51, 51, 0.55)"
            });
        });
    </script>


	
	<!-- input tags -->
	
	<!-- /input tags -->
	<!-- form validation -->

	<!-- /form validation -->
	<!-- editor -->
	
	<!-- /editor -->
</body>
</html>