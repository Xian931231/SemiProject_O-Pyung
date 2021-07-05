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
    <title>오늘도 평화로운</title>
    <link rel="icon" type="image/png" href="./img/notice/111.ico"/>
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
   	<form action="notice.do?command=noticeBoard" method="post">
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
               <div class="content_detail">
                    
               <div class="content_date">2021.07.21</div>
                    
               <div class="content_title">[이벤트 발표] 썸머 게릴라 드로우 - 이지 슬라이드 3종 & 이지 폼러너 3종]</div>
                    
               <div class="content_content">
           <p>안녕하세요. kream입니다. 니난 3개월 동안 진행중이던 윤경덕 님의 상수 쇼룸 전시가 오늘을 끝으로 마무리됩니다.
                            전시 작품 철수 밑 다음 전시 준비 기간 동안 쇼룸 운영이 중단될 예정이오니 참고 부탁드립니다.
                            감사합니다.</p>
                    </div>
                </div>
            </div>
            <div class="content_02">
                <h2>검수 기준</h2>
                <hr>
                <ul class="content_ul">
                    <li class="content_li"><a href="#">[검수기준]검수기준</a></li>
                    <li class="content_li"><a href="#">[검수기준]검수기준검수기준검수기준검수기준검수기준</a></li>
                </ul>
            </div>
        </div>
    </div>

	</form>

    <div id="footer">푸터 영역입니다.</div>
</body>
</html>
</body>
</html>