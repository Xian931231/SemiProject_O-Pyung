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
    <title>오늘도 평화로운</title>
    <link rel="stylesheet" type="text/css" href="./css/adminpage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src = "./ckeditor/ckeditor.js"></script>
    
    <script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    $(function() {
    	$(".content_01").css("display","none");
        $(".content_02").css("display","none");
        $(".content_03").css("display","none");
        $(".content_04").css("display","none");
        
        $(".side_maintitle").click(function(){
        	$(".content_main").show();
            $(".content_01").hide();
            $(".content_02").hide();
            $(".content_03").hide();
            $(".content_04").hide();
        });
        
        $("#report").click(function() {
           $(".content_main").hide();
           $(".content_01").hide();
           $(".content_02").show();
           $(".content_03").hide();
           $(".content_04").hide();

        });
        
        $("#transactionStatus").click(function() {
        	$(".content_main").hide();
            $(".content_01").hide();
            $(".content_02").hide();
            $(".content_03").show();
            $(".content_04").hide();
          

        });
        
        $("#userinfo").click(function(){
        	$(".content_main").hide();
            $(".content_01").show();
            $(".content_02").hide();
            $(".content_03").hide();
            $(".content_04").hide();
        });
        
       $("#addbnt1").click(function(){
    	   $(".content_main").hide();
           $(".content_01").hide();
           $(".content_02").show();
           $(".content_03").hide();
           $(".content_04").hide();
       });
       
       $("#addbnt2").click(function(){
    	   $(".content_main").hide();
           $(".content_01").hide();
           $(".content_02").hide();
           $(".content_03").show();
           $(".content_04").hide();
       });
       
       $("#noticeWrite").click(function() {
           $(".content_main").hide();
           $(".content_01").hide();
           $(".content_02").hide();
           $(".content_03").hide();
           $(".content_04").show();

        });
        
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
        	<div class="content_main">
        		                <!--신고-->
                <div class="tit">
                    <div>
                        <h3>신고 내역</h3>
                    </div>
                    <div class="add">
                        <a class="add_text" id="addbnt1">더보기 ></a>
                    </div>
                </div>

                <!-- 신고 표-->
                <div id="buy">
                    <div class="table">
                        <div class="item">
                            <dl>
                                <dt class="title">전체</dt>
                                <dd class="count" id="count_buy_all">0</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">진행 중</dt>
                                <dd class="count">0</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">종료</dt>
                                <dd class="count">0</dd>
                            </dl>
                        </div>
                    </div>
                    <!--거래 내역-->
                    <div>
                        <div class="empty_area">
                            <p class="empty">신고 내역이 없습니다.</p>
                        </div>
                    </div>
                </div>

                <!--거래진행 상태-->
                <div class="tit">
                    <div>
                        <h3>거래 상태</h3>
                    </div>
                    <div class="add">
                        <a class="add_text" id="addbnt2" >더보기 ></a>
                    </div>
                </div>

                <!--거래진행 상태-->
                <div id="sell">
                    <div class="table">
                        <div class="item">
                            <dl>
                                <dt class="title">전체</dt>
                                <dd class="count" id="count_sell_all">0</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">진행 중</dt>
                                <dd class="count">0</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">종료</dt>
                                <dd class="count">0</dd>
                            </dl>
                        </div>
                    </div>
                    <!--거래 내역-->
                    <div>
                        <div class="empty_area" id="empty_area_selling">
                            <p class="empty">거래 내역이 없습니다.</p>
                        </div>
                    </div>
                </div>
        		
        	</div>
        
            <div class="content_01">
                
                <h2>유저정보</h2>
                <hr>
                <div id="divsearch">
                    <form action="AdminConrtoller.do" method="post">
                    <input type="hidden" name="command" value="">
                    <input type="submit" value="검색" class="search" id="searchbnt" >
                    <select id="searchSelect">
                        <option value="ScAll">All</option>
                        <option value="ScId">ID</option>
                        <option value="ScName">NAME</option>
                        <option value="ScEmail">EMAIL</option>
                        <option value="ScPone">PONE</option>
                        <option value="SCblack">BLACK</option>
                      </select>
                    <input type="search"  class="search" id="searchbox" >
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
                        		<tr>
		                            <td><input type="checkbox"></td>
		                            <td>${dto.mb_id }</td>
		                            <td>${dto.mb_pw }</td>
		                            <td>${dto.mb_name }</td>
		                            <td>${dto.mb_email }</td>
		                            <td>${dto.mb_phone }</td>
		                            <td>${dto.mb_score }</td>
		                            <td><a>${dto.mb_able }</a></td>
		                            <td><input type="button" value="블랙처리" id="bl_btn"></td>
	                        	</tr>
                        	</c:forEach>
                        </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
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
        
    

    <div id="footer">푸터 영역입니다.</div>
</body>
</html>