<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 인코딩처리 -->
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	alert("해당하는 아이디가 없습니다. 다시 로그인 해주세요!")
	location.href="main.do?command=login";

</script>


<%  %>



</head>
<body>

</body>
</html>