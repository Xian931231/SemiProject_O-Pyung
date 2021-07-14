
<!-- 공지사항(고객센터) 페이지 -->

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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>O_PYUNG</title>
	<link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
    <link rel="stylesheet" type="text/css" href="./css/notice.css">
    <script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    $(function() {
        $(".content_02").css("display","none");
        $("#inspection").click(function() {
           $(".content_01").hide();
           $(".content_02").show();

        });
        $("#notice").click(function() {
           $(".content_02").hide();
           $(".content_01").show();

        });
        
    });
    </script>
</head>
<body>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

   	<!-- header 공간 확보 -->
   	<form action="notice.do?command=noticelist" method="post">
	<div id="header_space" style="background-color: black; width: 100%; height: 100px"></div>
    
    <div id="main">
        <div id="sidebar">
            <h2 class="side_maintitle">고객센터</h2>
            
            <ul class="side_ul">
                <li class="side_li" id="notice"><a href="#">공지 사항</a></li>
                <li class="side_li" id="inspection"><a href="#">검수 기준</a></li>
            </ul>
        </div>
        <div id="contents">
            <div class="content_01">
            <h2>
                공지사항
            </h2>
            <hr>
            <ul class="content_ul">
            	<c:choose>
            		<c:when test="${empty list }">
            			<p class="content_li"><strong>작성된 글이 없어요... 곧 올리실거에요</strong></p>
            		</c:when>
            		<c:otherwise>
            			<c:forEach var="dto" items="${list }">
                	<li class="content_li"><a href="notice.do?command=noticedetail&notice_no=${dto.notice_no }">${dto.notice_title }</a></li>
                		</c:forEach>
                	</c:otherwise>
            	</c:choose>
            </ul>
            </div>
            <div class="content_02">
                <h2>검수 기준</h2>
                <hr>
                <ul class="content_ul">
                    <li class="content_li"><a href="notice.do?command=noticecheck">[검수기준] 거래 하기 전, 꼭 봐주세요!</a></li>
                </ul>
            </div>
        </div>
    </div>

	</form>



</body>

	     <!-- footer 추가 -->
	<%@ include file="./footer/footer.jsp" %> 
</html>