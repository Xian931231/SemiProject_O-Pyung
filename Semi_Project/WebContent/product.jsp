<!-- 제품 상세 페이지 -->
<!--  header 어떤거 사용할지 팀원분들 아이디어 들은 후 진행 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- 인코딩 처리 -->    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/product.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">  
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>상품</title>
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 
	
	<!-- 정보 -->
    <div class="container">
        <!-- header 영역 -->

            <!-- title 영역 -->



            <!-- image 영역 -->
            <div class="image">
                <div class="img-div">
                    <img src="upload/${ptdto.ptimg_name }${ptdto.ptimg_type}" alt="" id="imgPreview">
                </div>
            </div>
            
            <!-- content 영역 -->
            <div class="content">
                <div class="row">
                    <div class="col">
                        <h3>${ptdto.product_title }</h3>
                        <hr>
                        <div class="userinfo">
                            <p><b>${ptdto.product_id }</b></p>
                            <p><b>등급</b></p>
                        </div>
                        <hr>
                        <p> <b>제조사</b> : ${ptdto.product_brand } </p>
                        <p> <b>품목</b> : ${ptdto.product_category } </p>
                        <p><b>제품 상태</b> : 
                        	<c:if test="${ptdto.product_new eq 'Y'}">미개봉</c:if>
                        	<c:if test="${ptdto.product_new eq 'N'}">개봉</c:if>
                        </p>
                        <hr>
                        <p> <b>거래지역</b> : ${ptdto.product_addr } </p>
                        <hr>
                        <h4>${ptdto.product_price }원</h4>
                    </div>
                </div>
            	<div class="state">
            	<c:choose>
            		<c:when test="${ptdto.product_id eq id }">
            			<div class="btns">
                    	<button type="button" class="btn btn-secondary btn-lg " onclick="location.href='product.do?command=delete&ptno=${ptdto.product_no}'">삭제</button>
                    	<button type="button" class="btn btn-primary btn-lg" onclick="location.href='product.do?command=updateform&ptno=${ptdto.product_no}'">수정</button>
                    	</div>
            		</c:when>
            		<c:otherwise>
            			<div class="btns">
                        <button class="btn btn-info btn-lg text-white">관심상품</button>
                        <button class="btn btn-primary btn-lg" onclick="location.href='deal.do?command=insert&ptno=${ptdto.product_no}&id=${id }'">구매신청</button>                        
                    	</div>
            		</c:otherwise>
            	</c:choose>
                </div>
        </div>

        
        <!-- web_edotor -->
        <div class="web_editor">
            <p>제품 상세 정보</p>
            <div class="product_detail_info" style="text-align:center">
                ${ptdto.product_content }
                
            </div>
            <div class="check_img">
                <img src="img/product/check.png" alt="">
            </div>
            
        </div>

        <!-- naver_blog -->
        <div class="naver_blog" name="naver_blog">
        
            <div class="naver_blog_title">
                <p>블로그 리뷰</p>
            </div>

            <div class="naver_blog_info">
            <!-- 블로그 첫번째  -->
            <hr>
            <div class="bloggername" name="bloggername">
                <p>파란멜의 꿈꾸는 블로그</p>
                </div>

            <div class="postdate" name="postdate">
                22년전
            </div>

            <div class="bloggerlink" name="bloggerlink">
                <a href="">블루투스 키보드 심플하게 사용하는 로지텍 K580 K380</a>
            </div>

            <div class="blog_img" name="blog_img">
                <img src="/img/littledeep_puppy_style1.png" onerror="">
            </div>

            <div class="blog_info" name="blog_info">
                <p>게이밍 마우슨 역시 로지텍!! 게이밍 마우슨 역시 로지텍!! 게이밍 마우슨 역시 로지텍!!</p>
            </div>
            <hr>

            <!-- 블로그 두번째  -->
            <div class="bloggername" name="bloggername">
            <p>파란멜의 꿈꾸는 블로그</p>
            </div>

            <div class="postdate" name="postdate">
                22년전
            </div>

            <div class="bloggerlink" name="bloggerlink">
                <a href="">블루투스 키보드 심플하게 사용하는 로지텍 K580 K380</a>
            </div>

            <div class="blog_img" name="blog_img">
                <img src="/img/littledeep_puppy_style1.png" onerror="">
            </div>

            <div class="blog_info" name="blog_info">
                <p>게이밍 마우슨 역시 로지텍!! 게이밍 마우슨 역시 로지텍!! 게이밍 마우슨 역시 로지텍!!</p>
            </div>
            <hr>

        </div>
    </div>
</div>


        <div class="footer">footer</div>

</body>
</html>
    