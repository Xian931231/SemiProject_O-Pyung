<!-- 마이페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인코딩 처리 -->    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!--css-->
    <link rel="stylesheet" href="./css/mypage.css" type="text/css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

</head>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

<body>
    <div id="mypage">
        <nav id="list">
            <a href="" id="list_title"><h2>MY PAGE</h2></a>
            <div id="shop_list">
                <strong class="info">쇼핑 정보</strong>
                <ul>
                    <li class="menu_item">
                        <a href="" class="menu_link">구매 내역</a>
                    </li>
                    <li class="menu_item">
                        <a href="" class="menu_link">판매 내역</a>
                    </li>
                    <li class="menu_item">
                        <a href="" class="menu_link">관심 상품</a>
                    </li>
                    <li class="menu_item">
                        <a href="" class="menu_link">거래 진행</a>
                    </li>
                </ul>
            </div>

            <div id="my_list">
                <strong class="info">내 정보</strong>
                <ul>
                    <li class="menu_item">
                        <a href="" class="menu_link">프로필 정보</a>
                    </li>
                    <li class="menu_item">
                        <a href="" class="menu_link">판매 정산 계좌</a>
                    </li>
                </ul>
            </div>
        </nav>



        <div id="content_area">
            <div id="my_home">
                <div id="profile">
                    <div id="my_profile">
                        <div id="profile_name">
                            <h2 id="id">example</h2>
                            <p id="email">example@google.com</p>
                            <button>프로필 수정</button>
                        </div>
                    </div>

                    <div id="grade">
                        <div id="grade_rank">
                            <p>회원등급</p>
                        </div>
                        <div id="grade_img">
                            <img id="img" src="./img/mypage/등급 없음.png" alt="등급">
                        </div>
                        <div id="grade_score">
                            <p>회원점수</p>
                        </div>
                        <div id="grade_num">
                            <strong id="num">0</strong>
                        </div>
                    </div>
                </div>

                <!--구매 내역 이름-->
                <div class="tit">
                    <div>
                        <h3>구매 내역</h3>
                    </div>
                    <div class="add">
                        <a href="" class="add_text">더보기 ></a>
                    </div>
                </div>

                <!-- 거래 내역 표-->
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
                            <p class="empty">거래 내역이 없습니다.</p>
                        </div>
                    </div>
                </div>

                <!--판매 내역 이름-->
                <div class="tit">
                    <div>
                        <h3>판매 내역</h3>
                    </div>
                    <div class="add">
                        <a href="" class="add_text">더보기 ></a>
                    </div>
                </div>

                <!--판매 내역 표-->
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
        </div>
    </div>

</body>
</html>