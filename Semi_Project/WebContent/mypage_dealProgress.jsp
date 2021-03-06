<!-- 마이페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인코딩 처리 -->    
<%
    	request.setCharacterEncoding("UTF-8");
    %>    
<%
    	response.setContentType("text/html; charset=UTF-8");
    %>    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/deal_progress.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

</head>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 
	
<body>
    <div id="deal_progress">
        <nav id="list">
            <a href="memberinfo.do?command=mypage&id=ADMIN" id="list_title"><h2>MY PAGE</h2></a>
            <div id="shop_list">
                <strong class="info">쇼핑 정보</strong>
                <ul>
                    <li class="menu_item">
                        <a href="mypage_purchaseHistory.jsp" class="menu_link">구매 내역</a>
                    </li>
                    <li class="menu_item">
                        <a href="mypage_sellHistory.jsp" class="menu_link">판매 내역</a>
                    </li>
                    <li class="menu_item">
                        <a href="mypage_likeProduct.jsp" class="menu_link">관심 상품</a>
                    </li>
                    <li class="menu_item">
                        <a href="mypage_dealProgress.jsp" class="menu_link">거래 진행</a>
                    </li>
                </ul>
            </div>

            <div id="my_list">
                <strong class="info">내 정보</strong>
                <ul>
                    <li class="menu_item">
                        <a href="memberinfo.do?command=memupdate&id=ADMIN" class="menu_link">프로필 정보</a>
                    </li>
                    <li class="menu_item">
                        <a href="mypage_bank.jsp" class="menu_link">판매 정산 계좌</a>
                    </li>
                </ul>
            </div>
        </nav>
        
        
        <div id="TS_area">
            <div id="TS_title">
                <h1>거래 진행 상황</h1>
            </div>

            <div class="TS_table">
                <table border="1">
                    <col width="50px">
                    <col width="300px">
                    <col width="100px">
                    <col width="100px">
                    <col width="150px">
                    <col width="150px">
                    <col width="150px">
                    <col width="100px">
                    
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
                        
                    </tr>
                    </thead>
                    <tr>
                        <th>1</th>
                        <th><a href="" id="product_click">상품명</a></th>
                        <th>seller5678</th>
                        <th>buyer1234</th>
                        <th></th>
                        <th>YY/MM/DD</th>
                        <th>YY/MM/DD</th>
                        <th>관리자</th>
                        
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>