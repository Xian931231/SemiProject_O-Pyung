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
    <title>admin_report</title>
    <link rel="stylesheet" type="text/css" href="./css/adminpage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src = "./ckeditor/ckeditor.js"></script>
    
    <script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    $(function() {
    	
        
        $("#bl_btn").click(function(){
           var con = confirm("정말 블랙처리 하시겠습니까?");
           if(con = true){
               alert("블랙처리되었습니다.");
           }else {
               alert("취소되었습니다.");
           }
        });
      
    });
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
                <li class="side_li" id="userinfo"><a href="#">유저정보</a></li>
                <li class="side_li" id="report"><a href="#">신고</a></li>
                <li class="side_li" id="transactionStatus"><a href="#">거래상태</a></li>
                <li class="side_li" id="noticeWrite"><a href="#">공지사항</a></li>
            </ul>
        </div>
        	
                <div class="content_02">
                    
                    <h2>신고</h2>
                    <hr>
                    <div class="list_tap">
                    <div class="tap_item">
                        <dl>
                            <dt class="tap_title">
                              	  신고처리
                            </dt>
                            <dd class="tap_count">
                                0
                            </dd>
                        </dl>
                    </div>
                    <div class="tap_item">
                        <dl>
                            <dt class="tap_title">
                                	처리완료
                            </dt>
                            <dd class="tap_count">
                                0
                            </dd>
                        </dl>
                    </div>
                    </div>
                    <div class="user_table" >
                        <table border="1">
                            <col width="50px">
                            <col width="450px">
                            <col width="150px">
                            <col width="150px">
                            <col width="150px">
                            <col width="150px">
                            
                            <thead>
                            <tr>
                                <th>NO</th>
                                <th>신고사유</th>
                                <th>신고자</th>
                                <th>신고대상자</th>
                                <th>신고날짜</th>
                                <th>처리상태</th>
                                
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>이 새끼 사기꾼입니다!!!!</td>
                                <td>착한사람</td>
                                <td>개새끼</td>
                                <td>2021.06.28</td>
                                <td><select class="dd">
                                    <option value="">정상</option>
                                    <option value="">블랙</option>
                                    
                                </select><input type="submit" value="처리" id="aa"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            
    <div id="footer">푸터 영역입니다.</div>
</body>
</html>