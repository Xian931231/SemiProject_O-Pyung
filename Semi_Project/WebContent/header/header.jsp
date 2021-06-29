<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./header/header.css">
    <title>Document</title>
	<link rel="stylesheet" type="text/css" href="./img/fontawesome/css/all.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="./header/header.js" defer></script>
</head>
<body>
<div class="header_body">
	<header class="header">
		<a href="">고객센터</a>
		<a href="">마이페이지</a>
		<a href="">로그인</a>
	</header>
	
    <nav class="navbar">
        <div class="navbar_logo">
        <a href="">
        <i class="fab fa-500px"></i>
            testLogo22
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
            <li><a href="#"><span class="navbar_submenu">COMMUNITY</span></a></li>
            <li><a href="#"><span class="navbar_submenu">SHOP</span></a></li>
        </ul>

        
        <a href="#" class="navbar_toogleBtn"><i class="fas fa-bars"></i></a>
    </nav>
</div>
</body>
</html>