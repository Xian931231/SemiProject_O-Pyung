<!-- shop페이지(제품 전체 리스트 페이지) -->

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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
    <link href="./css/shop.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/bffb243368.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="./js/product.js"></script>
    <title>O_PYUNG</title>

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
            <li class="brand_item"><a href="product.do?command=searchBtn&category=CPU" class="brand_box">
                <img class="brand_img" src="./img/shop/cpu.png"><p class="brand_name">CPU</p></a></li>
            <li class="brand_item"><a href="product.do?command=searchBtn&category=마우스" class="brand_box">
                <img class="brand_img" src="./img/shop/mouse.png"><p class="brand_name">마우스</p></a></li>
            <li class="brand_item"><a href="product.do?command=searchBtn&category=그래픽카드" class="brand_box">
                <img class="brand_img" src="./img/shop/graphic.png"><p class="brand_name">그래픽카드</p></a></li>
            <li class="brand_item"><a href="product.do?command=searchBtn&category=RAM" class="brand_box">
                <img class="brand_img" src="./img/shop/ram.png"><p class="brand_name">RAM</p></a></li>
            <li class="brand_item"><a href="product.do?command=searchBtn&category=메인보드" class="brand_box">
                <img class="brand_img" src="./img/shop/mainboard.png"><p class="brand_name">메인보드</p></a></li>
            <li class="brand_item"><a href="product.do?command=searchBtn&category=케이스" class="brand_box">
                <img class="brand_img" src="./img/shop/case.png"><p class="brand_name">케이스</p></a></li>
            <li class="brand_item"><a href="product.do?command=searchBtn&category=모니터" class="brand_box">
                <img class="brand_img" src="./img/shop/monitor.png"><p class="brand_name">모니터</p></a></li>
            <li class="brand_item"><a href="product.do?command=searchBtn&category=키보드" class="brand_box">
                <img class="brand_img" src="./img/shop/keyboard.png"><p class="brand_name">키보드</p></a></li>
        </ul>
        </div>
        
  </div>

  

  <!-- side (category 영역) -->

  <div class="side">
  	<c:if test="${id != null }">
  		<button type="button" class="btn btn-outline-primary" onclick="location.href='product.do?command=writeform'">상품 등록</button>
    </c:if>
    <form action="product.do?command=searchChk" method="post">
	    <div class="side-cate">
	        <div class="filter">
	            <div class="filter-box">
	                <span class="filter-txt">카테고리</span>
	            </div>
	        </div>
	        
	        <ul>
	        <li><b class="category_text">주변기기</b>
	            <ul class="checkbox">
	            <li><input type="checkbox" name="category" value="모니터">모니터</li><br>
	            <li><input type="checkbox" name="category" value="키보드">키보드</li><br>
	            <li><input type="checkbox" name="category" value="마우스">마우스</li><br>
	            </ul>
	        </li>
	        </ul>
	
	        <ul>
	        <li><b class="category_text">데스크탑</b>
	            <ul class="checkbox">
	            <li><input type="checkbox" name="category" value="CPU">CPU</li><br>
	            <li><input type="checkbox" name="category" value="RAM">RAM</li><br>
	            <li><input type="checkbox" name="category" value="그래픽카드">그래픽카드</li><br>
	            <li><input type="checkbox" name="category" value="메인보드">메인보드</li><br>
	            <li><input type="checkbox" name="category" value="케이스">케이스</li><br>
	            </ul>
	        </li>
	        </ul>
	
	        <ul>
	        <li><b class="category_text">브랜드</b>
	            <ul class="checkbox">
	            <li><input type="checkbox" name="brand" value="INTEL">INTEL</li><br>
	            <li><input type="checkbox" name="brand" value="AMD">AMD</li><br>
	            <li><input type="checkbox" name="brand" value="ASUS">ASUS</li><br>
	            <li><input type="checkbox" name="brand" value="LEVONO">LEVONO</li><br>
	            <li><input type="checkbox" name="brand" value="HP">HP</li><br>
	            <li><input type="checkbox" name="brand" value="SAMSUNG">SAMSUNG</li><br>
	            <li><input type="checkbox" name="brand" value="BENQ">BENQ</li><br>
	            <li><input type="checkbox" name="brand" value="LG">LG</li><br>
	            <li><input type="checkbox" name="brand" value="기타">기타</li><br>
	            </ul>
	        </li>
	        </ul>
	    
	        <ul>
	            <li><b class="category_text">가격</b><br>
	                <ul>
	                    <input type="text" name="min-price" id="price1"> 부터 <input type="text" name="max-price" id="price2">
	                </ul>
	            </li>
	        </ul>
	
	        <ul>
	            <li><b class="category_text">지역</b>
	                <ul class="checkbox">
	                <li><input type="checkbox" name="addr" value="서울">서울특별시</li><br>
	                <li><input type="checkbox" name="addr" value="경기">경기도</li><br>
	                <li><input type="checkbox" name="addr" value="인천">인천광역시</li><br>
	                <li><input type="checkbox" name="addr" value="부산">부산광역시</li><br>
	                <li><input type="checkbox" name="addr" value="대구">대구광역시</li><br>
	                <li><input type="checkbox" name="addr" value="광주">광주광역시</li><br>
	                </ul>
	            </li>
	        </ul>
	        
	        <ul>
	            <li><b>개봉여부</b>
	                <ul>
	                <li><input type="checkbox" name="newvar" value="Y">미개봉</li>
	                <li><input type="checkbox" name="newvar" value="N">개봉</li>
	        		</ul>
	        	</li>
	        </ul>
	        <input class="btn btn-outline-secondary" type="submit" value="검색">
  		</div> 
  	</form>	
	        <button class="btn btn-outline-secondary" onclick="location.href='product.do?command=shop'">리셋</button>
  </div>

  <!-- main (content)영역 -->
  <div class="main">

    <div class="content-product">
        <!-- 첫번째 줄 제품 -->
        <div class="product_list">
        
        
        <c:choose>
				<c:when test="${empty list }">
					
					
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="ptdto">
						<!-- 여기부터 쭉 반복문 코딩 -->
        
				            <div class="product_item">
				                <a href="product.do?command=detail&ptno=${ptdto.product_no }" class="item_inner">
				                    <div class="product">
				                        <img class="product_img" src="upload/${ptdto.ptimg_name }${ptdto.ptimg_type}">
				                    </div>
				                    <div class="infobox">
				                        <div class="브랜드">
				                            <p>${ptdto.product_brand }</p>
				                        </div>
				                        <div class="name">${ptdto.product_title }</div>
				                    </div>
				                    <div class="price">
				                        <div class="amount">
				                            <b class="num">${ptdto.product_price }</b>
				                        <span class="won"><b>원</b></span>
				                        </div>
				                        <div class="desc">즉시 구매가</div>
				                    </div>
				                </a>
				                <a href="#" class="btn_heart" id="ptno${ptdto.product_no }" onclick="likeProduct('${id}','${ptdto.product_no }');">
				                </a>
				            </div>
				            <script type="text/javascript">
					        	var id = '${id}';
					        	var ptno = '${ptdto.product_no}'
					        	var ptid = '${ptdto.product_id}'
					        	console.log(id,ptno);
					        	
					        	if(id == null || id == "" || ptid==id){
					        	}else{
					        		isLike(id,ptno);
					        	}
					        		
					        </script>
				 	</c:forEach>
				 </c:otherwise>
		</c:choose>        
           

  </div>
</div>
</div>
</div>

</body>
		<br><br><br><br><br><br><br><br>
	     <!-- footer 추가 -->
	<%@ include file="./footer/footer.jsp" %> 
</html>

    