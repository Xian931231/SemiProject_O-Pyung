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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./js/product_add.js" defer></script>
    <title>제품등록</title>

	<!-- 카카오맵 api 추가 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8582c94d0c3acdae42928406badb7847&libraries=services"></script> 
	
	<script type="text/javascript">
		
		$(function(){
			
			$("#address").change(function(){
				
				var addr = $(this).val();
				
				var geocoder = new kakao.maps.services.Geocoder();
				
				var callback = function(result, status) {
			    	if (status === kakao.maps.services.Status.OK) {
						document.getElementById("latitude").value = result[0].y;
						document.getElementById("longitude").value = result[0].x;
			    	}else{
			    		document.getElementById("latitude").value = "";
						document.getElementById("longitude").value = "";
			    	}
				};
				
				geocoder.addressSearch(addr, callback);
				
			});
			
		});
		
	/* 카테고리 유효성 검사 */
	
	function check(){
		
		if($("#pdt_name").val() == ''){
			alert("제품 이름을 기재해주세요.");
			$("#pdt_name").focus();
			return false;
		 
		}else if($("#desktop").val() == '' && $("#sub_pdt").val() == ''){
			alert("데스크탑, 주변기기 중 하나 이상 선택해주세요.");
			$("#desktop").focus();
			return false;
		
		}else if($("#brand").val() == ''){
			
			alert("브랜드를 선택해주세요");
			$("#brand").focus();
			return false;
			
		}else if($("#address").val() == ''){
			alert("희망 거래지역을 적어주세요.");
			$("#address").focus();

			return false;
			
		}else if($("#price").val() == ""){
			alert("예상 가격을 적어주세요");
			$("#price").focus();
			return false;
			
		}else if($("#newvar").val() == "분류"){
			alert("분류를 선택해주세요.");
			$("#newvar").focus();
			return false;
		
		}else if(CKEDITOR.instances.ckeditor.getData().length < 1 ){
			alert("제품 정보를 입력해주세요.");
			$(".ckeditor").focus();
			return false;
		}
		
		return true;
	}
	
	</script>
	


</head>
<body>
	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 
	
	<!-- 로그인 유무 확인 -->
	<%
		if(id == null || id == "" ){
			response.sendRedirect("login.jsp");
		}
	%>
	
	<!-- 정보 -->
    <form action="product.do?command=insert" method="post" enctype="multipart/form-data" id="check">
    <input type="hidden" name="id" value="${id }">
    <div class="container">

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
                    <input class="form-control" type="file" name="file" id="imageupload" onchange="getImage(this.value);">
                </div>
            </div>
            
            <!-- content 영역 -->
            <div class="content">

            <div class="content_title">
                제품 이름:
                <br>
                <input type="text" class="form-control" name="title" placeholder="모델명 기재" id="pdt_name">
            </div>

            <hr>

            <div class="content_info">
                제품 정보:
                <br>
                <div>
                    <label for="" class="form-label">데스크탑</label>
                    <select name="catogory-desk" id="desktop" class="form-select">
                        <option value=""  selected>품목선택</option>
                        <option value="CPU">CPU</option>
                        <option value="RAM">RAM</option>
                        <option value="그래픽카드">그래픽카드</option>
                        <option value="메인보드">메인보드</option>
                        <option value="케이스">케이스</option>
                        <option value="기타">기타</option>
                    </select>
                    <label for="" class="form-label">주변기기</label>
                    <select name="catogory-out" id="sub_pdt" class="form-select">
                        <option value="" selected>품목선택</option>
                        <option value="모니터">모니터</option>
                        <option value="키보드">키보드</option>
                        <option value="마우스">마우스</option>
                        <option value="기타">기타</option>
                    </select>
                    <label for="" class="form-label">브랜드</label>
                    <select class="form-select" name="brand" id="brand">
                        <option value="" selected>브랜드선택</option>
                        <option value="INTEL">INTEL</option>
                        <option value="AMD">AMD</option>
                        <option value="ASUS">ASUS</option>
                        <option value="LEVONO">LEVONO</option>
                        <option value="HP">HP</option>
                        <option value="SAMSUNG">SAMSUNG</option>
                        <option value="BENQ">BENQ</option>
                        <option value="LG">LG</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
                
            </div>

            <hr>

            <div class="content_location">
                희망 거래지역:
                <br>
                <input type="text" class="deal_location form-control" id="address" name="location" placeholder="거래를 희망하는 위치를 적어주세요">
				<input type="hidden" class="deal_location form-control" id="latitude" name="latitude">
				<input type="hidden" class="deal_location form-control" id="longitude" name="longitude">

            </div>
            <hr>

            <div class="price">
                <label for="">예상가격 :</label><br>
                <input type="text" class="form-control" placeholder="숫자만 입력" name="price" numberOnly id="price">
            </div>

            <hr>
            <div class="state">
                <div>
                    분류:
                    <select class="product_select form-select" name="newvar" id="newvar">
                        <option selected>분류</option>
                        <option value="Y">새 제품</option>
                        <option value="N">중고 제품</option>
                    </select>
                </div>  
                <div class="btns">
                    <button class="btn btn-secondary btn-lg">취소</button>
                    <input type="submit" class="btn btn-primary btn-lg" value="등록" onclick="return check();">
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
            
            <textarea id="ckeditor" class="ckeditor" name="content" ></textarea>
            <script type="text/javascript">
                
                CKEDITOR.replace( 'ckeditor' ,
                                {height: 700});
                
            </script>
            
        </div>

</div>


        <div class="footer">footer</div>

    </form>
</body>
</html>