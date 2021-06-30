<%@page import="com.opyung.dto.MemberBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
	MemberBoardDto memdto = (MemberBoardDto)session.getAttribute("memdto");
%>

<div class="header_body">
	<link rel="stylesheet" type="text/css" href="./header/header.css">
	<link rel="stylesheet" type="text/css" href="./img/fontawesome/css/all.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="./header/header.js" defer></script>
	

	<header class="header">
		<%
			if(memdto != null){
			
		%>
		<span><%= memdto.getMb_id() %>님</span>
		<%
			}
		%>
		<a href="notice.jsp">고객센터</a>
		<a href="mypage.jsp">마이페이지</a>
		<%
			if(memdto==null){
		%>
		<a href="login.jsp">로그인</a>
		<%
			}else{
		%>
		<a href="controller.do?command=logout">로그아웃</a>
		<%
			}
		%>
	</header>
	
    <nav class="navbar">
        <div class="navbar_logo">
        <a href="main.jsp">
        <img src="img/product/assets/2222.ico">
        <img alt="logo" src="img/product/img/logo.png">
        </a>
        </div>
        
        <div class="navbar_search">
        <form action="" method="post">
        	<ul class="navbar_search_bar">
	        	<li ><i class="fas fa-search"></i></li>
	        	<li class="navbar_search_li"><input type="text"></li>  
        	</ul>      	
        </form>
        </div>
        
        
        <ul class="navbar_menu">
            <li><a href="community.jsp"><span class="navbar_submenu">COMMUNITY</span></a></li>
            <li><a href="shop.jsp"><span class="navbar_submenu">SHOP</span></a></li>
        </ul>

        
        <a href="#" class="navbar_toogleBtn"><i class="fas fa-bars"></i></a>
    </nav>
</div>
</body>
</html>