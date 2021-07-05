<!-- 제품 등록 페이지 -->

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
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./css/product_add.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">  
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.full.min.js" charset="utf-8"></script>
    <script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
    <script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
    <script src="./product_add.js" defer></script>
    <title>제품등록</title>
</head>
<body>
    <form action="" method="post">
    <div class="container">
        <!-- header 추가 -->
		<%@ include file="header/header.jsp" %> 

            <!-- title 영역 -->
            <div class="title">
                <p class="add_title">제품등록</p>
            </div>

            <!-- form tag 시작 -->


            <!-- image 영역 -->
            <div class="image">
                <div class="img-div">
                    <img src="" alt="" id="imgPreview">
                </div>
                <div class="file-div ">
                    <input class="form-control" type="file" id="imageupload" onchange="getImage(this.value);">
                </div>
            </div>
            
            <!-- content 영역 -->
            <div class="content">

            <div class="content_title">
                제품 이름:
                <br>
                <input type="text" class="form-control" name="product_title" placeholder="모델명 기재">
            </div>

            <hr>

            <div class="content_info">
                제품 정보:
                <br>
                <div>
                    <label for="" class="form-label">데스크탑</label>
                    <select name="" id="" class="form-select">
                        <option value=""  selected>품목선택</option>
                        <option value="">CPU</option>
                        <option value="">RAM</option>
                        <option value="">그래픽카드</option>
                        <option value="">메인보드</option>
                        <option value="">케이스</option>
                    </select>
                    <label for="" class="form-label">주변기기</label>
                    <select name="" id="" class="form-select">
                        <option value="" selected>품목선택</option>
                        <option value="">모니터</option>
                        <option value="">키보드</option>
                        <option value="">마우스</option>
                    </select>
                    <label for="" class="form-label">브랜드</label>
                    <select class="form-select">
                        <option value="" selected>브랜드선택</option>
                        <option value="">INTEL</option>
                        <option value="">AMD</option>
                        <option value="">ASUS</option>
                        <option value="">LEVONO</option>
                        <option value="">HP</option>
                        <option value="">SAMSUNG</option>
                        <option value="">BENQ</option>
                        <option value="">LG</option>
                    </select>
                </div>
                
            </div>

            <hr>

            <div class="content_location">
                희망 거래지역:
                <br>
                <input type="text" class="deal_location form-control" name="deal_location" placeholder="시,구 등의 간략한 위치 기재">
            </div>
            <hr>

            <div class="price">
                <label for="">예상가격 :</label><br>
                <input type="text" class="form-control" placeholder="숫자만 입력" numberOnly>
            </div>

            <hr>
            <div class="state">
                <div>
                    분류:
                    <select class="product_select form-select">
                        <option selected>분류</option>
                        <option value="new">새 제품</option>
                        <option value="used">중고 제품</option>
                    </select>
                </div>  
                <div class="btns">
                    <button class="btn btn-secondary btn-lg">취소</button>
                    <input type="submit" class="btn btn-primary btn-lg" value="등록">
                </div>
            </div>
        </div>

        
        <!-- web_edotor -->
        <div class="web_editor">
            <div class="product_detail_info">
                <p>제품 상세 정보</p>
                
            </div>
            <!--업로드 api-->
            <input type="hidden" role="uploadcare-uploader" name="my_file" id="uploadedImage" />
            
            <textarea id="ckeditor" class="ckeditor" name="ckeditor" ></textarea>
            <script type="text/javascript">
                
                CKEDITOR.replace( 'ckeditor' ,
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