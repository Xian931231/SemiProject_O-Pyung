<!-- 마이페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인코딩 처리 -->    
<%
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
    <title>O_PYUNG</title>
    
    <!--css-->
    <link rel="stylesheet" href="./css/mypage.css" type="text/css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

</head>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

<body>
	<!-- 로그인 유무 확인 -->
	<%
		if(id == null || id == ""){
			response.sendRedirect("login.jsp");
		}
	%>
	<!-- 마이페이지 기능 -->
    <div id="mypage">
        <nav id="list">
            <h2><a href="memberinfo.do?command=mypage&id=${id }" id="list_title">MY PAGE</a></h2>
            <div id="shop_list">
                <strong class="info">거래 정보</strong>
                <ul>
                    <li class="menu_item">
                        <a href="memberinfo.do?command=purchase&id=${id }" class="menu_link">구매 내역</a>
                    </li>
                    <li class="menu_item">
                        <a href="memberinfo.do?command=sell&id=${id }" class="menu_link">판매 내역</a>
                    </li>
                </ul>
            </div>

            <div id="my_list">
                <strong class="info">내 정보</strong>
                <ul>
                	<li class="menu_item">
                        <a href="memberinfo.do?command=likeList&id=${id }" class="menu_link">관심 상품</a>
                    </li>
                    <li class="menu_item">
                        <a href="memberinfo.do?command=memupdate&id=${id }" class="menu_link">프로필 정보</a>
                    </li>
                    <li class="menu_item">
                        <a href="memberinfo.do?command=bank&id=${id }" class="menu_link">판매 정산 계좌</a>
                    </li>
                </ul>
            </div>
        </nav>


        <div id="content_area">
            <div id="my_home">
                <div id="profile">
                    <div id="my_profile">
                        <div id="profile_name">
                            <h2 id="id">${memdto.mb_id }</h2>
                            <p id="email">${memdto.mb_email }</p>
                            <button onclick="location.href='memberinfo.do?command=memupdate&id=${id }'">프로필 수정</button>
                        </div>
                    </div>

                    <div id="grade">
                        <div id="grade_rank">
                            <p>회원등급</p>
                        </div>
                        <div id="grade_img">
                            <img id="img" src="./img/mypage/${memdto.mb_grade }.png" alt="등급">
                        </div>
                        <div id="grade_score">
                            <p>회원점수</p>
                        </div>
                        <div id="grade_num">
                            <strong id="num">${memdto.mb_score }</strong>
                        </div>
                    </div>
                </div>

                <!--구매 내역 이름-->
                <div class="tit">
                    <div>
                        <h3>구매 상품</h3>
                    </div>
                </div>

                <!-- 거래 내역 표-->
                <div id="buy">
                    <div class="table">
                        <div class="item">
                            <dl>
                                <dt class="title">전체</dt>
                                <dd class="count" id="count_buy_all">${bidlistNum }</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">진행 중</dt>
                                <dd class="count">${biddealListNum }</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">종료</dt>
                                <dd class="count">${bidendListNum }</dd>
                            </dl>
                        </div>
                    </div>
                    <!--구매 내역-->
                    <div>
                        
                        <c:choose>
	                    	<c:when test="${ empty bidlist}">
	                    		<div class="empty_area">
                            		<p class="empty">거래 내역이 없습니다.</p>
                        		</div>
	                    		
	                    	</c:when>
	                    	<c:otherwise>
	                    	<div>
	                    		<table class="listTable">
	                    			<tr>
	                    				<th>번호</th>
	                    				<th>이미지</th>
	                    				<th>상품명</th>
	                    				<th>가격</th>
	                    				<th>거래상태</th>
	                    				<th>구매자</th>
	                    			</tr>
	                    		<c:forEach items="${bidlist }" var="bidlist">
	                    			
	                    			<tr>
				                       	<td>${bidlist.rownum }</td>
				                        <td><div class="img-div"><img src="upload/${bidlist.ptimg_name }${bidlist.ptimg_type } "></div></td>
				                        <td><a href="product.do?command=detail&ptno=${bidlist.deal_productNo }" id="product_click">${bidlist.product_title }</a></td>
				                        <td>${bidlist.product_price }</td>
				                        <td>${bidlist.schedule_status }</td>
				                        <td>${bidlist.deal_bid }</td>
			                    	</tr>
	                    		
	                    		</c:forEach>
	                    		</table>
	                    	</div>	
	                    	</c:otherwise>
                    	</c:choose>
                    </div>
                </div>

                <!--판매 내역 이름-->
                <div class="tit">
                    <div>
                        <h3>판매 상품</h3>
                    </div>
                </div>

                <!--판매 내역 표-->
                <div id="sell">
                    <div class="table">
                        <div class="item">
                            <dl>
                                <dt class="title">판매 상품</dt>
                                <dd class="count" id="count_sell_all">${sidlistNum }</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">거래진행 중</dt>
                                <dd class="count">${siddealListNum }</dd>
                            </dl>
                        </div>
                        <div class="item">
                            <dl>
                                <dt class="title">종료</dt>
                                <dd class="count">${sidendListNum }</dd>
                            </dl>
                        </div>
                    </div>
                    <!--판매내역 -->
                    <div>
                        <c:choose>
	                    	<c:when test="${ empty sidlist}">
	                    		<div class="empty_area" id="empty_area_selling">
	                            	<p class="empty">거래 내역이 없습니다.</p>
	                       		</div>
	                    		
	                    	</c:when>
	                    	<c:otherwise>
	                    	<div>
	                    		<table class="listTable">
	                    			<tr>
	                    				<th>번호</th>
	                    				<th>이미지</th>
	                    				<th>상품명</th>
	                    				<th>가격</th>
	                    				<th>상품 상태</th>
	                    				<th>구매자</th>
	                    			</tr>
	                    		<c:forEach items="${sidlist }" var="sidlist">
	                    			
	                    			<tr>
				                       	<td>${sidlist.rownum }</td>
				                        <td><div class="img-div"><img src="upload/${sidlist.ptimg_name }${sidlist.ptimg_type } "></div></td>
				                        <td><a href="product.do?command=detail&ptno=${sidlist.product_no }" id="product_click">${sidlist.product_title }</a></td>
				                        <td>${sidlist.product_price }</td>
				                        <td>${sidlist.product_status }</td>
				                        <td>${sidlist.deal_bid }</td>
			                    	</tr>
	                    		
	                    		</c:forEach>
	                    		</table>
	                    	</div>	
	                    	</c:otherwise>
                    	</c:choose>
                    </div>
                </div>

            </div>
        </div>
    </div>

</body>

	<br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br>
	     <!-- footer 추가 -->
	<%@ include file="./footer/footer.jsp" %> 
</html>