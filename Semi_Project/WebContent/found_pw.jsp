<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘도 평화로운</title>

	<link rel="stylesheet" href="./css/found.css"/>
	
	<link rel="icon" type="image/png" href="./img/icons/111.ico"/>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="login.do?command=login" method="post">
					<span class="login100-form-title p-b-26">
						사용자의 비밀번호는 ${find_pw } 입니다.
					</span>
				
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Re-Login
							</button>
							<div class="login100-form-bgbtn">
								<a class="login100-form-btn" href="main.do?command=login">
									
								</a>
							</div>
						</div>
					</div>
	
				</form>
			</div>
		</div>
	</div>
</body>
</html>