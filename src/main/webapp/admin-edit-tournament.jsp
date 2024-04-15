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
<title>ClubCraft | Edit Tournament Info</title>

<!-- <!-- Font awesome -->
<link rel="stylesheet" href="admin/css/font-awesome.min.css">

<link rel="stylesheet" href="admin/css/bootstrap.min.css">

<link rel="stylesheet" href="admin/css/dataTables.bootstrap.min.css">

<link rel="stylesheet" href="admin/css/bootstrap-social.css">

<link rel="stylesheet" href="admin/css/bootstrap-select.css">

<link rel="stylesheet" href="admin/css/fileinput.min.css">

<link rel="stylesheet" href="admin/css/awesome-bootstrap-checkbox.css">

<link rel="stylesheet" href="admin/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#game_name").change(function() {
			var selectedValue = $(this).val();
			$.ajax({
				type : "GET",
				url : "GetDataServlet",
				data : {
					"selectedValue" : selectedValue
				},
				success : function(response) {
					$("#textbox").val(response);
				}
			});
		});
	});
</script>
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
<style>
::placeholder {
	color: black;
	opacity: 2; /* Firefox */
}

::-ms-input-placeholder { /* Edge 12-18 */
	color: black;
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("email") != null && session.getAttribute("email") != "") {
	%>
	<jsp:include page="admin-header.jsp"></jsp:include>
	<div class="ts-main-content">
		<jsp:include page="admin-leftbar.jsp"></jsp:include>
		<div class="content-wrapper">
			<div class="container">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="alert alert-info shadow p-3 mb-5"
							style="text-transform: uppercase">Edit Tournament</div>
						<div class="panel panel shadow p-3 mb-5 ">
							<div class="panel-heading bg-light"
								style="text-transform: uppercase">
								<strong>Edit Tournament &nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]&nbsp;&nbsp;
								</strong>
							</div>
							<%
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbltournament where tid='"+ request.getParameter("tid") + "' and college_name='" + session.getAttribute("collegeName") + "'");
								if (resultset.next()) {
							%>
							<div class="panel-body">
								<form action="EditTournamentInfo" method="post"
									class="form-horizontal">
									<div class="form-row">
										<div class="form-group col-md-5">
											<label class="control-label">Tournament Id</label> <input
												type="text" name="tid" id="tid" class="form-control"
												required='true' value="<%=resultset.getInt("tid")%>"
												style="border: 1px solid black;" readonly>

										</div>
										<div class="form-group col-md-1"></div>
										<div class="form-group col-md-5">
											<label class="control-label">Tournament Place</label> <input
												type="text" name="tplace" id="tplace" class="form-control"
												required='true' value="<%=resultset.getString("place")%>"
												style="border: 1px solid black;">

										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-5">
											<label class="control-label">Tournament Start Date</label> <input
												type="datetime-local" name="sdate" id="sdate"
												class="form-control" required='true'
												style="border: 1px solid black;"
												value="<%=resultset.getString("start_date")%>">
										</div>
										<div class="form-group col-md-1"></div>
										<div class="form-group col-md-5">
											<label class="control-label">Tournament End Date</label> <input
												type="datetime-local" name="edate" id="edate"
												class="form-control" required='true'
												style="border: 1px solid black;"
												value="<%=resultset.getString("end_date")%>">

										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-5">
											<label class="control-label">Game Name</label> <select
												id="game_name" name="game_name" class="form-control"
												style="border: 1px solid black;" required='true'>
												<option><%=resultset.getString("game_name")%></option>
												<%
													String gameName = null;
												ResultSet resultGameName = DatabaseConnection.getResultFromSqlQuery("select * from tblgames");
												while (resultGameName.next()) {
													gameName = resultGameName.getString("game_name");
												%>
												<option value="<%=gameName%>"><%=gameName%></option>
												<%
													}
												%>
											</select>
										</div>
										<div class="form-group col-md-1"></div>
										<div class="form-group col-md-5">
											<label class="control-label">Game Type</label> <input
												type="text" name="textbox" id="textbox" readonly
												class="form-control" style="border: 1px solid black;"
												required='true'
												value="<%=resultset.getString("game_type")%>">

										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-5">
											<label class="control-label"> College Name</label> <input
												type="text" name="collegeName" id="collegeName"
												value="<%=session.getAttribute("collegeName")%>"
												class="form-control" style="border: 1px solid black;"
												required='true' readonly>

										</div>
										<div class="form-group col-md-1"></div>
										<div class="form-group col-md-5">
											<label class="control-label">Team Size</label> <input
												type="text" name="teamSize" id="teamSize"
												class="form-control" maxlength='10' required='true'
												pattern="[0-9]+" placeholder="Team Size"
												style="border: 1px solid black;"
												value="<%=resultset.getInt("team_size")%>">

										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-5">
											<label class="control-label">Tournament Entry Fees</label> <input
												type="text" name="eFees" id="eFees"
												placeholder="Tournament Entry Fees" class="form-control"
												style="border: 1px solid black;" required='true'
												value="<%=resultset.getInt("tentry_fees")%>">

										</div>
										<div class="form-group col-md-1"></div>
										<div class="form-group col-md-5">
											<label class="control-label">Winning Price</label> <input
												type="text" name="winPrice"
												value="<%=resultset.getDouble("winning_price")%>"
												class="form-control" style="border: 1px solid black;"
												required='true'>

										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<button class="btn btn-info" name="submit" type="submit">Update</button>
										</div>
									</div>
								</form>
							</div>
							<%
								}
							%>
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
