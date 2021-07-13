<!-- 거래 상태 페이지(구매자, 판매자, 관리자 접근가능) -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 인코딩 처리 -->    
<%
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
%>    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="./css/deal_status.css">
    <script src="./js/deal_status.js" defer></script>
    
    <!-- 캘린더 -->
 	<link href='./css/fullcalender.css' rel='stylesheet' />
    <script src='./js/fullcalender.js'></script>
    
    <!-- 스크립트 -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calender');

        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next',
            center: 'title',
            right: 'dayGridMonth'
          },
          initialDate: '2021-07-01',
          selectable: true,
          events: [
            {
            /* 거래 시작, 종료 값을 넣어야함..*/
              title: '${dealdto.schedule_status }',
              start: '${dealdto.sdate}',
              end: '${dealdto.edate}'
            },
          ]
        });
        calendar.render();
      });
    
    
 	function confirmCancel(){
 		
 		if(confirm("거래 취소시 예약금을 돌려받으실 수 없습니다.취소하시겠습니까?")){
			
 			location.href="deal.do?command=dealTableDelete&dealno=${dealdto.deal_no}";
 			
 		}else{

 		}
 		
 	}
 	
    
    </script>
    
    <title>Document</title>
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

   	<!-- header 공간 확보 -->
    <article class="container">
        <section class="left">
            <div class="chat">
                채팅내역
            </div>
            <form action="#">
                <div class="chat-write"></div>
                <textarea class="chat-content" name="" id=""></textarea>
                <input class="btn btn-outline-dark" type="submit" value="전송" >
            </form>
            
            <div style="height: 100px">
            	<div style="background-color: white">
            	</div>
            </div>
            
            
        </section>
        


        <section class="status">

            <h3>진행 상태</h3>
            <div class="status-img">
                <img src="" alt="">
            </div>
            
            <h3>거래 일정</h3>
            <div id="calender">
            
            </div>
            
            <h3>검수 내역</h3>
            <div class="checker">
                <span>검수자 :</span>
                <span>누구</span>
            </div>
            <div class="check">

            </div>
            
        
        </section>
        
        <section class="right">
            <div>
                <div class="deal-info">
                    <h3>거래 상세정보</h3>
                    <table>
                        
                        <col style="width:40%;">
                        <col >

                        <tr>
                            <td >상품</td>
                            <td class="td2"><a href="#" style="color: white;">${ptdto.product_title }</a></td>
                        </tr>
                        <tr>
                            <td >판매자</td>
                            <td class="td2">${siddto.mb_id }</td>
                        </tr>
                        <tr>
                            <td >구매자</td>
                            <td class="td2">${biddto.mb_id }</td>
                        </tr>
                        <tr>
                            <td>거래상태</td>
                            <td class="td2">${dealdto.schedule_status }</td>
                        </tr>
                        <tr>
                            <td >예약금</td>
                            <td class="td2">${dealPrice }</td>
                        </tr>                        
                        <tr class="tr-price">
                            <td>결제 금액</td>
                            <td class="td2">${restPrice }</td>
                        </tr>
                        
                    </table>      
                    
                </div>
        
                <div class="btns gap-2">
                    <button class="btn btn-danger" onclick="location.href='deal.do?command=deal_status_buyer&dealno=${dealdto.deal_no}&restPrice=${restPrice }'">구매확정</button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target=".modal" >거래확정</button>

                    <button  class="btn btn-primary" onclick="confirmCancel();">구매취소</button>
                    
                </div>
            </div>
            

        </section>
        
    </article>

    
    <div class="modal fade" tabindex="-1"  aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        	<div class="modal-header">
            	<h5 class="modal-title">계좌번호 입력</h5>
            	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        	</div>
        	
        <!-- 나중에 post로 바꿔줄것 -->
        <form action="deal.do" method="get">
        	<input type="hidden" name="command" value="dealFinish">
        	<input type="hidden" name="bank_no" value=${siddto.mb_no } >
        	<input type="hidden" name="member_id" value=${siddto.mb_id }>
        	<input type="hidden" name="dealno" value=${dealdto.deal_no }>
        	<div class="modal-body">
            	<div class="mb-3">
                	<label for="bank-name" class="col-form-label">은행:</label>
                		<select name="used_bankname" class="form-select" >
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
           		<div class="mb-3">
                	<label for="bank-number" class="col-form-label">계좌번호:</label>
                	<input type="text" class="form-control" id="bank-number" placeholder="-없이 입력하세요" name="account_num">
            	</div>
            
            	<div class="mb-3">
                	<label for="account-owner" class="col-form-label">예금주:</label>
                	<input type="text" class="form-control" id="account-owner" placeholder="예금주명을 정확히 입력하세요" name="account_owner">
            	</div>
            
        	</div>
	        	<div class="modal-footer">
	            	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	            	<input type="submit" class="btn btn-primary" value="완료">
	       		</div>
      	</form>
        
        </div>
    </div>
    </div>
</body>
</html>