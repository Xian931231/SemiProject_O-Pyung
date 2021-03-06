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
    <!--css-->
    <link rel="stylesheet" href="./css/MYPAGEcss.css" type="text/css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<!-- jQuery -->
<script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
<!-- Script -->
<script type="text/javascript">

    $(function(){

        
        
        //정산 계좌 등록 입력 다 될경우
        $(".used_bankname, #account_num_input, #account_owner_input").change(function(){
            if($(".used_bankname").val() != 0 && $("#account_num_input").val() != 0 && $("#account_owner_input").val() != 0){
                $("#save_btn").attr("disabled", false);
            }else{
                $("#save_btn").attr("disabled", true);
            }

        });

    });


</script>

</head>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 
	
<body>
    <div id="mypage">
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



        <div id="content_area">

            <!-- 관심 상품@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

             <div id="mypage_product">
                
                <div class="title">
                    <p>관심 상품</p>
                </div>

                <div class="product_info">
                    <div class="product_list">
                        <div class="product_item">
                            <a class="item_inner">
                                <div class="product">
                                    <img class="product_img" src="image/프로필.png">
                                </div>
                                <div class="infobox">
                                    <div class="브랜드">
                                        <p>브랜드</p>
                                    </div>
                                    <a href="" class="name">Just Pink Keyboard</a>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <b class="num">10,000</b>
                                    <span class="won"><b>원</b></span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                        </div>
                   </div>
                </div>
          	</div>
    	</div>
    </div>

</body>
</html>