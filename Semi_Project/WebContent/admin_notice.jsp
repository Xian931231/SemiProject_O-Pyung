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
    <title>O_PYUNG</title>
    <link rel="stylesheet" type="text/css" href="./css/adminpage.css">
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
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
 
 	<!-- 관리자 확인 -->
	<%
		if(role == null ||!role.equals("ADMIN")){
			response.sendRedirect("index.jsp");
		}
	%>
 
    
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
        	
            <!-- 공지사항 글쓰기 -->
       <div class="content_04" style="margin-top: 50px">
       <form action="notice.do" method="post">
       <input type="hidden" name="command" value="noticewrite">
      
            	
       <h2>공지사항 글쓰기</h2>
       
       <hr>
       <br>
            	
        <div class="noticeBoard">
		<table style="border: 0">
			<tr>
				<th style="height: 50px;border: 0; font-weight: 150px">게시글 제목</th>
				<td style="border: 0"><input type="text" name="title" style="width: 990px; height: 40px; font-size: 16px" placeholder="제목을 입력해주세요" ></td>
			</tr>
			<tr>
				<th style="border: 0">내용</th>
				<td style="border: 0"><textarea name="content" id="ckeditor4"></textarea>
				<script type="text/javascript">
 					CKEDITOR.replace('ckeditor4'
                					, {height: 500});
				</script>
				</td>
			</tr>
		</table>
			
			<div class="boardsubmit">
			<input class="submit_btn" type="submit" value="작성">
    		</div>
    </div>
	  </form>
     </div>  
       
        </div>
        
    

</body>
</html>