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

<title>ClubCraft | Super Admin User/Student List</title>
<link rel="shortcut icon"
	href="public/assets/images/logo/sport-logo.jpg" type="image/x-icon">
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
						<h2 class="page-title">All Students List</h2>
						<%
							String deleteStudent = (String) session.getAttribute("delStudent");
							if (deleteStudent != null) {
								session.removeAttribute("delStudent");
						%>
						<div class="alert alert-danger" id="danger">Student deleted successfully.</div>
						<%
							}
						%>
						<!-- Zero Configuration Table -->
						<div class="panel panel-info">
							<div class="panel-heading">All Students List</div>
							<div class="panel-body">
								<table id="zctb"
									class="display table table-striped table-bordered table-hover"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>#</th>
											<th>Image</th>
											<th>Student Name</th>
											<th>Email Id</th>
											<th>Mobile No</th>
											<th>Course</th>
											<th>DOB</th>
											<th>Address</th>
											<th>College Name</th>
											<th>Game Name</th>
											<th>Register At</th>
											<th>Action</th>
										</tr>
									</thead>
									<%
										ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("SELECT * from  tblstudent");
										while (resultset.next()) {
									%>
									<tbody>
										<tr>
											<td><%=resultset.getString("sid")%></td>
											<td><img src="uploads/<%=resultset.getString("photo")%>"
												style="width: 70px; height: 50px;"></td>
											<td><%=resultset.getString("sname")%></td>
											<td><%=resultset.getString("email")%></td>
											<td><%=resultset.getString("mobile")%></td>
											<td><%=resultset.getString("course")%></td>
											<td><%=resultset.getString("dob")%></td>
											<td><%=resultset.getString("address")%></td>
											<td><%=resultset.getString("college_name")%></td>
											<td><%=resultset.getString("game_name")%></td>
											<td><%=resultset.getString("created_at")%></td>
											<td><a href="super-admin-delete-student.jsp?del=<%=resultset.getString("sid")%>"onclick="return confirm('Do you want to delete');"><i
													class="fa fa-close"></i></a>
										</tr>
									</tbody>
									<%
										}
									%>
								</table>
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

