<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<title>O_PYUNG</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./css/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./css/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./css/login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./css/login/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./css/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./css/login/util.css">
	<link rel="stylesheet" type="text/css" href="./css/login/main.css">
<!--===============================================================================================-->
	
</head>
<body>
	

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="login.do?command=find_id" method="post">
					<span class="login100-form-title p-b-26">
						아이디 찾기
					</span>
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<input class="input100" type="text" name="name">
						<span class="focus-input100" data-placeholder="Name"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">

						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>

						
						<input class="input100" type="text" name="phone">
						
						<span class="focus-input100" data-placeholder="Phone Number"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" class="login100-form-btn">
								NEXT
							</button>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	
	<div id="dropDownSelect1"></div>
	
	
		
<!--===============================================================================================-->
	<script src="./jQuery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="./css/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="./css/login/vendor/bootstrap/js/popper.js"></script>
	<script src="./css/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="./css/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="./css/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="./css/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="./css/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="./js/login.js"></script>
</body>
</html>