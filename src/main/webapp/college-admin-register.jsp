<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.aj.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html lang="en" class="no-js">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon"
	href="public/assets/images/logo/sport-logo.jpg" type="image/x-icon">
<title>ClubCraft | Admin Account</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
	<div class="login-page bk-img"
		style="background-image: url(admin/img/admin-login-banner.jpg);">
		<div class="form-content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-center text-bold text-light mt-4x">
							<span>ClubCraft </span>College Admin Account
						</h1>
						<%
							String collegeAdminId = DatabaseConnection.generateCollegeAdminId();
						%>
						<div class="well row pt-2x pb-3x bk-light">
							<%
								String success = (String) session.getAttribute("account-success");
								if (success != null) {
									session.removeAttribute("account-success");
							%>
							<div class="alert alert-info" id="info">Account created
								successfully.</div>
							<%
								}
							%>
							<%
								String accountRegister = (String) session.getAttribute("alreadyRegistered");
								if (accountRegister != null) {
									session.removeAttribute("alreadyRegistered");
							%>
							<div class="alert alert-danger" id="danger">Already college admin registered.</div>
							<%
								}
							%>
							<form action="CollegeAdminAccount" method="post">
								<div class="form-row">
									<%-- <div class="form-group col-md-6">
										<label for="adminId" class="text-uppercase text-sm">Admin
											Id</label> <input type="text" name="adminId"
											value="<%=collegeAdminId%>" class="form-control mb"
											style="border: 1px solid #555; color: 1px solid #555;"
											readonly>
									</div> --%>
									<div class="form-group col-md-6">
										<label for="fullname" class="text-uppercase text-sm">Full
											Name</label> <input type="text" placeholder="Admin Full Name"
											name="fullname" id="fullname" class="form-control mb"
											style="border: 1px solid #555;" required onkeypress="return lettersValidate(event)">
									</div>
									<div class="form-group col-md-6">
										<label for="email" class="text-uppercase text-sm">Email
											Id </label> <input type="email" placeholder="Email Id" name="email"
											id="email" class="form-control mb" 
											style="border: 1px solid #555; color: 1px solid #555;"
											required required="" onblur="validateEmail()">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="mobile" class="text-uppercase text-sm">Mobile
											No</label> <input type="text" placeholder="Mobile No" name="mobile"
											id="mobile" class="form-control mb"
											style="border: 1px solid #555;" required onkeypress="return numberValidate(event)" maxlength="10">
									</div>
									<div class="form-group col-md-6">
										<label for="collegeName" class="text-uppercase text-sm">College
											Name </label> <select
											name="collegeName" id="collegeName" class="form-control mb"
											style="border: 1px solid #555; color: 1px solid #555;"
											required>
											<option selected="" value="" disabled="">Select College Name</option>
											<%
												ResultSet resultsetCollege = DatabaseConnection.getResultFromSqlQuery("select college_name from tblcollege");
												while (resultsetCollege.next()) {
											%>
												<option value="<%=resultsetCollege.getString("college_name")%>"><%=resultsetCollege.getString("college_name")%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="password" class="text-uppercase text-sm">Password</label>
										<input type="password" placeholder="Password" name="password"
											id="password" class="form-control mb"
											style="border: 1px solid #555;" required oninput="limitChar(this)"
											maxlength="12">
									</div>
									<div class="form-group col-md-2">
										<label>&nbsp;</label>
										<button class="btn btn-primary btn-block" name="btnValidate"
											type="submit" style="width: 150px;" id="btnValidate">CREATE
											ACCOUNT</button>
									</div>
									<div class="form-group col-md-2">
										<label>&nbsp;</label>
										<button class="btn btn-danger btn-block" name="reset"
											type="reset" style="width: 150px;">CANCEL</button>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-12">
										&nbsp;<a href="index.jsp"
											class="btn btn-info">Back to Home</a> &nbsp; ||&nbsp;<a href="admin-login.jsp">Click Here To College Admin
											Login</a>
									</div>
								</div>
								<br>
							</form>
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
	<script>
		$(document).ready(
				function() {
					$("#btnValidate").click(
							function() {
								var fullname = $("#fullname").val();
								var email = $("#email").val();
								var mobile = $("#mobile").val();
								var collegeName = $("#collegeName").val();
								var password = $("#password").val();
								if (fullname === "" || email === ""
										|| mobile === "" || collegeName === ""
										|| password === "") {
									$("#fullname").css("border-color", "red");
									$("#email").css("border-color", "red");
									$("#mobile").css("border-color", "red");
									$("#collegeName")
											.css("border-color", "red");
									$("#password").css("border-color", "red");

									alert("All Fields Are Mendatory.");
									return false;
								}
							});
				});
	</script>
</body>
</html>