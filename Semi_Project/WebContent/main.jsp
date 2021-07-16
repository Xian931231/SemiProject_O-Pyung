<!-- 메인페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인코딩 처리 -->    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
    <title>O_PYUNG</title>
    <script defer src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" integrity="sha384-haqrlim99xjfMxRP6EWtafs0sB1WKcMdynwZleuUSwJR0mDeRYbhtY+KPMr+JL6f" crossorigin="anonymous"></script>
	<script type="text/javascript" src="./js/product.js"></script>
	<script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	window.onload = function () {
		$(function(){
			$('.list1').slice(0,4).show();
			
			$('#btn1').click(function(e){
				e.preventDefault();
				$('.list1:hidden').slice(0,4).show();
				if( $('.list1:hidden').length == 0){
					$('#btn1').remove();
				}
			});
			
			$('.list2').slice(0,4).show();
			
			$('#btn2').click(function(e){
				e.preventDefault();
				$('.list2:hidden').slice(0,4).show();
				if( $('.list2:hidden').length == 0){
					$('#btn2').remove();
				}
			});
			
			$('.list3').slice(0,4).show();
			
			$('#btn3').click(function(e){
				e.preventDefault();
				$('.list3:hidden').slice(0,4).show();
				if( $('.list3:hidden').length == 0){
					$('#btn3').remove();
				}
			});
			
			$('.list4').slice(0,4).show();
			
			$('#btn4').click(function(e){
				e.preventDefault();
				$('.list4:hidden').slice(0,4).show();
				if( $('.list4:hidden').length == 0){
					$('#btn4').remove();
				}
			});
			
			$('.list5').slice(0,4).show();
			
			$('#btn5').click(function(e){
				e.preventDefault();
				$('.list5:hidden').slice(0,4).show();
				if( $('.list5:hidden').length == 0){
					$('#btn5').remove();
				}
			});
		});
	}
	</script>
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 
	
	<!-- container -->
    <div class="container">

        <!-- 홈-->
        <div class="home">

			<!-- header 공간 확보 -->
			<div id="header_space" style="background-color: black"></div>

            <!-- 배너-->
            <div class="banner" style="background-color: white;">
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

				<c:forEach items="${list }" var="list">
					<!-- 첫 제품-->
                    <div class="product_list list_frist list1">
                        <div class="product_item">
                            <a href="product.do?command=detail&ptno=${list.product_no }" class="item_inner">
                            	
                                <div class="product" >
                                    <img src="upload/${list.ptimg_name }${list.ptimg_type}" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>${list.product_brand }</p>
                                    </div>
                                    <pre class="name">${list.product_title }</pre>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            ${list.product_price }
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="#" class="btn_wish" id="1ptno${list.product_no }" onclick="likeProduct('${id}','${list.product_no }');">
                               
                            </a>
                        </div>
                    </div>
                    <script type="text/javascript">
					       	var id = '${id}';
					       	var listNo = 1;
					       	var ptno = '${list.product_no}'
					       	var ptid = '${list.product_id}'
					       	if(id == null || id == "" || ptid == id){
					       	}else{
					       		isLikeList(id,listNo,ptno);
					       	}
					       		
					</script>
				</c:forEach>




                    

                </div>

                <!-- 더보기 -->
                <div class="btn_product">
                    <button class="btn outlinegrey medium" id="btn1">더보기</button>
                </div>
            </div>


            <!--그래픽 카테고리 배너-->
            <div class="banner">
                <div class="banner_item" style="background-color: #1d8174;">
                    <div id="graphic_background" class="item_inner">
                        <div class="img_box">
                            <img src="img/main/graphic.png" alt="" class="banner_img">
                        </div>
                    </div>
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
                    <c:forEach items="${list2 }" var="list2">
					<!-- 첫 제품-->
                    <div class="product_list list_frist list2">
                        <div class="product_item">
                            <a href="product.do?command=detail&ptno=${list2.product_no }" class="item_inner">
                                <div class="product" id="graphic_background" >
                                    <img src="upload/${list2.ptimg_name }${list2.ptimg_type}" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>${list2.product_brand }</p>
                                    </div>
                                    <pre class="name">${list2.product_title }</pre>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            ${list2.product_price }
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="#" class="btn_wish" id="2ptno${list2.product_no }" onclick="likeProduct('${id}','${list2.product_no }');">
                            </a>
                        </div>
                    </div>
                    <script type="text/javascript">
					       	var id = '${id}';
					       	var listNo = 2;
					       	var ptno = '${list2.product_no}'
					       	var ptid = '${list2.product_id}'
					       	if(id == null || id == "" || ptid == id){
					       	}else{
					       		isLikeList(id,listNo,ptno);
					       	}
					       		
					</script>
				</c:forEach>



                </div>

            







                <!-- 더보기 -->
                <div class="btn_product">
                    <button class="btn outlinegrey medium" id="btn2">더보기</button>
                </div>
            </div>


            <!--마우스 카테고리 배너-->
            <div class="banner">
                <div class="banner_item" style="background-color: #1d8174;">
                    <div id="mouse_background" class="item_inner">
                        <div class="img_box">
                            <img src="img/main/mouse.png" alt="" class="banner_img">
                        </div>
                    </div>
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
                    <c:forEach items="${list3 }" var="list3">
					<!-- 첫 제품-->
                    <div class="product_list list_frist list3">
                        <div class="product_item">
                            <a href="product.do?command=detail&ptno=${list3.product_no }" class="item_inner">
                                <div class="product" id="mouse_background">
                                    <img src="upload/${list3.ptimg_name }${list3.ptimg_type}" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>${list3.product_brand }</p>
                                    </div>
                                    <pre class="name">${list3.product_title }</pre>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            ${list3.product_price }
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="#" class="btn_wish" id="3ptno${list3.product_no }" onclick="likeProduct('${id}','${list3.product_no }');">
                            </a>
                        </div>
                    </div>
                    <script type="text/javascript">
					       	var id = '${id}';
					       	var listNo = 3;
					       	var ptno = '${list3.product_no}'
					       	var ptid = '${list3.product_id}'
					       	if(id == null || id == "" || ptid == id){
					       	}else{
					       		isLikeList(id,listNo,ptno);
					       	}
					       		
					</script>
					</c:forEach>
                </div>

                <!-- 더보기 -->
                <div class="btn_product">
                    <button class="btn outlinegrey medium" id="btn3">더보기</button>
                </div>
            </div>



            <!--렘 카테고리 배너-->
            <div class="banner">
                <div class="banner_item" style="background-color: #1d8174;">
                    <div id="ram_background" class="item_inner">
                        <div class="img_box">
                            <img src="img/main/ram.png" alt="" class="banner_img">
                        </div>
                    </div>
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
                    <c:forEach items="${list4 }" var="list4">
					<!-- 첫 제품-->
                    <div class="product_list list_frist list4">
                        <div class="product_item">
                            <a href="product.do?command=detail&ptno=${list4.product_no }" class="item_inner">
                                <div class="product" id="ram_background">
                                    <img src="upload/${list4.ptimg_name }${list4.ptimg_type}" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>${list4.product_brand }</p>
                                    </div>
                                    <pre class="name">${list4.product_title }</pre>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            ${list4.product_price }
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="#" class="btn_wish" id="4ptno${list4.product_no }" onclick="likeProduct('${id}','${list4.product_no }');">
                            </a>
                        </div>
                    </div>
                    <script type="text/javascript">
					       	var id = '${id}';
					       	var listNo = 4;
					       	var ptno = '${list4.product_no}'
					       	var ptid = '${list4.product_id}'
					       	if(id == null || id == "" || ptid == id){
					       	}else{
					       		isLikeList(id,listNo,ptno);
					       	}
					       		
					</script>
					</c:forEach>
                </div>

                <!-- 더보기 -->
                <div class="btn_product">
                    <button class="btn outlinegrey medium" id="btn4">더보기</button>
                </div>
            </div>




            <!--케이스 카테고리 배너-->
            <div class="banner">
                <div class="banner_item" style="background-color: #1d8174;">
                    <div id="case_background" class="item_inner">
                        <div class="img_box">
                            <img src="img/main/case.png" alt="" class="banner_img">
                        </div>
                    </div>
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
                    <c:forEach items="${list5 }" var="list5">
					<!-- 첫 제품-->
                    <div class="product_list list_frist list5">
                        <div class="product_item">
                            <a href="product.do?command=detail&ptno=${list5.product_no }" class="item_inner">
                                <div class="product" id="case_background">
                                    <img src="upload/${list5.ptimg_name }${list5.ptimg_type}" alt="" class="product_img">
                                </div>
                                <div class="info_box">
                                    <div class="brand">
                                        <p>${list5.product_brand }</p>
                                    </div>
                                    <pre class="name">${list5.product_title }</pre>
                                </div>
                                <div class="price">
                                    <div class="amount">
                                        <em class="num">
                                            ${list5.product_price }
                                        </em>
                                        <span class="won">원</span>
                                    </div>
                                    <div class="desc">즉시 구매가</div>
                                </div>
                            </a>
                            <a href="#" class="btn_wish" id="5ptno${list5.product_no }" onclick="likeProduct('${id}','${list5.product_no }');">
                            </a>
                        </div>
                    </div>
                    <script type="text/javascript">
					       	var id = '${id}';
					       	var listNo = 5;
					       	var ptno = '${list5.product_no}'
					       	var ptid = '${list5.product_id}'
					       	if(id == null || id == "" || ptid == id){
					       	}else{
					       		isLikeList(id,listNo,ptno);
					       	}
					       		
					</script>
					</c:forEach>
                </div>

                <!-- 더보기 -->
                <div class="btn_product">
                    <button class="btn outlinegrey medium" id="btn5">더보기</button>
                </div>
            </div>














        </div>
        <div class="btn_top">

        </div>
    </div>
    
    <!-- footer 추가 -->
	<%@ include file="./footer/footer.jsp" %> 
</body>
</html>