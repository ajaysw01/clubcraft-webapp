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
<title>ClubCraft | Super Admin Dashboard</title>

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
						<h2 class="page-title">Dashboard</h2>
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-primary text-light">
												<div class="stat-panel text-center">
													<%
														int gamesCount = 0;
														ResultSet resultGames = DatabaseConnection.getResultFromSqlQuery("SELECT count(*) from tblgames");
														resultGames.next();
														gamesCount = resultGames.getInt(1);
													%>
													<div class="stat-panel-number h1 "><%=gamesCount%></div>
													<div class="stat-panel-title text-uppercase">Total
														Game Sports</div>
												</div>
											</div>
											<a href="super-admin-game-view-list.jsp"
												class="block-anchor panel-footer">Full Detail <i
												class="fa fa-arrow-right"></i></a>
										</div>
									</div>
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-success text-light">
												<div class="stat-panel text-center">
													<%
														int studentCount = 0;
														ResultSet resultStudent = DatabaseConnection.getResultFromSqlQuery("SELECT count(*) from tblstudent");
														resultStudent.next();
														studentCount = resultStudent.getInt(1);
													%>
													<div class="stat-panel-number h1 "><%=studentCount%></div>
													<div class="stat-panel-title text-uppercase">All
														Students</div>
												</div>
											</div>
											<a href="super-admin-view-students-list.jsp"
												class="block-anchor panel-footer text-center">Full
												Detail &nbsp; <i class="fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
									<div class="col-md-4">
										<div class="panel panel-danger">
											<div class="panel-body bk-danger text-light">
												<div class="stat-panel text-center">
													<%
														int tournamentCount=0;
														ResultSet resultTournament=DatabaseConnection.getResultFromSqlQuery("SELECT count(*) from tbltournament");
														resultTournament.next();
														tournamentCount=resultTournament.getInt(1);
													%>
													<div class="stat-panel-number h1 "><%=tournamentCount %></div>
													<div class="stat-panel-title text-uppercase">Total
														Tournaments</div>
												</div>
											</div>
											<a href="super-admin-view-tournaments.jsp"
												class="block-anchor panel-footer text-center">Full
												Detail &nbsp; <i class="fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-warning text-light">
												<div class="stat-panel text-center">
													<%
														int collegeAdminCount = 0;
														ResultSet resultCollegeAdmin = DatabaseConnection.getResultFromSqlQuery("SELECT count(*) from tbladmin where fullname!='Super Admin'");
														resultCollegeAdmin.next();
														collegeAdminCount = resultCollegeAdmin.getInt(1);
													%>
													<div class="stat-panel-number h1 "><%=collegeAdminCount%></div>
													<div class="stat-panel-title text-uppercase">All
														College Admin</div>
												</div>
											</div>
											<a href="super-admin-view-college-admin-list.jsp"
												class="block-anchor panel-footer text-center">Full
												Detail &nbsp; <i class="fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-info text-light">
												<div class="stat-panel text-center">
													<%
														int collegeCount = 0;
														ResultSet resultCollegeList = DatabaseConnection.getResultFromSqlQuery("SELECT count(*) from tblcollege");
														resultCollegeList.next();
														collegeCount = resultCollegeList.getInt(1);
													%>
													<div class="stat-panel-number h1 "><%=collegeCount%></div>
													<div class="stat-panel-title text-uppercase">All
														College</div>
												</div>
											</div>
											<a href="super-admin-view-college-list.jsp"
												class="block-anchor panel-footer text-center">Full
												Detail &nbsp; <i class="fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
									<!------------------------>

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
