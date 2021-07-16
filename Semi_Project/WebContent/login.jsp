<!-- 로그인 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- 인코딩 처리 -->    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>       
    
<!DOCTYPE html>
<html lang="en">
<head>
	<title>O_PYUNG</title>
	<meta charset="UTF-8">
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
	
<!-- NAVER LOGIN===================================================================================-->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="login.do?command=login" method="post">
					<span class="login100-form-title p-b-26">
						O-PYUNG
					</span>
					
					<!-- id -->
					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<input class="input100" type="text" name="id">
						<span class="focus-input100" data-placeholder="Id"></span>
					</div>


					<!-- pw -->
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
							<button class="login100-form-btn" type="submit">
								Login
							</button>
						</div>
					</div>
					
					<div class="container-NVlogin-form-btn">
						<div class="wrap-NVlogin-form-btn">
							<div class="NVlogin-form-bgbtn"></div>
							
							<div id="naver_id_login" class="NVlogin-form-btn">NAVER LOGIN</div>
							
							<script type="text/javascript">
								var naver_id_login = new naver_id_login("xeg7vCgB949ezCPPrU5G", "http://localhost:8383/Semi_Project/main.do?command=main");
								var state = naver_id_login.getUniqState();
								naver_id_login.setDomain(".service.com");
								naver_id_login.setState(state);
								naver_id_login.init_naver_id_login();
							</script>
						</div>
					</div>
					<ul class="Test">
						
						
						<li class="look_list">
							<a href="login.do?command=find_id_form" class="look_link">아이디 찾기</a>
						</li>
						<li class="look_list">
							<a href="login.do?command=find_pw_form" class="look_link">비밀번호 찾기</a>
						</li>
						
					</ul>

					<div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>

						<a class="txt2" href="login.do?command=signupform">
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

<!-- NAVER LOGIN CALLBACK==========================================================================-->
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naver_id_login"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("xeg7vCgB949ezCPPrU5G", "http://localhost:8383/Semi_Project/main.do?command=main");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.init_naver_id_login();
</script>
<!-- //네이버아디디로로그인 초기화 Script -->


<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
<script type="text/javascript">
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		alert(naver_id_login.getProfileData('age'));
	}


	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>
<!-- //네이버아디디로로그인 Callback페이지 처리 Script -->

	     <!-- footer 추가 -->
	<%@ include file="./footer/footer.jsp" %>  
</body>
</html>