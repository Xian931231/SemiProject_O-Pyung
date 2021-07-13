<!-- header 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인코딩처리 -->
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.opyung.dto.MemberDto"%>


<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<link rel="stylesheet" type="text/css" href="./header/header.css">
	<link rel="stylesheet" type="text/css" href="./img/fontawesome/css/all.css">
	<script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
	<script src="./header/header.js" defer></script>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	String role = (String)session.getAttribute("role");
	System.out.print(role);
%>

<div class="header_body">
	

	<header class="header">
		<%
			if(id != null){
			
		%>
		<span><%=id %>님</span>
		<%
			}
		%>
		<c:if test="${role eq 'ADMIN' }">
			<a href="admin.do?command=admin">관리자 페이지</a>
		</c:if>
		
		<a href="notice.do?command=noticelist">고객센터</a>
		<a href="memberinfo.do?command=mypage&id=${id }">마이페이지</a>
		<%
			if(id == null){
		%>
		<a href="main.do?command=login">로그인</a>
		<%
			}else{
		%>
		<a href="login.do?command=logout">로그아웃</a>
		<%
			}
		%>
	</header>
	
    <nav class="navbar">
        <div class="navbar_logo">
        <a href="main.do?command=main">
        <img src="img/product/assets/2222.ico">
        <img alt="logo" src="img/product/img/logo.png">
        </a>
        </div>
        
        <div class="navbar_search">
        <form action="product.do?command=search" method="post">
        	<ul class="navbar_search_bar">
	        	<li ><i class="fas fa-search"></i></li>
	        	<li class="navbar_search_li"><input type="text" name="searchVal"></li>  
        	</ul>      	
        </form>
        </div>
        
        
        <ul class="navbar_menu">
            <li><a href="community.do?command=commu"><span class="navbar_submenu">COMMUNITY</span></a></li>
            <li><a href="product.do?command=shop"><span class="navbar_submenu">SHOP</span></a></li>
        </ul>

        
        <a href="#" class="navbar_toogleBtn"><i class="fas fa-bars"></i></a>
    </nav>
</div>
</body>
</html>