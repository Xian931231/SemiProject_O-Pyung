<!-- 회원가입 페이지 -->

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
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/signup.css" type="text/css">
<link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
<title>O_PYUNG</title>
	
	<!-- 카카오맵 api 추가 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8582c94d0c3acdae42928406badb7847&libraries=services"></script> 
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    
$(function(){

    // 체크박스 전체 선택
    $(".checkbox_group").on("click", "#check_all", function () {
    	$(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
	});

	// 체크박스 개별 선택
	$(".checkbox_group").on("click", ".normal", function() {
    	var is_checked = true;

    $(".checkbox_group .normal").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });

    $("#check_all").prop("checked", is_checked);
    });
	
    
	
	
	//주소 -> 좌표 변환, input태그에 담아서 db에 저장
	$("#sample6_detailAddress").on("propertychange change keyup paste input", function(){
		
		var addr = $("#sample6_address").val();
		
		var geocoder = new kakao.maps.services.Geocoder();
		
		var callback = function(result, status) {
	    	if (status === kakao.maps.services.Status.OK) {
				document.getElementById("user_latitude").value = result[0].y;
				document.getElementById("user_longitude").value = result[0].x;
	    	}
		};
		
		geocoder.addressSearch(addr, callback);
		
	});
	
});
    
		function check(){
			
			if($("#id").val() == ''){
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
			
		}else if($("#pw").val() == ''){
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return false;
		
		}else if($("#email").val() == ''){
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
			
		}else if($("#name").val() == ''){
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
			
		}else if($("#phone").val() == ''){
			alert("전화번호를 입력해주세요.");
			$("#phone").focus();
			return false;
		
		}else if($("#sample6_postcode").val() == ''){
			alert("주소를 선택해주세요.");
			$(".btn").focus();
			return false;
			
		}else if($("#sample6_detailAddress").val() == ''){
			alert("상세주소를 입력해주세요.");
			$("#sample6_detailAddress").focus();
			return false;
		
		}else if($("#check_1").is(":checked") == false){
			alert("필수항목을 체크해주세요.");
			$("#check_1").focus();
			return false;
			
		}else if($("#check_2").is(":checked") == false){
			alert("필수항목을 체크해주세요.");
			$("#check_2").focus();
			return false;
			
		}else if($("#check_3").is(":checked") == false){
			alert("필수항목을 체크해주세요.");
			$("#check_3").focus();
			return false;
		}	
			return true;
}

    
    </script>
</head>
<body>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 
	
	<!-- header 공간 확보 -->
	<div id="header_space" style="background-color: black; width: 100%; height: 100px;"></div>
	
	<form action="login.do?command=signup" method="post">
    <div class="container">
        <div class="signup_box">
            <div class="title">
            	    회원가입
            </div>
            <div class="textbox">
                <h3>아이디</h3>
                <input type="text" placeholder="id" name="id" id="id">
            </div>
            <div class="textbox">
                <h3>비밀번호</h3>
                <input type="password" placeholder="password" name="pwd" id="pw">
            </div>
            <!-- 이메일 인증 버튼 구현 해보기-->
            <div class="textbox">
                <h3>이메일 주소</h3>
                <input type="text" placeholder="Opyung@Oyung.com" name="email" id="email">
            </div>
            <div class="textbox">
                <h3>이름</h3>
                <input type="text" placeholder="오평화" name="name" id="name">
            </div>
            <div class="textbox">
                <h3>전화번호</h3>
                <input type="text" placeholder="'-'를 제외하고 입력해주세요" name="phone" id="phone">
            </div>
            <!--주소 api 찾아서 구현해보기-->
            <div class="textbox_addr">
            <h3>주소</h3>
				<input type="button" class="btn" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
                <input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode">
				<input type="text" id="sample6_address" placeholder="주소" name="address"><br>
				<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="extraAddress" >
				<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress">
				<input type="hidden" id="user_latitude" name="latitude">
				<input type="hidden" id="user_longitude" name="longitude">
				

				
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
				                // 커서를 상세주소 필드로 이동한다.
				                document.getElementById("sample6_detailAddress").focus();
				            }
				        }).open();
				    }
				</script>
				
            </div>
            
            <div class="checkbox_group">
                <label>
                <input type="checkbox" id="check_all" >
                <span>모두 동의합니다</span>
                </label>
                <label>
                <input type="checkbox" id="check_1" class="normal" >
                <span>이용약관 동의<strong>(필수)</strong></span>
                </label>
                <label>
                <input type="checkbox" id="check_2" class="normal" >
                <span>개인정보 수집, 이용 동의<strong>(필수)</strong></span>
                </label>
                <label>
                    <input type="checkbox" id="check_3" class="normal" >
                    <span>개인정보 이용 동의<strong>(필수)</strong></span>
                </label>
                <label>
                <input type="checkbox" id="check_4" class="normal" >
                <span>이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)</strong></span>
            </label>
                </label>
              </div>
            <div class="button" >
                <input type="submit" value="Sign-up" onclick="return check();">
            </div>
        </div>
        </form>



    </div>
</body>
</html>