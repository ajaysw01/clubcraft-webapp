<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.aj.connection.*"%>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>ClubCraft | Change Password</title>

<link rel="stylesheet" href="public/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="public/assets/css/all.min.css">
<link rel="stylesheet" href="public/assets/css/animate.css">
<link rel="stylesheet" href="public/assets/css/nice-select.css">
<link rel="stylesheet" href="public/assets/css/slick.css">
<link rel="stylesheet" href="public/assets/css/slick-theme.css">
<link rel="stylesheet" href="public/assets/css/odometer.css">
<link rel="stylesheet" href="public/assets/css/magnific-popup.css">
<link rel="stylesheet" href="public/assets/css/flaticon.css">
<link rel="stylesheet" href="public/assets/css/main.css">
<link rel="stylesheet" href="public/assets/css/custom.css">
<script src="http://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="shortcut icon"
	href="public/assets/images/logo/sport-logo.jpg" type="image/x-icon">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<style>
html, body {
	width: 100%;
	height: 100%;
	overflow-x: hidden;
}
</style>

<body>
	<!-- ==========Preloader Overlay Starts Here========== -->


	<div class="scrollToTop">
		<i class="fas fa-angle-up"></i>
	</div>
	<div class="overlay"></div>
	<div class="overlayTwo"></div>

	<!-- ==========Preloader Overlay Ends Here========== -->

	<!-- ==========Header Section Starts Here========== -->
	<header>
		<div class="header-top">
			<div class="container">
				<div class="header-top-area">
					<ul class="left">
						<li><i class="far fa-clock"></i> 9 AM - 6 PM Mon - Fri</li>
						<li><a href="#"><i class="fas fa-phone-alt"></i> +91
								8459886292</a></li>
						<li><i class="fas fa-map-marker-alt"></i> Pune</li>
					</ul>
					<ul class="social-icons">
						<li><a href="" target="_blank"><i class="fab fa-facebook"></i></a>
						</li>
						<li><a href="" target="_blank"><i
								class="fab fa-instagram"></i></a></li>

					</ul>
				</div>
			</div>
		</div>
		<jsp:include page="student-side-header.jsp"></jsp:include>
	</header>
	<link rel="stylesheet"
		href="../cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- ==========Header Section Ends Here========== -->
	<style>
.adminActions {
	position: fixed;
	bottom: 35px;
	right: 35px;
}

.adminButton {
	height: 60px;
	width: 60px;
	background-color: rgba(67, 83, 143, .8);
	border-radius: 50%;
	display: block;
	color: #fff;
	text-align: center;
	position: relative;
	z-index: 1;
}

.adminButton i {
	font-size: 22px;
}

.adminButtons {
	position: absolute;
	width: 100%;
	bottom: 120%;
	text-align: center;
}

.adminButtons a {
	display: block;
	width: 45px;
	height: 45px;
	border-radius: 50%;
	text-decoration: none;
	margin: 10px auto 0;
	line-height: 1.15;
	color: #fff;
	opacity: 0;
	visibility: hidden;
	position: relative;
	box-shadow: 0 0 5px 1px rgba(51, 51, 51, .3);
}

.adminButtons a:hover {
	transform: scale(1.05);
}

.adminButtons a:nth-child(1) {
	background-color: purple;
	transition: opacity .2s ease-in-out .3s, transform .15s ease-in-out;
}

.adminButtons a:nth-child(2) {
	background-color: green;
	transition: opacity .2s ease-in-out .25s, transform .15s ease-in-out;
}

.adminButtons a:nth-child(3) {
	background-color: purple;
	transition: opacity .2s ease-in-out .2s, transform .15s ease-in-out;
}

.adminButtons a:nth-child(4) {
	background-color: green;
	transition: opacity .2s ease-in-out .15s, transform .15s ease-in-out;
}

.adminActions a i {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.adminToggle {
	-webkit-appearance: none;
	position: absolute;
	border-radius: 50%;
	top: 0;
	left: 0;
	margin: 0;
	width: 100%;
	height: 100%;
	cursor: pointer;
	background-color: transparent;
	border: none;
	outline: none;
	z-index: 2;
	transition: box-shadow .2s ease-in-out;
	box-shadow: 0 3px 5px 1px rgba(51, 51, 51, .3);
}

.adminToggle:hover {
	box-shadow: 0 3px 6px 2px rgba(51, 51, 51, .3);
}

.adminToggle:checked ~.adminButtons a {
	opacity: 1;
	visibility: visible;
}
</style>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<!-- ==========Contact Section Starts Here========== -->
	<section class="contact-section padding-top padding-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<img src="public/assets/icons/change-password.jpg"
						style="width: 600px; height: 300px;">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<%
						String message = (String) session.getAttribute("password-change-success");
					if (message != null) {
						session.removeAttribute("password-change-success");
					%>
					<div class='alert alert-success' id='success'>Password change
						successfully.</div>
					<%
						}
					%>
					<%
						String fail = (String) session.getAttribute("password-change-fail");
					if (fail != null) {
						session.removeAttribute("password-change-fail");
					%>
					<div class="alert alert-danger" id='danger'>Old password does
						not match..</div>
					<%
						}
					%>
					<%
						String passwordConfirm = (String) session.getAttribute("password-not-match");
					if (passwordConfirm != null) {
						session.removeAttribute("password-not-match");
					%>
					<div class="alert alert-danger" id='danger'>New password and
						confirm password does not match.</div>
					<%
						}
					%>
					<div class="panel panel-info">
						<div class="panel-heading">Change Password</div>
						<div class="panel-body">
							<form role="form" action="StudentChangePassword" method="post">
								<%
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblstudent where uname='"
										+ session.getAttribute("uname") + "' and email='" + session.getAttribute("email") + "'");
								while (resultset.next()) {
								%>
								<div class="form-group">
									<label>Current Password</label> <input class="form-control"
										type="password" name="cpassword"
										value="<%=resultset.getString("upass")%>" readonly />
								</div>
								<div class="form-group">
									<label>New Password</label> <input class="form-control"
										type="password" name="password" id="password"
										placeholder="New Password" />
								</div>
								<div class="form-group">
									<label>Confirm Password</label> <input class="form-control"
										type="password" name="confpass" id="confpass"
										placeholder="Confirm Password" />
								</div>

								<div class="form-group col-md-6">
									<button type="submit" class="btn btn-info" id="btnValidate"
										style="width: 140px;">Change Password</button>
									<button type="reset" class="btn btn-danger"
										style="width: 80px;">Cancel</button>
								</div>

								<%
									}
								%>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Contact Section Ends Here========== -->


	<!-- ==========Footer Section Starts Here========== -->
	<footer class="bg_img"
		data-background="public/assets/images/footer/footer-bg.jpg">
		<div class="footer-bottom">
			<div class="container">
				<p>&copy;&nbsp;ClubCraft - 2024 All Rights Reserved.</p>
			</div>
		</div>
	</footer>
	<!-- ==========Footer Section Ends Here========== -->
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>

	<script src="public/assets/js/jquery.js"></script>
	<script src="public/assets/js/plugins.js"></script>
	<script src="public/assets/js/bootstrap.bundle.min.js"></script>
	<script src="public/assets/js/progress.js"></script>
	<script src="public/assets/js/magnific-popup.min.js"></script>
	<script src="public/assets/js/wow.min.js"></script>
	<script src="public/assets/js/nice-select.js"></script>
	<script src="public/assets/js/slick.min.js"></script>
	<script src="public/assets/js/main1.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#success').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#warning').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});
	</script>
</body>
</html>

