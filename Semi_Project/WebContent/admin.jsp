<!-- 관리자 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- 인코딩 처리 -->    
<%
    	request.setCharacterEncoding("UTF-8");
    %>    
<%
    	response.setContentType("text/html; charset=UTF-8");
    %>    
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%@ page import="com.opyung.dto.MemberDto" %>
 
 <%@ page import = "java.util.List" %>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin_main</title>
    <link rel="stylesheet" type="text/css" href="./css/adminpage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src = "./ckeditor/ckeditor.js"></script>
    
    <script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
   
    	
    </script>
</head>
<body>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

	<!-- header 공간 확보 -->
	<div id="header_space" style="background-color: black; width: 100%; height:100px"></div>
 
    
    <div id="main">
        <div id="sidebar">
           <h2 class="side_maintitle">ADMIN</h2>
            
            <ul class="side_ul">
                <li class="side_li" id="userinfo"><a href="admin.do?command=userInfo">유저정보</a></li>
                <li class="side_li" id="report"><a href="#">신고</a></li>
                <li class="side_li" id="transactionStatus"><a href="#">거래상태</a></li>
                <li class="side_li" id="noticeWrite"><a href="admin_notice.jsp">공지사항</a></li>
            </ul>
        </div>
        	<div class="content_main">
        		                <!--신고-->
                <div class="tit">
                    <div>
                        <h3>신고 내역</h3>
                    </div>
                    <div class="add">
                        <a class="add_text" id="addbnt1">더보기 ></a>
                    </div>
                </div>

                <!-- 신고 표-->
                <div id="buy">
                    <div class="table">
                        <div class="item">
                            <dl>
                                <dt class="title">전체</dt>
                                <dd class="count" id="count_buy_all">0</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">진행 중</dt>
                                <dd class="count">0</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">종료</dt>
                                <dd class="count">0</dd>
                            </dl>
                        </div>
                    </div>
                    <!--거래 내역-->
                    <div>
                        <div class="empty_area">
                            <p class="empty">신고 내역이 없습니다.</p>
                        </div>
                    </div>
                </div>

                <!--거래진행 상태-->
                <div class="tit">
                    <div>
                        <h3>거래 상태</h3>
                    </div>
                    <div class="add">
                        <a class="add_text" id="addbnt2" >더보기 ></a>
                    </div>
                </div>

                <!--거래진행 상태-->
                <div id="sell">
                    <div class="table">
                        <div class="item">
                            <dl>
                                <dt class="title">전체</dt>
                                <dd class="count" id="count_sell_all">0</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">진행 중</dt>
                                <dd class="count">0</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">종료</dt>
                                <dd class="count">0</dd>
                            </dl>
                        </div>
                    </div>
                    <!--거래 내역-->
                    <div>
                        <div class="empty_area" id="empty_area_selling">
                            <p class="empty">거래 내역이 없습니다.</p>
                        </div>
                    </div>
                </div>
        		
        	</div>
        
           
        
    

    <div id="footer">푸터 영역입니다.</div>
</body>
</html>