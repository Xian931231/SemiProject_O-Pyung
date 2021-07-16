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
  <script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
   <script type="text/javascript">  
   $(function() {
       $("#selectnotnull").css("display","none");
       
       $("#notnullShow").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"560px"});
       $("#nullShow").css("background-color","whitesmoke");
       
       $("#notnullShow").click(function() {
           $("#selectnotnull").show();
           $("#selectnull").hide();
          
            
           $("#nullShow").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"560px"});
           $("#notnullShow").css("background-color","whitesmoke");
        });
       $("#nullShow").click(function() {
          $("#selectnotnull").hide();
          $("#selectnull").show();
           
          $("#notnullShow").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"560px"});
          $("#nullShow").css("background-color","whitesmoke");
       });
       
   });
    	
    </script>
  
    
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
        	
                <div class="content_02">
                    
                    <h2>신고</h2>
                    <hr>
                    <div class="list_tap">
                    <div class="tap_item" id="nullShow">
                        <dl>
                            <dt class="tap_title">
                              	  신고처리 요청
                            </dt>
                            <dd class="tap_count">
							
								${countnull }
							                              

                            </dd>
                        </dl>
                    </div>
                    <div class="tap_item" id="notnullShow">
                        <dl>
                            <dt class="tap_title">
                                	신고처리 완료
                            </dt>
                            <dd class="tap_count">
                                ${count }
                                
                            </dd>
                        </dl>
                    </div>
                    </div>
                    <div class="user_table" id="selectnull" >
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
                    <div class="user_table" id="selectnotnull" >
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
                            	<c:when test="${empty count1 }">
									<tr>
										<td colspan="6">-------------등록된 신고글이 없습니다.-------------</td>
									</tr>                            	
                            	</c:when>
                            	<c:otherwise>
                            		<c:forEach var="dto" items="${count1 }">
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
			                                    <option value="no">정상</option>
			                                    <option value="yes">블랙</option>
			                                    
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
            
</body>
</html>