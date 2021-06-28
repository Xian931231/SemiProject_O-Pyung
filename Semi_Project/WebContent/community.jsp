<!-- 커뮤니티 페이지 -->

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" integrity="sha384-haqrlim99xjfMxRP6EWtafs0sB1WKcMdynwZleuUSwJR0mDeRYbhtY+KPMr+JL6f" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/community.css">
    <script src="./js/community/masonry.pkgd.min.js"></script>
    <script src="./js/community/imagesLoaded.js"></script>
    <script src="./js/community/community.js" defer></script>
</head>
<body>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

    <div class="container">
        <!--작성버튼-->
        <button type="button" class="write btn btn-primary" data-bs-toggle="modal" data-bs-target=".modal">글</button>
    
        <!--작성 모달-->
        <div class="modal" id="modal" tabindex="-1">
            <form action="#">
                <div class="modal-dialog modal-dialog-centered ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <a href="#" class="card-header-user">
                                <!--프로필 사진-->
                                <div class="profile-write-img">
                                    <img src="./img/community/1.jpg" alt="" class="profile-user-img-img">
                                </div>   
                                <!--작성자 정보-->
                                <div class="card-write-div">
                                    <!--작성자 이름-->
                                    <div class="card-write-name">UserName</div>
                                </div> 
                            </a>
                            <div class="card-exit" data-bs-dismiss="modal" aria-label="Close"">
                                <a href="#" class="card-icon">
                                    <span class="card-icon-btn">
                                        <i class="fas fa-times fa-2x"></i>
                                    </span>
                                </a>  
                            </div>
                        </div>
                        <div class="modal-body">
                            <!--첨부한 이미지-->
                            <img class="modal-img" src="#" alt="image" id="imgPreview">
                            <!--본문 내용-->
                            <div class="card-body">     
                                <textarea id="textarea" class="card-write-text " placeholder="내용 작성란입니다"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="file" accept="image/*" name="" id="imageupload" onchange="getImage(this.value);">
                            <!--이미지 아이콘-->
                            
                            <label for="imageupload" class="card-icon">
                                <span class="card-icon-btn">
                                    <i class="far fa-image fa-2x"></i>
                                </span>                          
                            </label>
                            <button type="submit" class="btn btn-primary">작성하기</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>



        <!--페이지 내부 헤더-->
        <div class="commu">
                <!--타이틀-->
                <div class="commu-content">
                <div class="commu-title">
                    <h3 style="font-weight: bold;">COMMUNITY</h3>
                </div>
                <!--인기순 최신순-->
                <div class="commu-btn-li">
                    <a href="#" class="commu-btn"><p class="commu-p">인기</p></a>
                    <a href="#" class="commu-btn"><p class="commu-p">최신</p></a>
                </div>
            </div>
        </div>





        <!--커뮤니티 게시글 리스트 -->
        <div class="card-list">


            
            <!-- 여기부터 쭉 반복문 코딩 -->


            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <!--게시글 사진-->
                        <img src="./img/community/1.jpg" class="card-img-top" alt="...">
                        <!--게시글 사진 아래부분-->
                        <div class="card-body">
                            <div class="card-body-user">
                                <!--작성자 프로필 사진-->
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>          
                                <!--작성자 이름-->              
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <!--게시글 내용-->
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <!--아이콘 부분-->
                        <div class="card-footer">
                            <!--좋아요 아이콘-->
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <!--좋아요 숫자-->
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <!-- 댓글 아이콘-->
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <!--댓글 숫자-->
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>
            
            <!-- 여기까지가 하나 -->

                


            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/4.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/18.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/19.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/7.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/20.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/21.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/14.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/case.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/16.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>
            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/8.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/11.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/19.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>


            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/14.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/20.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/12.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/16.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/17.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/21.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/9.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>

            <div class="card-post" >
                <a href="" class="card-item">
                    <div class="card" >
                        <img src="./img/community/1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-body-user">
                                <div class="profile-user-img">
                                    <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                </div>                        
                                <h5 class="card-user">UserName</h5>
                            </div>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="card-footer">
                            <span class="card-footer-heart">
                                <i class="far fa-heart"></i>
                                <span class="card-heart-cnt">13</span>
                            </span>
                            <span class="card-footer-comment">
                                <i class="far fa-comment"></i>
                                <span class="card-comment-cnt">123</span>
                            </span>                
                        </div>
                    </div>
                </a>
            </div>                  










            </div>
    </div>

    

</body>
</html>