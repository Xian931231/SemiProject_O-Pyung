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
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
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
 	
 	window.onload = function(){
	 		  var dealno = '${dealdto.deal_no}';
	 		  
	 		 $.ajax({
	    			url:"chat.do?command=selectDealno",
	    			type:"post",
	    			data:{
	    				dealno : dealno
	    			},
	    			dataType:"json",
	    			success: function(data){
	    				$('#console').empty();
	    				 $.each(data, function(key, val){
	    		             console.log('key:' + key + ' / ' + 'ccb_no:' + val['ccb_no'] + ', ccb_chatno :' + val['ccb_chatno']
	    								 + ', ccb_id:' + val['ccb_id'] + ', ccb_content:' + val['ccb_content'] + ', ccb_date:' + val['ccb_date']);
	    					$('#console').append('<p>'+val['ccb_id']+' : '+val['ccb_content']+'</p>');
	    						
	    					});
	    				 document.getElementById("console").scrollTop = document.getElementById("console").scrollHeight;
	    			},
	    			error:function(data){
	    				alert("실패");
	    			}
	 			})
 	
 		
 	}
    </script>
     <script type="application/javascript">
			//web소켓 연결 및 chating 연결


           var Chat = {};

           Chat.socket = null;

           // connect() 함수 정의

           // 서버에 연결하고 onopen(), onclose(), onmessage() 콜백함수를 등록함

           Chat.connect = (function(host) {

               // 서버에 접속시도

               if ('WebSocket' in window) {

                   Chat.socket = new WebSocket(host);

               } else if ('MozWebSocket' in window) {

                   Chat.socket = new MozWebSocket(host);

               } else {

                   Console.log('Error: WebSocket is not supported by this browser.');

                   return;

               }

                // 서버에 접속이 되면 호출되는 콜백함수

               Chat.socket.onopen = function () {

                   Console.log('Info: 상대방과 자유롭게 얘기하세요!');

                   // 채팅입력창에 메시지를 입력하기 위해 키를 누르면 호출되는 콜백함수

                   document.getElementById('chat').onkeydown = function(event) {

                       // 엔터키가 눌린 경우, 서버로 메시지를 전송함

                       if (event.keyCode == 13) {

                           Chat.sendMessage();

                       }

                   };

               };

            

               // 연결이 끊어진 경우에 호출되는 콜백함수

               Chat.socket.onclose = function () {

                  // 채팅 입력창 이벤트를 제거함

                   document.getElementById('chat').onkeydown = null;

                   Console.log('Info: WebSocket closed.');

               };

            

               // 서버로부터 메시지를 받은 경우에 호출되는 콜백함수

               Chat.socket.onmessage = function (message) {

                  // 수신된 메시지를 화면에 출력함

                   Console.log(message.data); 

               };

           });

           // connect() 함수 정의 끝

           

           // 위에서 정의한 connect() 함수를 호출하여 접속을 시도함

           Chat.initialize = function() {

               if (window.location.protocol == 'http:') {

                   //Chat.connect('ws://' + window.location.host + '/websocket/chat');

                  Chat.connect('ws://localhost:8383/Semi_Project/websocket/chat');
                  Console.log('Info: WebSocket .');
               } else {
            	   Console.log('Info: WebSocket.');
                   Chat.connect('wss://' + window.location.host + '/websocket/chat');

               }

           };

   

           // 서버로 메시지를 전송하고 입력창에서 메시지를 제거함

           Chat.sendMessage = (function() {

               var message = document.getElementById('chat').value;
			   var id = '${id }'
			   var dealno = '${dealdto.deal_no}'
               if (message != '') {

                   Chat.socket.send(id+" : "+message);
                   document.getElementById('chat').value = '';
                   
                   $.ajax({
           			url:"chat.do?command=insertMsg",
           			type:"post",
           			data:{
           				id : id,
           				msg : message,
           				dealno : dealno
           			},			
           			success: function(data){
           			},
           			error:function(data){
           				alert("실패");
           			}
           		})
               }

           });

   

           var Console = {}; // 화면에 메시지를 출력하기 위한 객체 생성

   

           // log() 함수 정의

           Console.log = (function(message) {

               var console = document.getElementById('console');

               var p = document.createElement('p');

               p.style.wordWrap = 'break-word';

               p.innerHTML = message;

               console.appendChild(p); // 전달된 메시지를 하단에 추가함

               // 추가된 메시지가 25개를 초과하면 가장 먼저 추가된 메시지를 한개 삭제함

               while (console.childNodes.length > 25) {

                   console.removeChild(console.firstChild);

               }

               // 스크롤을 최상단에 있도록 설정함

               console.scrollTop = console.scrollHeight;

           });

   

           // 위에 정의된 함수(접속시도)를 호출함

           Chat.initialize();



       </script>
    
    <title>O_PYUNG</title>
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="header/header.jsp" %> 

	<script type="text/javascript">
		var id = '${id}';
		if(id == null || id ==""){
			alert('잘못된 접근 방식입니다.');
			location.href='main.do?command=login';
		}else{
		var sid = '${siddto.mb_id}';
		var bid = '${biddto.mb_id}';
			if(sid == id || bid == id){
			}else{
				alert('잘못된 접근 방식입니다.');
				location.href='index.jsp';
			}
		}
	</script>
   	<!-- header 공간 확보 -->
    <article class="container">
        <section class="left">
            <div class="chat" id="console">
                채팅내역
            </div>
                <div class="chat-write" ></div>
                
                <input type="text" class="chat-content" name="" id="chat">
                <!-- <input class="btn btn-outline-dark" type="submit" value="전송" > -->
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
                <span>${chkdto.check_id }</span>
            </div>
            <div class="check">
				${chkdto.check_content }
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
                <c:choose>
                	<c:when test="${id eq siddto.mb_id }">
	                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target=".modal" >거래확정</button>
                	</c:when>
                	<c:otherwise>
	                    <button class="btn btn-danger" onclick="location.href='deal.do?command=deal_status_buyer&dealno=${dealdto.deal_no}&restPrice=${restPrice }'">구매확정</button>
                	</c:otherwise>
                </c:choose>
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
        	
        <form action="deal.do" method="post">
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