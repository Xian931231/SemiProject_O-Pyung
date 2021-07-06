<!-- 거래페이지 -> 구매자 결제창 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인코딩 처리 -->    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>



</head>
<body>
<%
//구매자 정보	


%>


<script type="text/javascript">
		
	$(function(){
		var IMP = window.IMP; //생략가능
		IMP.init('imp36332265');
		var msg;
		
		IMP.request_pay({
			pg : 'html5_inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name: 'Opyung',
			amount: 100,
			buyer_email : 'gooejin21@gmail.com',
			buyer_name : '유저1',
			buyer_tel : '010-9913-7458',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			//m_redirect_url : 'http://www.naver.com'
		}, function(rsp) {
			if (rsp.success) {
				// 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달
				jQuery.ajax({
					url: "/payments/complete",	
					type: 'POST',
					dataType: 'json',
					data: {
						//서버로 전달할 데이터
						imp_uid : rsp.imp_uid,
						imp_paid_amount : rsp.paid_amount
						
					}
				}).done(function(data) {
					//서버에서 rest api로 결제정보확인 및 서비스루틴이 정상적인 경우
					if ( everythings_fine ) {
						msg = '결제가 완료되었습니다.';
						msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
					} else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					}
				});
				
				//성공시 이동할 페이지
				location.href = 'deal.jsp';
				
			} else {
				msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				//실패시 이동할 페이지
				location.href = 'deal_buyer.jsp';
				alert(msg);
			}
		});
	});
	
</script>



		
		


	
</body>
</html>