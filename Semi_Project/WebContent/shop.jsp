<!-- shop페이지(제품 전체 리스트 페이지) -->

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
    <link rel="icon" type="image/x-icon" href="assets/logo.png" />
    <link href="./css/shop.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/bffb243368.js" crossorigin="anonymous"></script>

    <title>Shop</title>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

        $(function(){
            $(".category_text").click(function(){
            $(this).next().slideToggle();
            $(this).parent().siblings().find("ul").slideUp();
            });
        });
    </script>


</head>
<body>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

<div class="container">
    <!-- header 영역 -->

    <!-- navigation 영역 -->
  <div class="navigation">
    <div class="shop_font">SHOP</div><br>
    <div class="navi-category">
        <ul>
            <li class="brand_item"><a href="" class="brand_box">
                <img class="brand_img" src="./img/shop/cpu.png"><p class="brand_name">CPU</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <img class="brand_img" src="./img/shop/mouse.png"><p class="brand_name">마우스</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <img class="brand_img" src="./img/shop/graphic.png"><p class="brand_name">그래픽카드</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <img class="brand_img" src="./img/shop/ram.png"><p class="brand_name">램</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <img class="brand_img" src="./img/shop/mainboard.png"><p class="brand_name">메인보드</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <img class="brand_img" src="./img/shop/case.png"><p class="brand_name">케이스</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <img class="brand_img" src="./img/shop/monitor.png"><p class="brand_name">모니터</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <img class="brand_img" src="./img/shop/keyboard.png"><p class="brand_name">키보드</p></a></li>
        </ul>
        </div>
  </div>

  

  <!-- side (category 영역) -->

  <div class="side">
      
    <div class="side-cate">
        <div class="filter">
            <div class="filter-box">
                <span class="filter-txt">카테고리</span>
            </div>
        </div>
        
        <ul>
        <li><b class="category_text">주변기기</b>
            <ul class="checkbox">
            <li><input type="checkbox" name="cate1" value="monitor">모니터</li><br>
            <li><input type="checkbox" name="cate1" value="keyboard">키보드</li><br>
            <li><input type="checkbox" name="cate1" value="mouse">마우스</li><br>
            </ul>
        </li>
        </ul>

        <ul>
        <li><b class="category_text">데스크탑</b>
            <ul class="checkbox">
            <li><input type="checkbox" name="cate2" value="cpu">CPU</li><br>
            <li><input type="checkbox" name="cate2" value="ram">RAM</li><br>
            <li><input type="checkbox" name="cate2" value="graphic_card">그래픽카드</li><br>
            <li><input type="checkbox" name="cate2" value="main_board">메인보드</li><br>
            <li><input type="checkbox" name="cate2" value="case">케이스</li><br>
            </ul>
        </li>
        </ul>

        <ul>
        <li><b class="category_text">브랜드</b>
            <ul class="checkbox">
            <li><input type="checkbox" name="cate3" value="intel">INTEL</li><br>
            <li><input type="checkbox" name="cate3" value="AMD">AMD</li><br>
            <li><input type="checkbox" name="cate3" value="asus">ASUS</li><br>
            <li><input type="checkbox" name="cate3" value="levono">LEVONO</li><br>
            <li><input type="checkbox" name="cate3" value="hp">HP</li><br>
            <li><input type="checkbox" name="cate3" value="samsung">SAMSUNG</li><br>
            <li><input type="checkbox" name="cate3" value="benq">BENQ</li><br>
            <li><input type="checkbox" name="cate3" value="lg">LG</li><br>
            </ul>
        </li>
        </ul>
    
        <ul>
            <li><b class="category_text">가격</b><br>
                <ul>
                    <input type="text" name="price1" id="price1"> 부터 <input type="text" name="price2" id="price2">
                </ul>
            </li>
        </ul>

        <ul>
            <li><b class="category_text">지역</b>
                <ul class="checkbox">
                <li><input type="checkbox" name="cate4" value="seoul">서울특별시</li><br>
                <li><input type="checkbox" name="cate4" value="gyunggi">경기도</li><br>
                <li><input type="checkbox" name="cate4" value="incheon">인천광역시</li><br>
                <li><input type="checkbox" name="cate4" value="busan">부산광역시</li><br>
                <li><input type="checkbox" name="cate4" value="daegu">대구광역시</li><br>
                <li><input type="checkbox" name="cate4" value="gwangju">광주광역시</li><br>
                </ul>
            </li>
        </ul>
        
        <ul>
            <li><b>개봉여부</b>
                <ul>
                <li><input type="checkbox" name="cate5" value="label">미개봉</li>
                </ul>
        </div> 

  </div>

  <!-- main (content)영역 -->
  <div class="main">

    <div class="content-product">
        <!-- 첫번째 줄 제품 -->
        <div class="product_list">
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            
                            <p>브랜드</p>
                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
        
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            

            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>

            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>
            <div class="product_item">
                <a class="item_inner">
                    <div class="product">
                        <img class="product_img" src="./img/shop/keyboard_example.jpg">
                    </div>
                    <div class="infobox">
                        <div class="브랜드">
                            <p>브랜드</p>

                        </div>
                        <div class="name">Just Pink Keyboard</div>
                    </div>
                    <div class="price">
                        <div class="amount">
                            <b class="num">10,000</b>
                        <span class="won"><b>원</b></span>
                        </div>
                        <div class="desc">즉시 구매가</div>
                    </div>
                </a>
                <a href="" class="btn_heart">
                    <i class="fas fa-heart heart"></i>
                </a>
            </div>

  </div>
</div>
</div>
  <!-- footer 영역 -->
  <div class="footer">Footer</div>
</div>

</body>
</html>

    