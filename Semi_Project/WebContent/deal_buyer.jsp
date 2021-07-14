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
<title>O_PYUNG</title>

<script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />


</head>
<body>


<script type="text/javascript">
		
	$(function(){
		var IMP = window.IMP; //생략가능
		IMP.init('imp36332265');		//고유키값
		var msg;
		
		IMP.request_pay({
			pg : 'html5_inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name: 'Opyung',
			amount: ${prePrice},
			buyer_email : '${biddto.mb_email}',
			buyer_name : '${biddto.mb_name}',
			buyer_tel : '${biddto.mb_phone}',
			buyer_addr : '${biddto.mb_addr}',
			//buyer_postcode : '123-456',
			//m_redirect_url : 'http://www.naver.com'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
					msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\n결제 금액 : ' + rsp.paid_amount;
                    msg += '\n카드 승인번호 : ' + rsp.apply_num;
                        
                alert(msg);
                  
                location.href="deal.do?command=deal_status_make&dealno=${dealdto.deal_no}&prePrice=${prePrice}";
                    
			} else {
				var msg = '결제에 실패하였습니다.\n';
					msg += '에러내용 : ' + rsp.error_msg;

				alert(msg);
				
				location.href="deal.do?command=deal&dealno=${dealdto.deal_no}";
			}
		});
	});
	
</script>



		
		


	
</body>
</html>