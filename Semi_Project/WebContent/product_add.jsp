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
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
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
    <title>O_PYUNG</title>

	<!-- 카카오맵 api 추가 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8582c94d0c3acdae42928406badb7847&libraries=services"></script> 
	
	<script type="text/javascript">
		
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
				<input type="button" class="btn btn-secondary btn-sm" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
                <input type="text" class="deal_location form-control" id="address" name="location" placeholder="거래를 희망하는 위치를 적어주세요">
		                <input type="hidden" class="my_add" id="sample6_postcode" placeholder="우편번호" name="postcode">
						<input type="hidden" class="my_add" id="sample6_address" placeholder="주소" name="address"><br>
						<input type="hidden"  class="my_add" id="sample6_extraAddress" placeholder="참고항목" name="extraAddress" >
						<input type="hidden" class="deal_location form-control" id="latitude" name="latitude">
						<input type="hidden" class="deal_location form-control" id="longitude" name="longitude">
						
						<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
						    function sample6_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var addr = ''; // 주소 변수
						                var extraAddr = ''; // 참고항목 변수
						
						                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    addr = data.jibunAddress;
						                }
						
						                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                    // 조합된 참고항목을 해당 필드에 넣는다.
						                    document.getElementById("sample6_extraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("sample6_extraAddress").value = '';
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample6_postcode').value = data.zonecode;
						                document.getElementById("sample6_address").value = addr;
						                document.getElementById("address").value = data.zonecode + " " + addr + " "+ extraAddr + " " ;
						                
						                
						                var geocoder = new kakao.maps.services.Geocoder();
										
										var callback = function(result, status) {
									    	if (status === kakao.maps.services.Status.OK) {
												document.getElementById("latitude").value = result[0].y;
												document.getElementById("longitude").value = result[0].x;
									    	}else{
									    		document.getElementById("latitude").value = "";
												document.getElementById("longitude").value = " ";
									    	}
										};
										
										geocoder.addressSearch(addr+extraAddr, callback);
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("address").focus();
						            }
						        }).open();
						    }
						</script>

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

    </form>
</body>

	     <!-- footer 추가 -->
	<%@ include file="./footer/footer.jsp" %> 
</html>