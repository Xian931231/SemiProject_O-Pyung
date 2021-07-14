<!-- 공지사항(고객센터) 페이지 -->
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>O_PYUNG</title>
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
    <link rel="icon" type="image/png" href="./img/notice/111.ico"/>
    <link rel="stylesheet" type="text/css" href="./css/notice.css">
    <script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    $(function() {
        $(".content_02").css("display","none");
        $("#inspection").click(function() {
           $(".content_01").hide();
           $(".content_02").show();

        });
        $("#notice").click(function() {
           $(".content_02").hide();
           $(".content_01").show();

        });
        
    });
    </script>
</head>
<body>

	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

   	<!-- header 공간 확보 -->
   	<form action="notice.do?command=noticedetail" method="post">
	<div id="header_space" style="background-color: black; width: 100%; height: 100px"></div>
    
    <div id="main">
        <div id="sidebar">
            <h2 class="side_maintitle">고객센터</h2>
          
            <ul class="side_ul">
                <li class="side_li" id="notice"><a href="notice.do?command=noticelist">공지 사항</a></li>
                <li class="side_li" id="inspection"><a href="#">검수 기준</a></li>
            </ul>
        </div>
        <div id="contents">
            <div class="content_01">
            <h2>
              검수기준
            </h2>
            <hr>
            
               <div class="content_detail">
               
               <div class="content_date" style="font-size: 12px; margin-top: 10px">2021.07.16</div>
                    
               <div class="content_title" style="font-size: 15px;">[검수기준] 거래 하기 전, 꼭 봐주세요!</div>
                    
               <div class="content_content" style="font-size: 14px;background-color: whitesmoke;padding: 20px;margin-top: 15px;">
           	   
           	 <div class="notice_content" style="padding: 10px; border:0;font-size: 13px;">   
	         <p><strong>[업데이트] 2021/07/08 목<br>
				[적용일시] 2021/07/16 금 00:00 체결 건 부터</strong></p>
				<br>

			 <p>O-PYUNG의 검수기준은 거래 당사자간 원활한 거래와 보다 균형있는 검수기준 확립을 위해 지속적으로 업데이트 되고 있습니다. 
				거래에 앞서 최신 검수기준을 참고하시기 바랍니다.<p>

			 <p>회원님께서 판매 또는 구매하신 모든 상품은 O_PYUNG의 전문 검수팀이 제품의 컨디션을 꼼꼼하게 확인한 후, 
				검수 합격 시에만 출고하고 있습니다.</p>
				<br>
				
	         <p style="color: red">
	         	전자기기 거래 관련 주의사항
				O-PYUNG은 정가품 판정 및 검수기준에 의한 기본 품질 확인을 수행하고 있으나,
				통신판매 중개자로서 제조업체의 제품별 보증에 대해서는 책임을 지지 않습니다.<br>
				제품 기능에 관한 사항이나 착용 후 불량 발생 등 기타 제품 관련 질문은 제조업체에 문의하시기 바랍니다.
				단, 제조업체의 A/S 여부는 보장하지 않습니다. (이용약관 제22조 3항 참고)</p>
				<br>
				
			 <p>O-PYUNG의 검수기준으로 고지된 사항 이외 아래와 같이 제조사에서 불량으로 인정하지 않는 기준, 
				또는 제조사의 공정상 발생하는 상품상태 중 당사 검수기준에 따라 그 여부를 명확히 분별할 수 없는 상품의 경우 하자로 판단하지 않으며, 
				이로 인한 구매취소는 불가하므로 신중한 거래 부탁 드립니다.</p>
				<br>
				
				<p id="ptag" style="color: gray">&nbsp&nbsp&nbsp- 상품택,구성품 등의 고리 이탈</p>
				<p id="ptag" style="color: gray">&nbsp&nbsp&nbsp- 제조 공정 또는 소재 특성 상 발생할 수 있는 사항</p>
				<br>
				
			 <p>고지드린 검수 기준으로 판정하기 모호한 상품 상태, 비특정적 상품 상태, 
				특정 모델의 제조공정에 따른 개체차이와 관련하여서는
				<strong>검수센터 책임자의 최종 판단 하에 결정하게 됩니다.</strong></p>
				<br>
				
			 <p>O-PYUNG의 검수기준에 동의하지 않으실 경우 거래가 불가하오니 거래 당사자는 
			 	거래에 앞서 O-PYUNG의 검수기준을 반드시 검토하시기 바랍니다.</p>
			 
			 <div style="border:0;text-align: center;">
			 <br><br><br>	
			 <img src="./img/deal/박스_수정.png" >
			 <br><br><br>
			 <img src="./img/deal/상품 정보택 기준_수정.png">
			 <br><br><br>
			 <img src="./img/deal/그 외 구성품 기준_수정.png">
			 <br><br><br>
			 </div>
			 
			<p style="font-size: 16px"><strong>유의사항</strong></p>
			<br>
			
			<p>※ '구매자 의사 확인'의 상품은 최초 문자 연락 기준 24시간 이내 회신이 없을 경우에 자동 검수 합격 처리 되며 이와 관련한 취소는 불가능합니다.</p>
			<p>※ 모조품/가품 판매 및 페널티 회피 시 해당 계정은 회원 자격이 정지되며, 새로운 아이디로 가입을 하여도 이전 거래 기록을 근거로 서비스 이용을 제재할 수 있습니다.</p>
			<p>※ 국내 발매 제품/해외 발매 제품의 여부는 검수 불합격 사항이 아니며, 이로 인한 구매 취소 또한 불가합니다.</p>
			<br>
			
			<p style="font-size: 16px"><strong>검수 불합격 시 반송 택배 운임</strong></p>
			<br>
			
			<p style="font-size: 14px"><strong>[착불]</strong></p>
			<p>패키지 - 박스: 덮개없음, 상품 불일치, 사이즈 불일치<br>
			      패키지 - 그 외 구성품: 모조품/가품, 기본 구성품 누락<br>
			      상품 - 상태: 모조품/가품, 중고품, 상품 불일치, 사이즈 불일치</p>
			   <br>
			
			<p style="font-size: 14px"><strong>[선불]</strong></p>
			<p>착불 반송에 해당하는 기준을 제외한 모든 검수 불합격</p>
			<br><br>
			
			<img src="./img/deal/검수과정.png" style="width: 900px;margin-left: 70px">
			
			</div>
                    </div>
                   
                </div>
          			
          			<br>
          			
          			<div style="text-align: center;">
					<input type="button" value="목록으로" onclick="location.href='notice.do?command=noticelist'"
						style="	width: 80px;
								height: 30px;
								border-radius: 5px;
								border: 1px solid rgba(0,0,0,0.3);
								cursor: pointer;">
            		</div>
            
            </div>
            <div class="content_02">
                <h2>검수 기준</h2>
                <hr>
                <ul class="content_ul">
                    <li class="content_li"><a href="notice.do?command=noticecheck">[검수기준] 거래 하기 전, 꼭 봐주세요!</a></li>
                </ul>
            </div>
        </div>
    </div>

	</form>

     <!-- footer 추가 -->
	<%@ include file="./footer/footer.jsp" %>  
</body>
</html>
</body>
</html>

