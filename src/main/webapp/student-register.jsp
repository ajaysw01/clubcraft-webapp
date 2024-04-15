<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.aj.connection.*"%>
<html lang="en">


<!-- Mirrored from www.saraikids.com/contact by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 01 Feb 2024 11:56:14 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>ClubCraft | Student Account</title>

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
					<img
						src="public/assets/images/logo/student-register-sport-logo.jpg">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-info shadow p-6 mb-8">
						<div class="panel-heading">Student Account</div>
						<%
							String studentId = DatabaseConnection.generateStudentId();
						%>
						<div class="panel-body">
							<%
								String register = (String) session.getAttribute("message");
							if (register != null) {
								session.removeAttribute("message");
							%>
							<div class="alert alert-success" id="success">Student
								account created successfully.</div>
							<%
								}
							%>
							<form action="StudentAccount" method="post"
								enctype="multipart/form-data">
								<div class="form-row">
									<div class="form-group col-md-6">
										<label>Student Id</label> <input class="form-control"
											type="text" name="sid" value="<%=studentId%>"
											placeholder="Student Id" readonly />
									</div>
									<div class="form-group col-md-6">
										<label>Student Name</label> <input class="form-control"
											type="text" name="sname" id="sname"
											placeholder="Student Name"
											onkeypress="return lettersValidate(event)" />
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label>Email Id</label> <input class="form-control"
											type="email" name="email" id="email" placeholder="Email Id"
											required="" onblur="validateEmail()"/>
									</div>
									<div class="form-group col-md-6">
										<label>Mobile No</label> <input class="form-control"
											type="text" name="mobile" id="mobile" placeholder="Mobile No"
											onkeypress="return numberValidate(event)" maxlength="10" />
									</div>
									<span id="emailError" style="color: red;"></span>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label>Course</label> <input class="form-control" type="text"
											name="course" placeholder="Course" id="course"
											onkeypress="return lettersValidate(event)" />
									</div>
									<div class="form-group col-md-6">
										<label>Date of Birth</label> <input class="form-control"
											type="date" name="dob" id="dob" placeholder="Date of Birth" />
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-12">
										<label>Address</label>
										<textarea class="form-control" type="text" name="address"
											placeholder="Address" id="address"></textarea>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label>User Name</label> <input class="form-control"
											type="text" name="uname" id="uname" placeholder="User Name" />
									</div>
									<div class="form-group col-md-6">
										<label>Password</label> <input class="form-control"
											type="password" name="upass" id="upass"
											placeholder="Password" oninput="limitChar(this)"
											maxlength="12" />
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-12">
										<label>College Name</label> <select class="form-control"
											name="collegeName" id="collegeName" required>
											<option selected="" value="" disabled="">Select
												College Name</option>
											<%
												ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select college_name from tbladmin where college_name!='Admin'");
												while (resultset.next()) {
											%>
											<option value="<%=resultset.getString("college_name")%>"><%=resultset.getString("college_name")%></option>
											<%
												}
											%>
										</select>
									</div>

								</div>
								<div class="form-row">
									<div class="form-group col-md-12">
										<label>Select Game</label> <select class="form-control"
											name="gameName" id="gameName" required>
											<option selected="" value="" disabled="">Select
												Game</option>
											<%
												ResultSet resultsetGames = DatabaseConnection.getResultFromSqlQuery("select game_name from tblgames");
												while (resultsetGames.next()) {
											%>
											<option value="<%=resultsetGames.getString("game_name")%>"><%=resultsetGames.getString("game_name")%></option>
											<%
												}
											%>
										</select>
									</div>

								</div>
								<div class="form-row">
									<div class="form-group col-md-12">
										<label>Photo</label> <input class="form-control" type="file"
											name="photo" id="photo" />
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<button type="submit" class="btn btn-info"
											style="width: 100px;" id="btnValidate">Register</button>
										&nbsp;
										<button type="reset" class="btn btn-danger"
											style="width: 100px;">Cancel</button>
									</div>
									<div class="form-group col-md-6">
										<a href="student-login.jsp">Already account! Please Login</a>
									</div>
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
	<script type="text/javascript">
		let limitChar = (element) => {
	        const maxChar = 12;
	        
	        let ele = document.getElementById(element.id);
	        let charLen = ele.value.length;
	        
	        let p = document.getElementById('charCounter');
	        p.innerHTML = maxChar - charLen + ' characters remaining';
	        
	        if (charLen > maxChar) 
	        {
	            ele.value = ele.value.substring(0, maxChar);
	            p.innerHTML = 0 + ' characters remaining'; 
	        }
	    }
		let limitNumber = (element) => {
	        const maxNumber = 6;
	        
	        let ele = document.getElementById(element.id);
	        let numberLen = ele.value.length;
	        
	        let p = document.getElementById('numberCounter');
	        p.innerHTML = maxNumber - numberLen + ' number remaining';
	        
	        if (numberLen > maxNumber) 
	        {
	            ele.value = ele.value.substring(0, maxNumber);
	            p.innerHTML = 0 + ' number remaining'; 
	        }
	    }
		function lettersValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 64 && keycode < 91) || (keycode > 96 && keycode < 123) || keycode == 32)  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	}    
	    }
		function numberValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 47 && keycode < 58))  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	} 
	    }
	</script>
	<script>
        function validateEmail() {
            var email = document.getElementById("email").value;
            var pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (pattern.test(email)) {
                document.getElementById("emailError").innerHTML = "";
                return true;
            } else {
                document.getElementById("emailError").innerHTML = "Invalid email address";
                return false;
            }
        }

        function clearError() {
            document.getElementById("emailError").innerHTML = "";
        }
    </script>
	<script>
		$(document).ready(
				function() {
					$("#btnValidate").click(
							function() {
								var sname = $("#sname").val();
								var email = $("#email").val();
								var mobile = $("#mobile").val();
								var course = $("#course").val();
								var dob = $("#dob").val();
								var address = $("#address").val();
								var uname = $("#uname").val();
								var upass = $("#upass").val();
								var collegeName = $("#collegeName").val();
								var photo = $("#photo").val();
								var gameName=$("#gameName").val();
								if (sname === "" || email === ""
										|| mobile === ""
										|| course === "" || dob === ""
										|| address === "" || uname === ""
										|| upass === "" || collegeName === ""
										|| gameName === "" || photo === "") {
									$("#sname").css("border-color", "red");
									$("#email").css("border-color", "red");
									$("#mobile").css("border-color","red");
									$("#course").css("border-color", "red");
									$("#dob").css("border-color", "red");
									$("#address").css("border-color", "red");
									$("#uname").css("border-color", "red");
									$("#upass").css("border-color", "red");
									$("#collegeName").css("border-color", "red");
									$("#gameName").css("border-color", "red");
									$("#photo").css("border-color", "red");
									alert("All Fields Are Mendatory.");
									return false;
								}
							});
				});
	</script>
</body>
</html>

