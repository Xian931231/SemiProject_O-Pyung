<!-- 제품 등록 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인코딩 처리 -->    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/product_add.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">  
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

    <script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>

    <title>제품등록</title>
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

   	<!-- header 공간 확보 -->
    <form action="" method="post">
    <div class="container">
        <!-- header 영역 -->
        <!-- title 영역 -->
        <div class="title">
            <p class="add_title">제품등록</p>
        </div>
     
<!-- form tag 시작 -->


        <!-- image 영역 -->
       <div class="image">
           <div class="image_center">
           <input type="file" class="img_file" name="img_file">
           </div>
        </div>
       
       <!-- content 영역 -->
       <div class="content">

        <div class="content_title">
            제품 이름:
            <br>
            <input type="text" class="product_title" name="product_title" placeholder="모델명 기재">
        </div>

        <hr>

        <div class="content_select">
            분류:
            <br>
            <select class="product_select">
            <option selected>분류</option>
            <option value="new">새 제품</option>
            <option value="used">중고 제품</option>
          </select>  
        </div>

        <hr>

        <div class="content_info">
            제품 정보:
            <br>
            <textarea class="product_info" placeholder="브랜드,구매 일자 등을 기재"></textarea>
        </div>

        <hr>

        <div class="content_location">
            희망 거래지역:
            <br>
            <input type="text" class="deal_location" name="deal_location" placeholder="시,구 등의 간략한 위치 기재">
        </div>

       </div>


        <!-- web_edotor -->
       <div class="web_editor">
           <div class="product_detail_info">
               <p>제품 상세 정보</p>
           </div>

        <textarea class="editor4" name="editor4"></textarea>
        <script>
                CKEDITOR.replace( 'editor4' ,
                                {height: 700});
        </script>
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

    </form>
</body>
</html>