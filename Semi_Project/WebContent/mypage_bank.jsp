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
    <title>O_PYUNG</title>
    <!--css-->
    <link rel="stylesheet" href="./css/MYPAGEcss.css" type="text/css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
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

        
        <!-- 판매 정산 계좌 등록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->

        <div id="mypage_account">
		
		
		
            <div class="title">
                <p>정산 계좌</p>
            </div>

			<div>
				<p>계좌리스트</p>
				<c:choose>
					<c:when test="${empty list }">
						<p>등록된 계좌가 없습니다.</p>
					</c:when>
					<c:otherwise>
						<select class='used_bankname' name="account">
								<option value="">계좌선택</option>
							<c:forEach items="${list }" var="list">
								<option value="${list.bank_no }">${list.bank_name } ${list.bank_account } ${list.bank_memname }</option>
							</c:forEach>
						</select>
					</c:otherwise>
				</c:choose>
			</div>
			<script type="text/javascript">
				$("select[name=account]").change(function(){
					if($("select[name=account]").val() == ''){
						$(".used_bankname").val('').prop("selected",true)
						$("#account_num_input").val("");
						$("#account_owner_input").val("");
						$("#save_btn").show();
						$("#delete_btn").hide();
					}else{
						$.ajax({
							url:"memberinfo.do?command=bankSelect&id=${id}",
							type:"post",
							data:{
								bankno : $("select[name=account]").val()
							},
							dataType:"json",
							success:function(data){
								console.log(data);
								$(".used_bankname").val(data.bank_name).prop("selected",true)
								$("#account_num_input").val(data.bank_account);
								$("#account_owner_input").val(data.bank_memname);
								$("#bankno").val(data.bank_no);
								$("#save_btn").hide();
								$("#delete_btn").show();
							},
							error:function(){
								alert("실패");
							}
						});
					}
				});
			</script>
				
			<hr>
			
            <br>
			<form action="memberinfo.do?command=bankInsert&id=${id }" method="post">
            <div id="mypage_account_bank">
            <input type="hidden" name="bankno" id="bankno"value="">
                <p>은행명</p>
                <div class="bank_select">
                    <select name='used_bankname' class='used_bankname'>
                        <option value=''>선택하세요</option>
                         <option value='SC제일은행'>SC제일은행</option>
                         <option value='경남은행'>경남은행</option>
                         <option value='광주은행'>광주은행</option>
                         <option value='국민은행'>국민은행</option>
                         <option value='굿모닝신한증권'>굿모닝신한증권</option>
                         <option value='기업은행'>기업은행</option>
                         <option value='농협중앙회'>농협중앙회</option>
                         <option value='농협회원조합'>농협회원조합</option>
                         <option value='대구은행'>대구은행</option>
                         <option value='대신증권'>대신증권</option>
                         <option value='대우증권'>대우증권</option>
                         <option value='동부증권'>동부증권</option>
                         <option value='동양종합금융증권'>동양종합금융증권</option>
                         <option value='메리츠증권'>메리츠증권</option>
                         <option value='미래에셋증권'>미래에셋증권</option>
                         <option value='뱅크오브아메리카(BOA)'>뱅크오브아메리카(BOA)</option>
                         <option value='부국증권'>부국증권</option>
                         <option value='부산은행'>부산은행</option>
                         <option value='산림조합중앙회'>산림조합중앙회</option>
                         <option value='산업은행'>산업은행</option>
                         <option value='삼성증권'>삼성증권</option>
                         <option value='상호신용금고'>상호신용금고</option>
                         <option value='새마을금고'>새마을금고</option>
                         <option value='수출입은행'>수출입은행</option>
                         <option value='수협중앙회'>수협중앙회</option>
                         <option value='신영증권'>신영증권</option>
                         <option value='신한은행'>신한은행</option>
                         <option value='신협중앙회'>신협중앙회</option>
                         <option value='에스케이증권'>에스케이증권</option>
                         <option value='에이치엠씨투자증권'>에이치엠씨투자증권</option>
                         <option value='엔에이치투자증권'>엔에이치투자증권</option>
                         <option value='엘아이지투자증권'>엘아이지투자증권</option>
                         <option value='외환은행'>외환은행</option>
                         <option value='우리은행'>우리은행</option>
                         <option value='우리투자증권'>우리투자증권</option>
                         <option value='우체국'>우체국</option>
                         <option value='유진투자증권'>유진투자증권</option>
                         <option value='전북은행'>전북은행</option>
                         <option value='제주은행'>제주은행</option>
                         <option value='키움증권'>키움증권</option>
                         <option value='하나대투증권'>하나대투증권</option>
                         <option value='하나은행'>하나은행</option>
                         <option value='하이투자증권'>하이투자증권</option>
                         <option value='한국씨티은행'>한국씨티은행</option>
                         <option value='한국투자증권'>한국투자증권</option>
                         <option value='한화증권'>한화증권</option>
                         <option value='현대증권'>현대증권</option>
                         <option value='홍콩상하이은행'>홍콩상하이은행</option>
                        </select>
                </div>

            </div>

            <div id="mypage_account_acc">
                <p>계좌번호</p>
                <div class="account_num">
                    <input type="text" name="account_num" placeholder="-없이 입력하세요" id="account_num_input">
                </div>

            </div>

            <div id="mypage_account_owner">
                <p>예금주</p>
                <div class="account_owner">
                    <input type="text" name="account_owner" placeholder="예금주명을 정확히 입력하세요" id="account_owner_input">
                </div>
            </div>

            <div id="mypage_account_btn">
                <input type="submit" value="저장하기" id="save_btn" class="save_btn" disabled>
            </div>
            </form>
               	<button id="delete_btn" class="save_btn" style="display: none">삭제하기</button>
            <script type="text/javascript">
				$("#delete_btn").click(function(){
					$.ajax({
						url:"memberinfo.do?command=bankDelete&id=${id}",
						type:"post",
						data:{
							bankno : $("#bankno").val()
						},
						success:function(data){
							alert("삭제 성공");
							location.reload();
						},
						error:function(){
							alert("삭제 실패");
						}
					});
				});
			</script>
		</div>
	</div>

            
</body>

	<br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	     <!-- footer 추가 -->
	<%@ include file="./footer/footer.jsp" %> 
</html>