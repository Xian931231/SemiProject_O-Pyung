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
    <!--CSS-->
    <link rel="stylesheet" href="./css/purchase_history.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

    <script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#ph_end_table").css("display","none");
            $("#ph_continue").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"365px"});
            $("#ph_con_link").click(function() {
               $("#ph_end_table").hide();
               $("#ph_continue_table").show();
               
               $("#ph_continue").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"365px"});
               $("#ph_end").css("background-color","whitesmoke");
            });
            $("#ph_end_link").click(function() {
               $("#ph_continue_table").hide();
               $("#ph_end_table").show();
                
               $("#ph_end").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"365px"});
               $("#ph_continue").css("background-color","whitesmoke");
            });
            
        });

    </script>
    

</head>
	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 
<body>
    <div id="purchase_history">
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
        
        
        <div id="ph_area">
            <div>
                <div id="ph_title">
                    <h1>구매 내역</h1>
                </div>

                <div id="ph_list">
                    <div id="ph_continue">
                        <a id="ph_con_link">
                            <dl>
                                <dt class="ph_title">진행 중</dt>
                                <dt class="ph_count">0</dt>
                            </dl> 
                        </a>
                    </div>

                    <div id="ph_end">
                        <a id="ph_end_link">
                            <dl>
                                <dt class="ph_title">종료</dt>
                                <dt class="ph_count">0</dt>
                            </dl>
                        </a>
                    </div>
                    
                </div>
            </div>

            <div id="ph_continue_table">
                <table border="1">
                    <colgroup>
                        <col width="190px">
                        <col width="200px">
                        <col width="100px">
                        <col width="150px">
                        <col width="100px">
                    </colgroup>

                    <thead>
                        <tr class="ph_head">
                            <th>이미지</th>
                            <th>제목</th>
                            <th>가격</th>
                            <th>판매자</th>
                            <th>거래일정</th>
                        </tr>
                    </thead>
                    
                    <tr class="ph_content">
                        <th><img src="../mapage_purchaseHistory.html/image/k150551p1n8-s.jpg" alt="컴퓨터 부품" width="150px" height="150px"></th>
                        <th>조립 컴퓨터 부품</th>
                        <th>100,000</th>
                        <th>sellermen</th>
                        <th>???</th>
                    </tr>
                </table>
            </div>
            
            <div id="ph_end_table">
                <table border="1">
                    <colgroup>
                        <col width="190px">
                        <col width="200px">
                        <col width="100px">
                        <col width="150px">
                        <col width="100px">
                    </colgroup>

                    <thead>
                        <tr class="ph_head">
                            <th>이미지</th>
                            <th>제목</th>
                            <th>가격</th>
                            <th>판매자</th>
                            <th>거래 종료일</th>
                        </tr>
                    </thead>
                    
                    <tr class="ph_content">
                        <th><img src="../mapage_purchaseHistory.html/image/k150551p1n8-s.jpg" alt="컴퓨터 부품" width="150px" height="150px"></th>
                        <th>컴퓨터</th>
                        <th>300,000</th>
                        <th>sell5678</th>
                        <th>21/07/17</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>