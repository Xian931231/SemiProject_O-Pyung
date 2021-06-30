<!-- 로그인 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- 인코딩 처리 -->    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>       
    
<!DOCTYPE html>
<html lang="en">
<head>
	<title>오늘도 평화로운</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="./img/icons/111.ico"/>
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
				<form class="login100-form validate-form" action="controller.do?command=login" method="post">
					<span class="login100-form-title p-b-26">
						O-PYUNG
					</span>
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<input class="input100" type="text" name="id">
						<span class="focus-input100" data-placeholder="Id"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="pw">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>
					<div class="container-NVlogin-form-btn">
						<div class="wrap-NVlogin-form-btn">
							<div class="NVlogin-form-bgbtn"></div>
							<button class="NVlogin-form-btn">
								NAVER Login
							</button>
						</div>
					</div>
					<ul class="Test">
						
						
						<li class="look_list">
							<a href="" class="look_link">이메일 찾기</a>
						</li>
						<li class="look_list">
							<a href="" class="look_link">비밀번호 찾기</a>
						</li>
						
					</ul>

					<div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>

						<a class="txt2" href="#">
							Sign Up
						</a>
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