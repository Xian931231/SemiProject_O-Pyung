<!-- 커뮤니티 수정 페이지 -->
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
    <link rel="icon" type="image/png" href="img/topLogo.ico"/>
	<title>오늘도 평화로운</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="jQurey/jquery-3.6.0.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" integrity="sha384-haqrlim99xjfMxRP6EWtafs0sB1WKcMdynwZleuUSwJR0mDeRYbhtY+KPMr+JL6f" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/community_update.css">
    <script src="./js/community_update.js" defer></script>
    
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 
	
    <article class="container">
        <form action="">
            <div class="card-detail">
                <!-- 여기부터 쭉 반복문 코딩 -->
                <div class="card-post" >
                    <div class="card-item">
                        <div class="card" >
                            <!-- 카드 헤더부분-->
                            <div class="card-header">
                                <a href="#" class="card-header-user">
                                    <!--프로필 사진-->
                                    <div class="profile-user-img">
                                        <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                    </div>   
                                    <!--작성자 정보-->
                                    <div class="card-user-div">
                                        <!--작성자 이름-->
                                        <div class="card-user-name">UserName</div>
                                    </div> 
                                </a>
                            </div>
                            <div>
                                <!--본문 사진 src에 이미지 주소/이름.확장자 전송-->
                                <img class="modal-img" src="./img/community/18.jpg" alt="image" id="imgPreview">
                            </div>
                            <!--본문 내용-->
                            
                            <div class="card-body">    
                                
                                <textarea id="textarea" class="card-write-text ">서버에서 가져온 텍스트 내용</textarea>
                            </div>
                            <div class="card-footer">
                                <input type="file" accept="image/*" name="" id="imageupload" onchange="getImage(this.value);">
                            <!--이미지 아이콘-->
                            
                            <label for="imageupload" class="card-icon">
                                <span class="card-icon-btn">
                                    <i class="far fa-image fa-2x"></i>
                                </span>                          
                            </label>
                            <div class="opration">                            
                                <button type="button" class="btn btn-primary">취소하기</button>
                                <button type="submit" class="btn btn-primary">수정하기</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- 여기까지가 하나 -->
            
                
        </form>
    </article>
</body>
</html>