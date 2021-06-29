<!-- 공지사항(고객센터) 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- 인코딩 처리 -->       
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>
    
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
                <li class="content_li"><a href="#">[공지사항]공지사항공지사항</a></li>
                <li class="content_li"><a href="#">[공지사항]공지사항공지사항공지사항공지사항공지사항</a></li>
                
            </ul>
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

    <div id="footer">푸터 영역입니다.</div>
</body>
</html>