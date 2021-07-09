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
    <title>admin_deal</title>
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
                <li class="side_li" id="userinfo"><a href="#">유저정보</a></li>
                <li class="side_li" id="report"><a href="admin_report.jsp">신고</a></li>
                <li class="side_li" id="transactionStatus"><a href="admin_deal.jsp">거래상태</a></li>
                <li class="side_li" id="noticeWrite"><a href="admin_notice.jsp">공지사항</a></li>
            </ul>
        </div>
        	
            <div class="content_03">
            <h2>거래상태 </h2>
            <hr>
            <div class="list_tap">
                <div class="tap_item">
                    <dl>
                        <dt class="tap_title">
                            검수대기
                        </dt>
                        <dd class="tap_count">
                            0
                        </dd>
                    </dl>
                </div>
                <div class="tap_item">
                    <dl>
                        <dt class="tap_title">
                            검수중
                        </dt>
                        <dd class="tap_count">
                            0
                        </dd>
                    </dl>
                </div>
                <div class="tap_item">
                    <dl>
                        <dt class="tap_title">
                            검수완료
                        </dt>
                        <dd class="tap_count">
                            0
                        </dd>
                    </dl>
                </div>
                </div>
            <div class="TS_table">
                <table >
                    <col width="50px">
                    <col width="300px">
                    <col width="100px">
                    <col width="100px">
                    <col width="200px">
                    <col width="150px">
                    <col width="150px">
                    <col width="100px">
                    <col width="50px">
                    <thead>
                    <tr>
                        <th>NO</th>
                        <th>상품</th>
                        <th>판매자</th>
                        <th>구매자</th>
                        <th>거래상태</th>
                        <th>검수시작</th>
                        <th>완료</th>
                        <th>검수자</th>
                        <th>수정</th>
                    </tr>
                    </thead>
                    <tbody>
                    <form action="">
                    <tr class="Ts_tr">
                        <td>1</td>
                        <td>상품title입니다.</td>
                        <td>판매자명</td>
                        <td>구매자명</td>
                        
                        <td><select>
                            <option value="">판매자 발송준비</option>
                            <option value="">검수중</option>
                            <option value="">구매자 발송준비</option>
                        </select></td>
                            
                        <td><input type="date"></td>
                        <td><input type="date"></td>
                        <td>adminID</td>
                        <td><input type="submit" value="수정"></td>
                    </tr>
                </form>
                    </tbody>
                </table>
            </div>
            </div>
            
       

    <div id="footer">푸터 영역입니다.</div>
</body>
</html>