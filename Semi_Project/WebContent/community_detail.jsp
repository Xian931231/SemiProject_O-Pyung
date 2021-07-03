<!-- 커뮤니티 상세 페이지 -->

<%@page import="com.opyung.dto.CommuBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- 인코딩 처리 -->    
<%request.setCharacterEncoding("UTF-8");%>    
<%response.setContentType("text/html; charset=UTF-8");%>    
<!-- teglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" integrity="sha384-haqrlim99xjfMxRP6EWtafs0sB1WKcMdynwZleuUSwJR0mDeRYbhtY+KPMr+JL6f" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/community_detail.css">
    <script src="./js/community_detail.js" defer></script>
    
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 
    <article class="container">
	<c:if test="${commudto.cmb_id == id }">    
		 <!--조작버튼-->
        <div class="operation">
            <button type="button" class="btn btn-primary" onclick="location.href='community.do?command=updateform&cmb_no=${commudto.cmb_no}'">수정</button>
            <button type="button" class="btn btn-primary" onclick="location.href='community.do?command=delete&cmb_no=${commudto.cmb_no}'">삭제</button>
        </div>
	</c:if>
        <form>
        <input type="hidden" id="cmb_no" name="cmb_no" value="${commudto.cmb_no }">
        <input type="hidden" id="id" name="id" value="${id }">
            <div class="card-detail">
                <!-- 여기부터 쭉 반복문 코딩 -->
                <div class="card-post" >
                    <div class="card-item">
                        <div class="card" >
                            <!-- 카드 헤더부분-->
                            <div class="card-header">
                                <a href="#" class="card-body-user">
                                	<!--프로필 사진-->
                                    <div class="profile-user-img">
                                        <img src="upload/${commudto.cimg_name}${commudto.cimg_type}" alt="" class="profile-user-img-img">
                                    </div>   
                                    <!--작성자 정보-->
                                    <div class="card-user-div">
                                    	<!--작성자 이름-->
                                        <div class="card-user-name">${commudto.cmb_id }</div>
                                        <!--작성날짜-->
                                        <div class="card-date">${commudto.cmb_date }</div>
                                    </div>                     
                                    <!--팔로워 버튼-->
                                </a>
                            </div>
                            <!--본문 사진-->
                            <img src="upload/${commudto.cimg_name}${commudto.cimg_type}" class="card-img-top" alt="...">
                            <!--본문 내용-->
                            <div class="card-body">     
                                <p class="card-text">${commudto.cmb_content }</p>
                                <!--하단 아이콘 세션-->
                                <section class="card-icons">
                                    <!--좋아요 아이콘-->
                                    <a href="#" class="card-footer-heart">
                                        <div class="card-icon-btn">
                                            <span>
                                                <i class="far fa-heart fa-2x" ></i>
                                            </span>
                                        </div>
                                    </a>
                                    <!--댓글 아이콘-->
                                    <a href="#" class="card-footer-comment" id="commentlibtn">
                                        <div class="card-icon-btn">
                                            <span>
                                                <i class="far fa-comment fa-2x"></i>
                                            </span>
                                        </div>
                                    </a>        
                                </section> 
                                <!--좋아요 수 세션-->
                                <section class="card-like-cnt">
                                   	좋아요 <span class="like-cnt">${commudto.cmb_like }</span>개
                                </section>

                            </div>
                            <!-- 댓글 리스트 -->
                            <div class="card-commentlist" id="commentlist">
                                <ul calss="card-comment-ul" id="commentul">
                                    <!-- 댓글 리스트 li 한개 프로그래밍 반복-->
                                    <li class="card-comment-li">
                                        <a href="#" class="comment-user-img">
                                            <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                        </a> 
                                        <div class="card-comment-li-div">
                                                
                                            <div class="comment-user-text">
                                                <a href="#" class="comment-user-name">user1</a>
                                                <span class="comment-user-content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium dolore minus dolorum eius sint! Et possimus molestias nesciunt. Nemo eaque maxime laboriosam aspernatur omnis nam modi? Et ipsum saepe fuga.</span>
                                            </div>       
                                            
                                            <div class="comment-data">
                                                
                                                <span class="date-report">                                                         
                                                    <!--작성날짜-->                                               
                                                    <span class="comment-date">21/11/11</span>
                                                    <!--신고하기-->
                                                    <a href="#" class="comment-report-btn">
                                                        <span class="comment-report">
                                                            <i class="fas fa-paper-plane"></i>
                                                            	신고
                                                        </span>
                                                    </a>                                                    
                                                </span>

                                                <span class="comment-oper">
                                                    <a href="#">
                                                        <span>
                                                            <i class="fas fa-pencil-alt"></i>
                                                            	수정
                                                        </span>
                                                    </a>
                                                    <a href="#">
                                                        <span>
                                                            <i class="fas fa-eraser"></i>
                                                            	삭제
                                                        </span>
                                                    </a>
                                                </span>
                                            </div>
                                        </div>                        
                                    </li>
                                    <!-- 여기까지가 한개-->

                                    <li class="card-comment-li">
                                        <a href="#" class="comment-user-img">
                                            <img src="./img/community/grphic.png" alt="" class="profile-user-img-img">
                                        </a> 
                                        <div class="card-comment-li-div">
                                                
                                            <div class="comment-user-text">
                                                <a href="#" class="comment-user-name">user1</a>
                                                <span class="comment-user-content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium dolore minus dolorum eius sint! Et possimus molestias nesciunt. Nemo eaque maxime laboriosam aspernatur omnis nam modi? Et ipsum saepe fuga.</span>
                                            </div>       
                                            
                                            <div class="comment-data">
                                                
                                                <span class="date-report">                                                         
                                                    <!--작성날짜-->                                               
                                                    <span class="comment-date">21/11/11</span>
                                                    <!--신고하기-->
                                                    <a href="#" class="comment-report-btn">
                                                        <span class="comment-report">
                                                            <i class="fas fa-paper-plane"></i>
                                                            	신고
                                                        </span>
                                                    </a>                                                    
                                                </span>

                                                <span class="comment-oper">
                                                    <a href="#" class="comment-update">
                                                        <span>
                                                            <i class="fas fa-pencil-alt"></i>
                                                            	수정
                                                        </span>
                                                    </a>
                                                    <a href="#" class="comment-delete">
                                                        <span>
                                                            <i class="fas fa-eraser"></i>
                                                            	삭제
                                                        </span>
                                                    </a>
                                                </span>
                                            </div>
                                        </div>                        
                                    </li>

                                    
                                    


                                    <!--반복 끝-->
                                </ul>
                            </div>
                            
							<c:if test="${id != NULL }"> 	
                            <!--댓글 작성 란-->
                            <div class="card-footer">
                                <div class="card-comment-div">
                                    <i class="far fa-smile fa-2x "></i>
                                    <input type="text" class="card-comment" id="comment-content" placeholder="댓글 달기">
                                    <input type="button" class="card-comment-submit" id="comment-btn" value="게시">
                                </div>
                            </div>
                            <!--댓글 작성란 끝-->
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 여기까지가 하나 -->
            
                
        </form>
    </article>
</body>
</html>