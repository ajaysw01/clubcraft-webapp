<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title data-react-helmet="true">ClubCraft | Student Dashboard</title>
<meta data-react-helmet="true" name="description"
	content="Saraikids is the best preschool in Punawale that offers early childhood education to children between the ages of 2 to 6 years. The preschool aims to provide a safe, nurturing, and stimulating environment where children can learn and grow through play and exploration.">
<meta data-react-helmet="true" name="robots" content="index, follow">
<meta data-react-helmet="true" property="og:type"
	content="First Sport's Kids Preschool in Punawale - Saraikids">
<meta data-react-helmet="true" property="og:url" content="index.html">
<meta data-react-helmet="true" property="og:title"
	content="First Sport's Kids Preschool in Punawale - Saraikids">
<meta data-react-helmet="true" property="og:description"
	content="Saraikids is the best preschool in Punawale that offers early childhood education to children between the ages of 2 to 6 years. The preschool aims to provide a safe, nurturing, and stimulating environment where children can learn and grow through play and exploration.">
<meta property="og:image" content="public/assets/images/logo/logo.png">
<meta name="googlebot" content="all" />
<meta name="geo.placename" content="India" />
<link rel="canonical" href="student-dashboard.jsp">

<link rel="stylesheet" href="public/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="public/assets/css/all.min.css">
<link rel="stylesheet" href="public/assets/css/animate.css">
<link rel="stylesheet" href="public/assets/css/nice-select.css">
<link rel="stylesheet" href="public/assets/css/magnific-popup.css">
<link rel="stylesheet" href="public/assets/css/flaticon.css">
<link rel="stylesheet" href="public/assets/css/main.css">
<link rel="stylesheet" href="public/assets/css/custom.css">
<script src="http://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="shortcut icon"
	href="public/assets/images/logo/sport-logo.jpg" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
						<li><a href="" target=""><i class="fab fa-facebook"></i></a></li>
						<li><a href="" target=""><i class="fab fa-instagram"></i></a></li>

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
	<style>
.news {
	background-color: purple;
	color: white;
	padding: 20px;
}

.news h3 {
	color: white;
}

.marquee {
	font-size: 25px;
}

#slider {
	position: relative;
	width: 500px;
	height: 265px;
	overflow: hidden;
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.3);
}
</style>


	<!--CSS 
Add slick.css in your <head>
-->
	<link rel="stylesheet" type="text/css"
		href="../cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.min.css">
	<link rel="stylesheet" type="text/css"
		href="../cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.min.css">
	<link rel="stylesheet"
		href="../cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!--JS
Add slick.js before your closing <body> tag, after jQuery (requires jQuery 1.7 +)
-->
	<script src="../code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script
		src="../cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.min.js"></script>
	<!-- ==========Banner Section Starts Here========== -->
	<section class="banner-section" style="background-color: white">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-12"></div>
				<div class="col-md-8 col-sm-8 col-xs-12">
					<p>
					<h2>Welcome Student Portal</h2>
					</p>
					<br>
					<br>
					<p>
					<h3>
						<a href="student-tournament-registration.jsp">Tournament
							Registration</a>
					</h3>
					</p>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-12"></div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</section>
	<footer class="bg_img"
		data-background="public/assets/images/footer/footer-bg.jpg">
		<div class="footer-bottom">
			<div class="container">
				<p>&copy;&nbsp;ClubCraft - 2024 All Rights Reserved.</p>
			</div>
		</div>
	</footer>
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
