<!-- 관리자 페이지 -->

<%@page import="com.opyung.dto.DealBoardDto"%>
<%@page import="sun.security.util.Length"%>
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
 <%@ page import="com.opyung.dto.DealBoardDto" %>
 
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
   $(function() {
       $("#selecting").css("display","none");
       $("#selectgo").css("display","none");
       $("#ingShow").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"373px"});
       $("#goShow").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"373px"});
       $("#readyShow").click(function() {
           $("#selectready").show();
           $("#selecting").hide();
           $("#selectgo").hide();
            
           $("#ingShow").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"373px"});
           $("#goShow").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"373px"});
           $("#readyShow").css("background-color","whitesmoke");
        });
       $("#ingShow").click(function() {
          $("#selectready").hide();
          $("#selectgo").hide();
          $("#selecting").show();
           
          $("#readyShow").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"373px"});
          $("#goShow").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"373px"});
          $("#ingShow").css("background-color","whitesmoke");
       });
       $("#goShow").click(function() {
           $("#selectready").hide();
           $("#selecting").hide();
           $("#selectgo").show();
            
           $("#readyShow").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"373px"});
           $("#ingShow").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"373px"});
           $("#goShow").css("background-color","whitesmoke");
        });
       
   });
    	
    </script>
</head>
<body>
	<% DealBoardDto dto = new DealBoardDto(); %>



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
        	
            <div class="content_03">
            <h2>거래상태 </h2>
            <hr>
            <div class="list_tap">
                <div class="tap_item" id="readyShow">
                    <dl>
                        <dt class="tap_title">
                            검수대기
                        </dt>
                        <dd class="tap_count">
                            ${countready }
                        </dd>
                    </dl>
                </div>
                <div class="tap_item" id="ingShow">
                    <dl>
                        <dt class="tap_title">
                            검수중
                        </dt>
                        <dd class="tap_count">
                            ${counting }
                        </dd>
                    </dl>
                </div>
                <div class="tap_item" id="goShow">
                    <dl>
                        <dt class="tap_title" >
                            검수완료
                        </dt>
                        <dd class="tap_count">
                            ${countgo }
                        </dd>
                    </dl>
                </div>
                </div>
            <div class="TS_table" id="selectready">
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
                        <th>검수완료</th>
                        <th>검수자</th>
                        <th>수정</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                    <c:choose>
                        <c:when test="${empty deal }">
							<tr>
								<td colspan="9">-------------진행 중인 거래가 없습니다.-------------</td>
							</tr>                            	
                         </c:when>
                         <c:otherwise>
                     	<c:forEach var="dto" items="${deal }">
                    	
           
                       <form action="admin.do" method="post">
                    		<input type="hidden" name="command" value="dealInfo">
                    		<input type="hidden" name="dealno" value="${dto.deal_no }">
                    		<tr class="Ts_tr">
	                        	<td><a href="deal.do?command=admin&dealno=${dto.deal_no }">${dto.deal_no }</a></td>
	                        	<td>${dto.product_title }</td>
	                        	<td>${dto.deal_sid }</td>
	                        	<td>${dto.deal_bid }</td>
	                        	<td>
	                        		<select name="dealselect" >
	                        			<option value="거래신청" <c:if test="${dto.schedule_status=='거래신청'}">selected</c:if>>거래신청</option>
	                        			<option value="예약금결제" <c:if test="${dto.schedule_status=='예약금결제'}">selected</c:if>>예약금결제</option>
	                        			<option value="검수신청" <c:if test="${dto.schedule_status=='검수신청'}">selected</c:if>>검수신청</option>
	                        			<option value="검수중" <c:if test="${dto.schedule_status=='검수중'}">selected</c:if>>검수중</option>
	                        			<option value="구매자발송준비" <c:if test="${dto.schedule_status=='구매자발송준비'}">selected</c:if>>구매자발송준비</option>
	                        			<option value="결제완료" <c:if test="${dto.schedule_status=='결제완료'}">selected</c:if>>결제완료</option>
	                            		<option value="거래확정" <c:if test="${dto.schedule_status=='거래확정'}">selected</c:if>>거래확정</option>
	                       			 </select>
	                       		 </td>
	                          
		                         <td><input id="today" type="date" name="start" value="${dto.sdate }"></td>
		                        <td><input id="today" type="date" name="end" value="${dto.edate }"></td>
		                        <td>admin</td>
		                        <td><input type="submit" value="수정"></td>
                    		</tr>
                		</form>
                    	</c:forEach>
                  </c:otherwise>
                  </c:choose>
                
                
                    </tbody>
                </table>
            </div>
            <div class="TS_table" id="selecting">
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
                        <th>검수완료</th>
                        <th>검수자</th>
                        <th>수정</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                    <c:choose>
                        <c:when test="${empty ingAll }">
							<tr>
								<td colspan="9">-------------진행 중인 거래가 없습니다.-------------</td>
							</tr>                            	
                         </c:when>
                         <c:otherwise>
                     	<c:forEach var="dto" items="${ingAll }">
             
                       <form action="admin.do" method="get">
                    		<input type="hidden" name="command" value="dealInfo">
                    		<input type="hidden" name="dealno" value="${dto.deal_no }">
                    		<tr class="Ts_tr">
	                        	<td><a href="deal.do?command=admin&dealno=${dto.deal_no }">${dto.deal_no }</a></td>
	                        	<td>${dto.product_title }</td>
	                        	<td>${dto.deal_sid }</td>
	                        	<td>${dto.deal_bid }</td>
	                        	<td>
	                        		<select name="dealselect" >
	                        			<option value="거래신청" <c:if test="${dto.schedule_status=='거래신청'}">selected</c:if>>거래신청</option>
	                        			<option value="예약금결제" <c:if test="${dto.schedule_status=='예약금결제'}">selected</c:if>>예약금결제</option>
	                        			<option value="검수신청" <c:if test="${dto.schedule_status=='검수신청'}">selected</c:if>>검수신청</option>
	                        			<option value="검수중" <c:if test="${dto.schedule_status=='검수중'}">selected</c:if>>검수중</option>
	                        			<option value="구매자발송준비" <c:if test="${dto.schedule_status=='구매자발송준비'}">selected</c:if>>구매자발송준비</option>
	                        			<option value="결제완료" <c:if test="${dto.schedule_status=='결제완료'}">selected</c:if>>결제완료</option>
	                            		<option value="거래확정" <c:if test="${dto.schedule_status=='거래확정'}">selected</c:if>>거래확정</option>
	                       			 </select>
	                       		 </td>
	                       		 
	                       		
		                        <td><input id="today" type="date" name="start" value="${dto.sdate }"></td>
		                        <td><input id="today" type="date" name="end" value="${dto.edate }"></td> 
		                        <td>admin</td>
		                        <td><input type="submit" value="수정"></td>
                    		</tr>
                		</form>
                    	</c:forEach>
                  </c:otherwise>
                  </c:choose>
                
                
                    </tbody>
                </table>
            </div>
             <div class="TS_table" id="selectgo">
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
                        <th>검수완료</th>
                        <th>검수자</th>
                        <th>수정</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                    <c:choose>
                        <c:when test="${empty goAll }">
							<tr>
								<td colspan="9">-------------진행 중인 거래가 없습니다.-------------</td>
							</tr>                            	
                         </c:when>
                         <c:otherwise>
                     	<c:forEach var="dto" items="${goAll }">
                    	
           
                       <form action="admin.do" method="post">
                    		<input type="hidden" name="command" value="dealInfo">
                    		<input type="hidden" name="dealno" value="${dto.deal_no }">
                    		<tr class="Ts_tr">
	                        	<td><a href="deal.do?command=admin&dealno=${dto.deal_no }">${dto.deal_no }</a></td>
	                        	<td>${dto.product_title }</td>
	                        	<td>${dto.deal_sid }</td>
	                        	<td>${dto.deal_bid }</td>
	                        	<td>
	                        		<select name="dealselect" >
	                        			<option value="거래신청" <c:if test="${dto.schedule_status=='거래신청'}">selected</c:if>>거래신청</option>
	                        			<option value="예약금결제" <c:if test="${dto.schedule_status=='예약금결제'}">selected</c:if>>예약금결제</option>
	                        			<option value="검수신청" <c:if test="${dto.schedule_status=='검수신청'}">selected</c:if>>검수신청</option>
	                        			<option value="검수중" <c:if test="${dto.schedule_status=='검수중'}">selected</c:if>>검수중</option>
	                        			<option value="구매자발송준비" <c:if test="${dto.schedule_status=='구매자발송준비'}">selected</c:if>>구매자발송준비</option>
	                        			<option value="결제완료" <c:if test="${dto.schedule_status=='결제완료'}">selected</c:if>>결제완료</option>
	                            		<option value="거래확정" <c:if test="${dto.schedule_status=='거래확정'}">selected</c:if>>거래확정</option>
	                       			 </select>
	                       		 </td>
	                          
		                        <td><input id="today" type="date" name="start" value="${dto.sdate }"></td>
		                        <td><input id="today" type="date" name="end" value="${dto.edate }"></td>
		                        <td>admin</td>
		                        <td><input type="submit" value="수정"></td>
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