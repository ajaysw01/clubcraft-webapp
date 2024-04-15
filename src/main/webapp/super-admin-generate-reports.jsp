<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.aj.connection.*"%>
<!doctype html>
<html lang="en" class="no-js">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="theme-color" content="#3e454c">
<link rel="shortcut icon"
	href="public/assets/images/logo/sport-logo.jpg" type="image/x-icon">
<title>ClubCraft | Super Admin Generate Reports</title>

<!-- Font awesome -->
<link rel="stylesheet" href="admin/css/font-awesome.min.css">
<!-- Sandstone Bootstrap CSS -->
<link rel="stylesheet" href="admin/css/bootstrap.min.css">
<!-- Bootstrap Datatables -->
<link rel="stylesheet" href="admin/css/dataTables.bootstrap.min.css">
<!-- Bootstrap social button library -->
<link rel="stylesheet" href="admin/css/bootstrap-social.css">
<!-- Bootstrap select -->
<link rel="stylesheet" href="admin/css/bootstrap-select.css">
<!-- Bootstrap file input -->
<link rel="stylesheet" href="admin/css/fileinput.min.css">
<!-- Awesome Bootstrap checkbox -->
<link rel="stylesheet" href="admin/css/awesome-bootstrap-checkbox.css">
<!-- Admin Stye -->
<link rel="stylesheet" href="admin/css/style.css">
</head>

<body>
	<%
		if (session.getAttribute("fullName") != null && session.getAttribute("fullName") != "") {
	%>
	<jsp:include page="super-admin-header.jsp"></jsp:include>
	<div class="ts-main-content">
		<jsp:include page="super-admin-leftbar.jsp"></jsp:include>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h2 class="page-title">Generate Reports</h2>
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-6 col-sm-6 col-xs-6">
										<img src="public/assets/images/logo/reports-logo.jpeg" style="width: 550px;height:300px;">
									</div>
									<div class="col-md-6 col-sm-6 col-xs-6">
										<table id="table" class="table table-bordered shadow p-3 mb-5">
											<tbody>
												<form action="AllGameListReport">
													<tr>
														<th>Game List Report</th>
														<td><input type="submit" value="Generate Reports"
															class="btn btn-primary"></td>
													</tr>
												</form>
												<form action="AllCollegeListReport">
													<tr>
														<th>College List Report</th>
														<td><input type="submit" value="Generate Reports"
															class="btn btn-info"></td>
													</tr>
												</form>
												<form action="AllCollegeAdminListReport">
													<tr>
														<th>College Admin List Report</th>
														<td><input type="submit" value="Generate Reports"
															class="btn btn-secondary"></td>
													</tr>
												</form>
												<form action="AllStudentListReport">
													<tr>
														<th>All Students List Report</th>
														<td><input type="submit" value="Generate Reports"
															class="btn btn-warning"></td>
													</tr>
												</form>
												<form action="AllContactReport">
													<tr>
														<th>Contact/Inquiry Report</th>
														<td><input type="submit" value="Generate Reports"
															class="btn btn-danger"></td>
													</tr>
												</form>
												<form action="AllFeedbackListReport">
													<tr>
														<th>Feedback Report</th>
														<td><input type="submit" value="Generate Reports"
															class="btn btn-success"></td>
													</tr>
												</form>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Loading Scripts -->
	<script src="admin/js/jquery.min.js"></script>
	<script src="admin/js/bootstrap-select.min.js"></script>
	<script src="admin/js/bootstrap.min.js"></script>
	<script src="admin/js/jquery.dataTables.min.js"></script>
	<script src="admin/js/dataTables.bootstrap.min.js"></script>
	<script src="admin/js/Chart.min.js"></script>
	<script src="admin/js/fileinput.js"></script>
	<script src="admin/js/chartData.js"></script>
	<script src="admin/js/main.js"></script>

	<script>
		window.onload = function() {

			// Line chart from swirlData for dashReport
			var ctx = document.getElementById("dashReport").getContext("2d");
			window.myLine = new Chart(ctx).Line(swirlData, {
				responsive : true,
				scaleShowVerticalLines : false,
				scaleBeginAtZero : true,

			});

			// Pie Chart from doughutData
			var doctx = document.getElementById("chart-area3").getContext("2d");
			window.myDoughnut = new Chart(doctx).Pie(doughnutData, {
				responsive : true
			});

			// Dougnut Chart from doughnutData
			var doctx = document.getElementById("chart-area4").getContext("2d");
			window.myDoughnut = new Chart(doctx).Doughnut(doughnutData, {
				responsive : true
			});

		}
	</script>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>
