<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<link rel="stylesheet" href="./css/find_id.css"/>

</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="login.do?command=find_pw" method="post">
					<span class="login100-form-title p-b-26">
						비밀번호 찾기
					</span>
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<input class="input100" type="text" name="id">
						<span class="focus-input100" data-placeholder="Id"></span>
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
							<div class="login100-form-bgbtn">
								<input type="submit" class="login100-form-btn" value="NEXT">
							</div>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>