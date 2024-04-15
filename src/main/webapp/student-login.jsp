<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.aj.connection.*"%>
<%@ page import="java.sql.*"%>
<html lang="en">


<!-- Mirrored from www.saraikids.com/contact by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 01 Feb 2024 11:56:14 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>ClubCraft | Student Login</title>

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
		<div class="header-bottom">
			<div class="container">
				<div class="header-wrapper">
					<div class="logo m-2">
						<a href="index.jsp">
							<h1>ClubCraft</h1>
						</a>
					</div>
					<div class="menu-area">
						<ul class="menu">
							<li><a href="index.jsp"><i class="fas fa-home"></i>Home</a>
							</li>
							<li><a href="student-login.jsp"><i class="fas fa-user"></i>Student
									Login</a></li>
							<li><a href="admin-login.jsp"><i class="fas fa-user"></i>College
									Admin Login</a></li>
						</ul>
						<div class="header-bar d-lg-none">
							<span></span> <span></span> <span></span>
						</div>
						<div class="ellepsis-bar d-lg-none">
							<i class="fas fa-ellipsis-h"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
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

	<!-- ==========Contact Section Starts Here========== -->
	<section class="contact-section padding-top padding-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<img src="public/assets/images/logo/student-login-logo-sport.jpg">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-info shadow p-6 mb-8">
						<div class="panel-heading">Student Login</div>
						<div class="panel-body">
							<%
								String credential = (String) session.getAttribute("credential");
								if (credential != null) {
									session.removeAttribute("credential");
							%>
							<div class="alert alert-danger" id="danger">You have enter
								wrong credentials.</div>
							<%
								}
							%>
							<%
								String activation = (String) session.getAttribute("account-activation");
								if (activation != null) {
									session.removeAttribute("account-activation");
							%>
							<div class="alert alert-warning" id="warning">Account not
								activated please inform your college admin to activate account.</div>
							<%
								}
							%>
							<%
								String captchaCode = (String) session.getAttribute("verificationCode");
								if (captchaCode != null) {
									session.removeAttribute("verificationCode");
							%>
							<div class="alert alert-info" id="info">You have enter
								wrong verification code.</div>
							<%
								}
							%>
							<form action="StudentLogin" method="post">
								<div class="form-group">
									<label>User Name OR Email Id</label> <input
										class="form-control" type="text" name="uname"
										placeholder="User Name OR Email Id" />
								</div>
								<div class="form-group">
									<label>Password</label> <input class="form-control"
										type="password" name="upass" placeholder="Password" />
								</div>
								<%
									String captcha = null;
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select captcha from tblcaptcha");
									if (resultset.next()) {
										captcha = resultset.getString(1);
									}
								%>
								<div class="form-group">
									<label>Enter Verification Code</label> <input type="text"
										name="vercode" class="form-control"
										placeholder="Enter Verification Code Here" />
								</div>
								<div class="form-group">
									<label>Verification Code</label> <input type="text"
										value="<%=captcha%>" class="form-control"
										style="width: 180px;" readonly />
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-info"
										style="width: 150px;">Login</button>
									<button type="reset" class="btn btn-danger"
										style="width: 150px;">Cancel</button>
								</div>
								<div class="form-group">
									<a class="for-pwd" href="student-register.jsp">New Student
										Register</a>&nbsp;||&nbsp;<a class="for-pwd"
										href="student-forgot-password.jsp">Forgot your password?</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Contact Section Ends Here========== -->
	<style>
.modal-button {
	padding: 2px 20px 2px 20px;
	font-weight: bold;
}

.email {
	border: 1px solid black;
	background: white;
}
</style>
	<!-- ==========Footer Section Starts Here========== -->
	<footer class="bg_img"
		data-background="public/assets/images/footer/footer-bg.jpg">
		<div class="footer-bottom">
			<div class="container">
				<p>&copy;ClubCraft - 2024 All Rights Reserved.</p>
			</div>
		</div>
	</footer>
	<!-- ==========Footer Section Ends Here========== -->

	<script src="public/assets/js/jquery.js"></script>
	<script src="public/assets/js/plugins.js"></script>
	<script src="public/assets/js/bootstrap.bundle.min.js"></script>
	<script src="public/assets/js/progress.js"></script>
	<script src="public/assets/js/magnific-popup.min.js"></script>
	<script src="public/assets/js/wow.min.js"></script>
	<script src="public/assets/js/nice-select.js"></script>
	<script src="public/assets/js/slick.min.js"></script>
	<script src="public/assets/js/main1.js"></script>
</body>
</html>

