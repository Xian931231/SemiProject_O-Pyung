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
   	
    window.onload = function() {
		
   		today new Date();
   		
   		today = today.toISOString().slice(0,10);
   		
   		bir = document.getElementById("today");
   		
   		bir.value = today;
   	
   		
	}
    
    
    
    
    	
    </script>
</head>
<body>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

	<!-- header 공간 확보 -->
	<div id="header_space" style="background-color: black; width: 100%; height:100px"></div>
	<%
		System.out.print("롤 : "+role);
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
        	<div class="content_main">
        		                <!--신고-->
                <div class="tit">
                    <div>
                        <h3>신고 내역</h3>
                    </div>
                    <div class="add">
                        <a class="add_text" id="addbnt1" href="admin.do?command=report">더보기 ></a>
                    </div>
                </div>

                <!-- 신고 표-->
                <div id="buy">
                    <div class="table">
                        
                        <div class="item">
                            <dl>
                                <dt class="title">신고처리 요청</dt>
                                <dd class="count">${countnull }</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">신고처리 완료</dt>
                                <dd class="count">${count }</dd>
                            </dl>
                        </div>
                    </div>
                    <!--거래 내역-->
                    <div>
                        <div class="empty_area">
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
                            <c:choose>
                            	<c:when test="${empty list }">
									<tr>
										<td colspan="6">-------------등록된 신고글이 없습니다.-------------</td>
									</tr>                            	
                            	</c:when>
                            	<c:otherwise>
                            		<c:forEach var="dto" items="${list }">
                            			<tr>
			                                <td>${dto.report_no }</td>
			                                <td>${dto.report_content }</td>
			                                <td>${dto.report_id }</td>
			                                <td>${dto.report_tid }</td>
			                                <td>${dto.report_sdate }</td>
			                                <form action="admin.do" method="get" name="treat">
			                                <input type="hidden" name="command" value="treat">
			                                <input type="hidden" name="report_no" value="${dto.report_no }">
			                                <input type="hidden" name="report_tid" value="${dto.report_tid }">
			                                <td><select class="dd" name="report_treat">
			                                    <option value="no">무시</option>
			                                    <option value="yes">처리</option>
			                                    
			                                </select><input type="submit" value="처리" id="aa"></td>
			                                </form>
                            			</tr>
                            		</c:forEach>
                            	</c:otherwise>
                            </c:choose>
                             </tbody>
                        </table>
                        </div>
                    </div>
                </div>

                <!--거래진행 상태-->
                <div class="tit">
                    <div>
                        <h3>거래 상태</h3>
                    </div>
                    <div class="add">
                        <a class="add_text" id="addbnt2" href="admin.do?command=deal" >더보기 ></a>
                    </div>
                </div>

                <!--거래진행 상태-->
                <div id="sell">
                    <div class="table">
                        <div class="item">
                            <dl>
                                <dt class="title">검수 대기</dt>
                                <dd class="count" id="count_sell_all">${countready }</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">검수 중</dt>
                                <dd class="count">${counting }</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">검수 완료</dt>
                                <dd class="count">${countgo }</dd>
                            </dl>
                        </div>
                    </div>
                    <!--거래 내역-->
                    <div>
                        <div class="empty_area" id="empty_area_selling">
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
			                        <th>거래번호</th>
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
                    </div>
                </div>
        		
        	</div>
        
           
        
    

</body>
</html>