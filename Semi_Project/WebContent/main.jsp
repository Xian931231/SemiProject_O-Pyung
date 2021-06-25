<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/main.css">
    <title>Document</title>
    <script defer src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" integrity="sha384-haqrlim99xjfMxRP6EWtafs0sB1WKcMdynwZleuUSwJR0mDeRYbhtY+KPMr+JL6f" crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="header/header.jsp" %>
	
    <div class="container">

        <!-- 홈-->
        <div class="home">

            <!-- 배너-->
            <div class="banner" style="background-color: aqua;">
                <img src="" alt="">
            </div>

            <!-- 최신순 카테고리-->
            <div>
                <!-- 카테고리네임-->
                <div class="product_title">
                    <div class="title">
                        최신순
                    </div>
                    <div class="sub_title">
                        발매상품
                    </div>
                </div>                

                <!-- 제품박스 -->
                <div class="product_list_wrap">
                    <!-- 첫 제품-->
                    <div class="product_list list_frist">
                        <div class="product_item">
                            <a href="#" class="item_inner">
                                <div class="product">
                                    <img src="./img/1.jpg" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>브랜드</p>
                                    </div>
                                    <pre class="name">TESTasfasdfasdfasdfsadfasdfsdfasfasdfsdafsda</pre>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            100,000
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="" class="btn_wish">
                                <i class="fas fa-heart"></i>
                            </a>
                        </div>
                    </div>
















                    <!--프로그래밍 제품-->
                    <div class="product_list list_frist">
                        <div class="product_item">
                            <a href="#" class="item_inner">
                                <div class="product">
                                    <img src="" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>브랜드</p>
                                    </div>
                                    <p class="name">TEST</p>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            200,000
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="" class="btn_wish">
                                <i class="fas fa-heart"></i>
                            </a>
                        </div>
                    </div>

                    <!--프로그래밍 제품-->
                    <div class="product_list list_frist">
                        <div class="product_item">
                            <a href="#" class="item_inner">
                                <div class="product">
                                    <img src="" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>브랜드</p>
                                    </div>
                                    <p class="name">TEST</p>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            200,000
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="" class="btn_wish">
                                <i class="fas fa-heart"></i>
                            </a>
                        </div>
                    </div>

                    <!--프로그래밍 제품-->
                    <div class="product_list list_frist">
                        <div class="product_item">
                            <a href="#" class="item_inner">
                                <div class="product">
                                    <img src="" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>브랜드</p>
                                    </div>
                                    <p class="name">TEST</p>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            200,000
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="" class="btn_wish">
                                <i class="fas fa-heart"></i>
                            </a>
                        </div>
                    </div>

























                </div>

                <!-- 더보기 -->
                <div class="btn_product">
                    <button class="btn outlinegrey medium">더보기</button>
                </div>
            </div>


            <!--그래픽 카테고리 배너-->
            <div class="banner">
                <div class="banner_item" style="background-color: #1d8174;">
                    <class class="item_inner">
                        <div class="img_box">
                            <img src="img/grphic.png" alt="" class="banner_img">
                        </div>
                    </class>
                </div>
            </div>


            <!-- 그래픽 카테고리 제품-->
            <div>
                <!-- 카테고리네임-->
                <div class="product_title">
                    <div class="title">
                        그래픽
                    </div>
                    <div class="sub_title">
                        발매상품
                    </div>
                </div>                

                <!-- 제품박스 -->
                <div class="product_list_wrap">
                    <div class="product_list list_frist">
                        <div class="product_item">
                            <a href="#" class="item_inner">
                                <div class="product">
                                    <img src="" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>브랜드</p>
                                    </div>
                                    <p class="name">TEST</p>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            100,000
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="" class="btn_wish">
                                <i class="fas fa-heart"></i>
                            </a>
                        </div>
                    </div>

                    <!-- 첫 제품-->
                    <div class="product_list list_frist">
                        <div class="product_item">
                            <a href="#" class="item_inner">
                                <div class="product">
                                    <img src="./img/1.jpg" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>브랜드</p>
                                    </div>
                                    <p class="name">TEST</p>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            100,000
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="" class="btn_wish">
                                <i class="fas fa-heart"></i>
                            </a>
                        </div>
                    </div>
                    
                    <!-- 첫 제품-->
                    <div class="product_list list_frist">
                        <div class="product_item">
                            <a href="#" class="item_inner">
                                <div class="product">
                                    <img src="./img/1.jpg" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>브랜드</p>
                                    </div>
                                    <p class="name">TEST</p>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            100,000
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="" class="btn_wish">
                                <i class="fas fa-heart"></i>
                            </a>
                        </div>
                    </div>
                    

                    <!--프로그래밍 제품-->
                    <div class="product_list list_frist">
                        <div class="product_item">
                            <a href="#" class="item_inner">
                                <div class="product">
                                    <img src="" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>브랜드</p>
                                    </div>
                                    <p class="name">TEST</p>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            200,000
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="" class="btn_wish">
                                <i class="fas fa-heart"></i>
                            </a>
                        </div>
                    </div>
                    


















                </div>

            







                <!-- 더보기 -->
                <div class="btn_product">
                    <button class="btn outlinegrey medium">더보기</button>
                </div>
            </div>


            <!--마우스 카테고리 배너-->
            <div class="banner">
                <div class="banner_item" style="background-color: #1d8174;">
                    <class class="item_inner">
                        <div class="img_box">
                            <img src="img/mouse.png" alt="" class="banner_img">
                        </div>
                    </class>
                </div>
            </div>


            <!-- 마우스 카테고리 제품-->
            <div>
                <!-- 카테고리네임-->
                <div class="product_title">
                    <div class="title">
                        마우스
                    </div>
                    <div class="sub_title">
                        발매상품
                    </div>
                </div>                

                <!-- 제품박스 -->
                <div class="product_list_wrap">
                    <div class="product_list list_frist">
                        <div class="product_item">
                            <a href="#" class="item_inner">
                                <div class="product">
                                    <img src="" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>브랜드</p>
                                    </div>
                                    <p class="name">TEST</p>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            100,000
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="" class="btn_wish">
                                <i class="fas fa-heart"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- 더보기 -->
                <div class="btn_product">
                    <button class="btn outlinegrey medium" >더보기</button>
                </div>
            </div>



            <!--렘 카테고리 배너-->
            <div class="banner">
                <div class="banner_item" style="background-color: #1d8174;">
                    <class class="item_inner">
                        <div class="img_box">
                            <img src="img/ram.png" alt="" class="banner_img">
                        </div>
                    </class>
                </div>
            </div>


            <!-- 렘 카테고리 제품-->
            <div>
                <!-- 카테고리네임-->
                <div class="product_title">
                    <div class="title">
                        RAM
                    </div>
                    <div class="sub_title">
                        발매상품
                    </div>
                </div>                

                <!-- 제품박스 -->
                <div class="product_list_wrap">
                    <div class="product_list list_frist">
                        <div class="product_item">
                            <a href="#" class="item_inner">
                                <div class="product">
                                    <img src="" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>브랜드</p>
                                    </div>
                                    <p class="name">TEST</p>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            100,000
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="" class="btn_wish">
                                <i class="fas fa-heart"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- 더보기 -->
                <div class="btn_product">
                    <button class="btn outlinegrey medium">더보기</button>
                </div>
            </div>




            <!--케이스 카테고리 배너-->
            <div class="banner">
                <div class="banner_item" style="background-color: #1d8174;">
                    <class class="item_inner">
                        <div class="img_box">
                            <img src="img/case.png" alt="" class="banner_img">
                        </div>
                    </class>
                </div>
            </div>


            <!-- 케이스 카테고리 제품-->
            <div>
                <!-- 카테고리네임-->
                <div class="product_title">
                    <div class="title">
                        케이스
                    </div>
                    <div class="sub_title">
                        발매상품
                    </div>
                </div>                

                <!-- 제품박스 -->
                <div class="product_list_wrap">
                    <div class="product_list list_frist">
                        <div class="product_item">
                            <a href="#" class="item_inner">
                                <div class="product">
                                    <img src="" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>브랜드</p>
                                    </div>
                                    <p class="name">TEST</p>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            100,000
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="" class="btn_wish">
                                <i class="fas fa-heart"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- 더보기 -->
                <div class="btn_product">
                    <button class="btn outlinegrey medium">더보기</button>
                </div>
            </div>














        </div>
        <div class="btn_top">

        </div>
    </div>
</body>
</html>
	
	</body>
</html>