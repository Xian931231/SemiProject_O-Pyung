<!-- 마이페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인코딩 처리 -->    
<%
    	request.setCharacterEncoding("UTF-8");
    %>    
<%
    	response.setContentType("text/html; charset=UTF-8");
    %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
    <title>O_PYUNG</title>
    <!--css-->
    <link rel="stylesheet" href="./css/MYPAGEcss.css" type="text/css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	<!-- jQuery -->
	<script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
	<!-- Script -->
	<script type="text/javascript">
	
	    $(function(){
	
	        
	        
	        //정산 계좌 등록 입력 다 될경우
	        $(".used_bankname, #account_num_input, #account_owner_input").change(function(){
	            if($(".used_bankname").val() != 0 && $("#account_num_input").val() != 0 && $("#account_owner_input").val() != 0){
	                $("#save_btn").attr("disabled", false);
	            }else{
	                $("#save_btn").attr("disabled", true);
	            }
	
	        });
	
	    });
	
	
	</script>
	
	<!-- 카카오맵 api 추가 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8582c94d0c3acdae42928406badb7847&libraries=services"></script> 
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

<body>
	<!-- 로그인 유무 확인 -->
	<%
		if(id == null || id == ""){
			response.sendRedirect("login.jsp");
		}
	%>
	<!-- 마이페이지 기능 -->
    <div id="mypage">
        <nav id="list">
            <a href="memberinfo.do?command=mypage&id=${id }" id="list_title"><h2>MY PAGE</h2></a>
            <div id="shop_list">
                <strong class="info">거래 정보</strong>
                <ul>
                    <li class="menu_item">
                        <a href="memberinfo.do?command=purchase&id=${id }" class="menu_link">구매 내역</a>
                    </li>
                    <li class="menu_item">
                        <a href="memberinfo.do?command=sell&id=${id }" class="menu_link">판매 내역</a>
                    </li>
                </ul>
            </div>

            <div id="my_list">
                <strong class="info">내 정보</strong>
                <ul>
                	<li class="menu_item">
                        <a href="memberinfo.do?command=likeList&id=${id }" class="menu_link">관심 상품</a>
                    </li>
                    <li class="menu_item">
                        <a href="memberinfo.do?command=memupdate&id=${id }" class="menu_link">프로필 정보</a>
                    </li>
                    <li class="menu_item">
                        <a href="memberinfo.do?command=bank&id=${id }" class="menu_link">판매 정산 계좌</a>
                    </li>
                </ul>
            </div>
        </nav>



 

      	<!-- 내 프로필 정보@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
        <form action="memberinfo.do?command=meminfoUpdate&id=${memdto.mb_id }" method="post">
            
        	<div id="mypage_profile_info">

                <div class="title">
                    <p>프로필 정보</p>
                </div>

                
                <div id="mypage_profile_id">
                    <p>${memdto.mb_id }</p>
                </div>

            	<div class="mypage_login_info">

                	<div id="mypage_login">
	                    <p>로그인 정보</p>
	                </div>

	                <div id="mypage_profile_email">
	                    <p>이메일 주소</p>
	                    <input type="email" class="my_email" name="my_email" value="${memdto.mb_email }">
	                </div>
	
	                <div id="mypage_profile_pw">
	                    <p>비밀번호</p>
	                    <input type="password" class="my_pw" name="my_pw">
	                </div>
	
	            </div>

	            <div id="mypage_personal_info">
	
	                <div id="mypage_personal">
	                    <p>개인정보</p>
	                </div>
	
	                <div id="mypage_name">
	                    <p>이름</p>
	                    <input type="text" class="my_name" name="my_name" value="${memdto.mb_name }">
	                </div>
	
	                <div id="mypage_phone">
	                    <p>휴대폰 번호</p>
	                    <input type="text" class="my_phone" name="my_phone" value="${memdto.mb_phone }">
	               	</div>

	                <div id="mypage_add">
	                    <p>주소*</p>
	                    <input type="button" class="btn" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
		                <input type="hidden" class="my_add" id="sample6_postcode" placeholder="우편번호" name="postcode">
						<input type="hidden" class="my_add" id="sample6_address" placeholder="주소" name="address"><br>
						<input type="hidden"  class="my_add" id="sample6_extraAddress" placeholder="참고항목" name="extraAddress" >
						<input type="text"  class="my_add" id="user_addr"  name="addr" value="${memdto.mb_addr }">
						<input type="hidden" class="my_add" id="user_latitude" name="latitude" value="${memdto.mb_addr_latitude }">
						<input type="hidden" class="my_add" id="user_longitude" name="longitude" value="${memdto.mb_addr_longitude }">
		
						
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
						                document.getElementById("user_addr").value = data.zonecode + " " + addr + " "+ extraAddr + " " ;
						                
						                
						                var geocoder = new kakao.maps.services.Geocoder();
										
										var callback = function(result, status) {
									    	if (status === kakao.maps.services.Status.OK) {
												document.getElementById("user_latitude").value = result[0].y;
												document.getElementById("user_longitude").value = result[0].x;
									    	}else{
									    		document.getElementById("user_latitude").value = "";
												document.getElementById("user_longitude").value = " ";
									    	}
										};
										
										geocoder.addressSearch(addr+extraAddr, callback);
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("user_addr").focus();
						            }
						        }).open();
						    }
						</script>
			
	                </div>

            	</div>

                <br>

                <div id="mypage_profile_btn">
                    <input type="submit" value="수정하기">
                </div>

                <br><br>

                <a href="memberinfo.do?command=memberDelete&id=${id }" class="user_out">회원탈퇴</a>

                <br><br><br><br>

            </div>

      	</form>
    </div>
   

</body>
		<br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br>
	     <!-- footer 추가 -->
	<%@ include file="./footer/footer.jsp" %> 
</html>