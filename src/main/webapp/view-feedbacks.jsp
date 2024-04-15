<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.aj.connection.*"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>ClubCraft | View Feedbacks</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon"
	href="public/assets/images/logo/sport-logo.jpg" type="image/x-icon">
<meta charset="UTF-8" />
<meta name="keywords"
	content="Tennis Hub Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>

<!--// Meta tag Keywords -->

<!-- css files -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.css">
<!-- Font-Awesome-Icons-css -->
<!-- lightbox -->
<link rel="stylesheet" href="css/chocolat.css" type="text/css"
	media="all">
<!-- Popup css (for Video Popup) -->
<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- style css -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all">
<!-- //css files -->
<!-- web-fonts -->
<link
	href="//fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<!-- //web-fonts -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
</head>

<body>
	<!-- header -->
	<div class="header">
		<div class="header-left">
			<div class="container">
				<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<div class="logo">
							<h1>
								<a href="index.jsp"> ClubCraft </a>
							</h1>
						</div>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse nav-wil"
						id="bs-example-navbar-collapse-1">
						<nav class="link-effect-9" id="link-effect-9">
							<ul class="nav navbar-nav">
								<li class="active"><a
									class="hvr-overline-from-center scroll" href="index.jsp">Home</a>
								</li>
								<li><a href="#about"
									class="hvr-overline-from-center scroll">About Us</a></li>
								<!-- <li><a href="#gallery"
									class="hvr-overline-from-center scroll">Gallery</a></li> -->
								<li><a href="#contact"
									class="hvr-overline-from-center scroll">Contact Us</a></li>
								<li><a href="student-login.jsp">Student Login</a></li>
								<li><a href="admin-login.jsp">College Admin Login</a></li>
								<li><a href="view-feedbacks.jsp"> View Feedbacks</a></li>
							</ul>
						</nav>
					</div>
					<!-- /.navbar-collapse -->
				</nav>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- //header -->
	<!-- welcome -->
	<div class="about" id="about">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h3 class="header-line">View Feedbacks</h3>
				</div>
			</div><br>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-info">
						<div class="panel-body">
							<%
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblfeedback");
								while (resultset.next()) {
							%>
							<div class="form-group">
								<label>Student Name : </label> <font color="orange"><%=resultset.getString("student_name")%></font>
							</div>
							<div class="form-group">
								<label>Feedback : </label> <font color="orange"><%=resultset.getString("description")%></font>
							</div>
							<div class="form-group">
								<label>Feedback Date : </label>
								<%=resultset.getString("created_at")%>
							</div>
							<div class="form-row">
								<div class="rateyo" id="rating"
									data-rateyo-rating="<%=resultset.getString("ratings")%>"
									data-rateyo-num-stars="5" data-rateyo-score="3" readonly></div>
								<input type="hidden" name="rating" readonly>
							</div>
							<hr>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //welcome -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-xs-6 agileinfo_footer_grid">
				<h4>About Us</h4>
				<p>Every dream needs to be driven by passion to make it come
					true. ClubCraft is one such dream, formed by keeping sheer passion
					for the sports community. We have design this project very
					passionately.</p>
			</div>
			<div class="col-xs-6 agileinfo_footer_grid">
				<h4>Contact with us</h4>
				<ul>
					<li><span class="glyphicon glyphicon-home" aria-hidden="true"></span>
						ClubCraft</li>
					<li><span class="glyphicon glyphicon-envelope"
						aria-hidden="true"></span> <a href="mailto:clubcraft@gmail.com">clubcraft@gmail.com</a>
					</li>
					<li><span class="glyphicon glyphicon-earphone"
						aria-hidden="true"></span> (+91)- 0000000000</li>
					<li><span class="glyphicon glyphicon-time" aria-hidden="true"></span>
						Mon-Sat 09:00 AM - 05:00PM</li>
				</ul>
			</div>
			<div class="clearfix"></div>
			<div class="w3agile_footer_copy">
				<p>
					© 2024 ClubCraft. All rights reserved | Design by <a
						href="http://clubcraft.com/">ClubCraft</a>
				</p>
			</div>
		</div>
	</div>
	<!-- //footer -->


	<!-- js-scripts -->
	<!-- jquery -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<!-- Necessary-JavaScript-File-For-Bootstrap -->

	<!-- banner Slider -->
	<script src="js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function() {
			// Slideshow 4
			$("#slider3").responsiveSlides({
				auto : true,
				pager : true,
				nav : false,
				speed : 500,
				namespace : "callbacks",
				before : function() {
					$('.events').append("<li>before event fired.</li>");
				},
				after : function() {
					$('.events').append("<li>after event fired.</li>");
				}
			});

		});
	</script>
	<!-- //banner Slider -->

	<!-- Numscroller -->
	<script src="js/numscroller-1.0.js"></script>
	<!-- //Numscroller -->

	<!-- pop-up(for video popup)-->
	<script src="js/jquery.magnific-popup.js"></script>
	<script>
		$(document).ready(function() {
			$('.popup-with-zoom-anim').magnificPopup({
				type : 'inline',
				fixedContentPos : false,
				fixedBgPos : true,
				overflowY : 'auto',
				closeBtnInside : true,
				preloader : false,
				midClick : true,
				removalDelay : 300,
				mainClass : 'my-mfp-zoom-in'
			});

		});
	</script>
	<!-- //pop-up-box (syllabus section video)-->

	<!-- lightbox -->
	<script src="js/jquery.chocolat.js"></script>
	<link rel="stylesheet" href="css/chocolat.css" type="text/css"
		media="screen">
	<!--light-box-files -->
	<script>
		$(function() {
			$('.gallery-grid a').Chocolat();
		});
	</script>
	<!-- //lightbox -->

	<!-- smoothscroll -->
	<script src="js/SmoothScroll.min.js"></script>
	<!-- //smoothscroll -->

	<!-- start-smooth-scrolling -->
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<script>
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->

	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			 */
			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
	<script>
		$(function() {
			$(".rateyo").rateYo()
					.on(
							"rateyo.change",
							function(e, data) {
								var rating = data.rating;
								$(this).parent().find('.score').text(
										'score :'
												+ $(this).attr(
														'data-rateyo-score'));
								$(this).parent().find('.result').text(
										'rating :' + rating);
								$(this).parent().find('input[name=rating]')
										.val(rating); //add rating value to input field
							});
		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->
	<!-- //js-scripts -->
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
</body>
</html>