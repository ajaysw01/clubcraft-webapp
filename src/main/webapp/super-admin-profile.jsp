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
<title>ClubCraft | Super Admin Profile</title>

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
						<h2 class="page-title">Admin Profile</h2>
						<div class="row">
							<div class="col-md-10">
								<div class="panel panel-ifno">
									<div class="panel-heading">Admin Profile</div>
									<%
										String editProfile = (String) session.getAttribute("edit");
										if (editProfile != null) {
											session.removeAttribute("edit");
									%>
									<div class="alert alert-info" id="info">Profile edited
										successfully.</div>
									<%
										}
									%>
									<div class="panel-body">
										<%
											ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbladmin where email='" + session.getAttribute("email") + "'");
											if (resultset.next()) {
										%>
										<form action="UpdateSuperAdminDetails" method="post"
											class="form-horizontal">
											<div class="form-row">
												<div class="form-group col-md-5">
													<label class="control-label">College Admin Id</label> <input
														type="text" name="cai"
														value="<%=resultset.getString("id")%>"
														class="form-control" required='true' readonly>

												</div>
												<div class="form-group col-md-2"></div>
												<div class="form-group col-md-5">
													<label class="control-label">Admin Name</label> <input
														type="text" name="adminname"
														value="<%=resultset.getString("fullname")%>"
														class="form-control" required='true' readonly>

												</div>
											</div>

											<div class="form-row">
												<div class="form-group col-md-5">
													<label class="control-label">Email Id</label> <input
														type="text" name="username"
														value="<%=resultset.getString("email")%>"
														class="form-control" readonly>

												</div>
												<div class="form-group col-md-2"></div>
												<div class="form-group col-md-5">
													<label class="control-label">Mobile No</label> <input
														type="text" name="mobile"
														value="<%=resultset.getString("mobile")%>"
														class="form-control" maxlength='10' required='true'
														pattern="[0-9]+">

												</div>
											</div>
											<div class="form-row">
												<div class="form-group col-md-5">
													<label class="control-label">College Name</label> <input
														type="text" name="college_name"
														value="<%=resultset.getString("college_name")%>"
														class="form-control" readonly>

												</div>
												<div class="form-group col-md-2"></div>
												<div class="form-group col-md-5">
													<label class="control-label"> Registration Date</label> <input
														type="text" name=""
														value="<%=resultset.getString("created_at")%>" readonly=""
														class="form-control">

												</div>
											</div>
											<div class="form-row">
												<div class="form-group col-md-6">
													<button class="btn btn-primary" name="submit" type="submit">Update</button>
												</div>
											</div>
										</form>
										<%
											}
										%>
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
