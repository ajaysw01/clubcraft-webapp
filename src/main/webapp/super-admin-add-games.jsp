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
<title>ClubCraft | Super Admin Add Games</title>

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
.errorWrap {
	padding: 10px;
	margin: 0 0 20px 0;
	background: #fff;
	border-left: 4px solid #dd3d36;
	-webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
}

.succWrap {
	padding: 10px;
	margin: 0 0 20px 0;
	background: #fff;
	border-left: 4px solid #5cb85c;
	-webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
}
</style>


</head>

<body>
	<%
		if (session.getAttribute("email") != null && session.getAttribute("email") != "") {
	%>
	<jsp:include page="super-admin-header.jsp"></jsp:include>
	<div class="ts-main-content">
		<jsp:include page="super-admin-leftbar.jsp"></jsp:include>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h2 class="page-title">Add Game</h2>
						<%
							String message = (String) session.getAttribute("success");
							if (message != null) {
							session.removeAttribute("success");
						%>
						<div class='alert alert-success' id='success'>Game added
							successfully.</div>
						<%
							}
						%>
						<%
							String alreadyExist = (String) session.getAttribute("alreadyAdded");
							if (alreadyExist != null) {
							session.removeAttribute("alreadyAdded");
						%>
						<div class='alert alert-danger' id='danger'>This game name already added.</div>
						<%
							}
						%>
						<div class="row">
							<div class="col-md-6">
								<div class="panel panel-info">
									<div class="panel-heading">Add Game</div>
									<div class="panel-body">
										<form action="AddGame" method="post" name="AddGame"
											class="form-horizontal">
											<div class="form-row">
												<div class="form-group col-md-12">
													<label class="control-label">Game Name</label> <input
														type="text" class="form-control" name="game_name"
														id="game_name" placeholder="Game Name" required>

												</div>
											</div>
											<div class="hr-dashed"></div>
											<div class="form-row">
												<div class="form-group col-md-12">
													<label class="control-label">Game Type</label> <select
														class="form-control" name="game_type" id="game_type"
														required>
														<option selected="" disabled>Select Game Type</option>
														<option>Indoor</option>
														<option>Outdoor</option>
													</select>
												</div>
											</div>
											<div class="hr-dashed"></div>
											<div class="form-row">
												<div class="form-group col-md-12">
													<button class="btn btn-primary" name="submit" type="submit">Add
														Game</button>
													||
													<button class="btn btn-danger" type="reset">Clear
													</button>
												</div>
											</div>
										</form>
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
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
<script type="text/javascript">
	$(function() {
		$('#danger').delay(3000).show().fadeOut('slow');
	});

	$(function() {
		$('#success').delay(3000).show().fadeOut('slow');
	});

	$(function() {
		$('#info').delay(3000).show().fadeOut('slow');
	});
</script>
</html>
