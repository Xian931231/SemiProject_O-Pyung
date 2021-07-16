<!-- 관리자 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- 인코딩 처리 -->    
<%
    	request.setCharacterEncoding("UTF-8");
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
    <title>O_PYUNG</title>
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
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

	<!-- 관리자 확인 -->
	<%
		if(role == null ||!role.equals("ADMIN")){
			response.sendRedirect("index.jsp");
		}
	%>
	
	<!-- header 공간 확보 -->
	<div id="header_space" style="background-color: black; width: 100%; height:100px"></div>
 
    
    <div id="main">
        <div id="sidebar">
           <h2 class="side_maintitle"><a href="admin.do?command=admin">ADMIN</a></h2>
            
            <ul class="side_ul">
                <li class="side_li" id="userinfo"><a href="admin.do?command=userInfo">유저정보</a></li>
                <li class="side_li" id="report"><a href="admin.do?command=report">신고</a></li>
                <li class="side_li" id="transactionStatus"><a href="admin.do?command=deal">거래상태</a></li>
                <li class="side_li" id="noticeWrite"><a href="admin_notice.jsp">공지사항</a></li>
            </ul>
        </div>
        	
        
            <div class="content_01">
                
                <h2>유저정보</h2>
                <hr>
                <div id="divsearch">
                    <form action="admin.do" method="post" name='search'>
     				<input type="hidden" name="command" value="search">
                    <input type="submit" value="검색" class="search" id="searchbnt" >
                    
                    <!-- 검색컬럼 -->
                    <select id="searchSelect" name="keyField">
                        <option value="MB_ID">ID</option>
                        <option value="MB_NAME">NAME</option>
                        <option value="MB_EMAIL">EMAIL</option>
                        <option value="MB_PHONE">PHONE</option>
                        <option value="MB_ABLE">BLACK</option>
                      </select>
                    <input type="text" name="keyword"  class="search" id="searchbox" >
					</form>
                </div>
                
                <div class="user_table" >
                    <table border="1">
                        <col width="50px">
                        <col width="400px">
                        <col width="100px">
                        <col width="100px">
                        <col width="150px">
                        <col width="150px">
                        <col width="100px">
                        <col width="150px">
                        <col width="100px">
                        <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>ID</th>
                            <th>PW</th>
                            <th>NAME</th>
                            <th>Email</th>
                            <th>전화번호</th>
                            <th>점수</th>
                            <th>로그인여부</th>
                            <th>블랙</th>
                        </tr>
                        </thead>
                        
                        
                        <tbody>
                        
                        
                        <c:choose>
                        	<c:when test="${empty list }">
                 	       		<tr>
                        			<td colspan="9">-------------등록된 유저가 없습니다.-------------</td>
                        		</tr>
                       		</c:when>
                        <c:otherwise>
                        	<c:forEach var="dto" items="${list }">
                        		<form action="admin.do" method="post">
                        			<input type="hidden" name="command" value="black">
                        			<input type="hidden" name="mb_id" value="${dto.mb_id }">
	                        		<tr>
			                            <td><input type="checkbox"></td>
			                            <td>${dto.mb_id }</td>
			                            <td>${dto.mb_pw }</td>
			                            <td>${dto.mb_name }</td>
			                            <td>${dto.mb_email }</td>
			                            <td>${dto.mb_phone }</td>
			                            <td>${dto.mb_score }</td>
			                            <td><a>${dto.mb_able }</a></td>
			                           
			                            <td>
			                            	<select name="blackStatus">
			                            		<option value="black" <c:if test="${dto.mb_able=='N'}">selected</c:if>>정지</option>
			                            		<option value="cancel" <c:if test="${dto.mb_able=='Y'}">selected</c:if>>해지</option>
			                            	</select>
			                            </td>
			                            <td>
			                            	<input type="submit" value="수정">
			                            </td>
		                        	</tr>
								</form>                        	
                        	</c:forEach>
                        </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
                </div>
                
    

</body>
</html>