<!-- 회원가입 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- 인코딩 처리 -->    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/signup.css" type="text/css">
<link rel="icon" type="image/png" href="img/topLogo.ico"/>
<title>오늘도 평화로운</title>
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
});
    </script>
</head>
<body>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 
	
	<!-- header 공간 확보 -->
	<div id="header_space" style="background-color: black; width: 100%; height: 100px;"></div>
	
	
    <div class="container">
        <div class="signup_box">
            <div class="title">
            	    회원가입
            </div>
            <!-- 이메일 인증 버튼 구현 해보기-->
            <div class="textbox">
                <h3>이메일 주소</h3>
                <input type="text" placeholder="Opyung@Oyung.com">
            </div>
            <div class="textbox">
                <h3>비밀번호</h3>
                <input type="password" placeholder="password">
            </div>
            <div class="textbox">
                <h3>이름</h3>
                <input type="text" placeholder="오평화">
            </div>
            <div class="textbox">
                <h3>전화번호</h3>
                <input type="text" placeholder="010-00000000">
            </div>
            <!--주소 api 찾아서 구현해보기-->
            <div class="textbox_addr">
                <h3>주소</h3>
                <input type="text" placeholder="주소">
                <div class="textbox_addrbox">
                    <input type="button" value="주소검색">
                </div>
                
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
                <input type="submit" value="Sign-up">
            </div>
        </div>
        



    </div>
</body>
</html>