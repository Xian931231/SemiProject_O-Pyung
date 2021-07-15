<!-- 제품 상세 페이지 -->
<!--  header 어떤거 사용할지 팀원분들 아이디어 들은 후 진행 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- 인코딩 처리 -->    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>   

<!-- import -->
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
    <link href="css/product.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">  
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="./js/product.js" defer></script>
    <title>O-PYUNG</title>
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
                    	<div class="title">
                        <h3>${ptdto.product_title }</h3>
                        <p><b>${ptdto.product_date }</b></p>
                        </div>
                        <hr>
                        <div class="userinfo">
                            <p><b>${ptdto.product_id }</b></p>
                            <p><b>${ptdto.product_status }</b></p>
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
            			<c:choose>
            				<c:when test="${ptdto.product_status ne '판매완료' }">
		                        <button class="btn btn-info btn-lg text-white" id="likeBtn" onclick="likeProduct('${id}','${ptdto.product_no }');">관심상품</button>
		                        <button class="btn btn-primary btn-lg" onclick="location.href='deal.do?command=insert&ptno=${ptdto.product_no}&id=${id }'">구매신청</button>     
            				</c:when>
            				<c:otherwise>
	                        	<button type="button" class="btn btn-secondary" disabled>판매완료</button>
            				</c:otherwise>
            			</c:choose>
                    	</div>
            		</c:otherwise>
            	</c:choose>
                </div>
        </div>
        
        <script type="text/javascript">
        	var id = '${id}';
        	var ptno = '${ptdto.product_no}'
        	console.log(id,ptno);
        	
        	if(id != null || id != ""){
        		window.onload = function(){
        			$.ajax({
        				url:"memberinfo.do?command=isLike",
        				type:"post",
        				data:{
        					id : id,
        					ptno : ptno
        				},
        				success : function(data){
        					console.log(data);
        					if(data == 'true'){
        						$('#likeBtn').html("관심상품 삭제");
        					}else{
        						$('#likeBtn').html("관심상품");
        					}
        				},
        				error:function(){
        					alert("실패");
        				}
        			})
				}
        	}
        </script>

        
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
            
<%
		List<Map<String, Object>> items = (List<Map<String, Object>>)request.getAttribute("items");
		
		for(int i=0; i<4; i++) {
			
			Map<String, Object> item = items.get(i);
			
%>
			<div class="bloggername" name="bloggername">
				<p>blogger: <%=item.get("bloggername")%></p>
				</div>
			
			<div class="postdate" name="postdate">
				<%=item.get("postdate")%>
			</div>
			
			<div class="bloggerlink" name="bloggerlink">
				<a href="<%=item.get("link")%>"><%=item.get("title") %></a>
			</div>
			
			<div class="blog_info" name="blog_info">
				<p><%=item.get("description") %></p>
			</div>
			<hr>
<%
		}
%>     
            
        </div>
    </div>
</div>


	     <!-- footer 추가 -->
	<%@ include file="./footer/footer.jsp" %> 

</body>
</html>
    