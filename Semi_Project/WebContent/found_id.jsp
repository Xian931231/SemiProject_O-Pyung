<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.opyung.dto.MemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel = "stylesheet" href="./css/find_id.css">
</head>
<body>


<% 
	MemberDto dto = (MemberDto)session.getAttribute("dto");
%>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-26">
						[아이디]
					</span>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<a class="login100-form-btn" href="http://localhost:8383/Semi_Project/login.jsp">
								Re-Login
							</a>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>