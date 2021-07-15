<!-- 거래 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인코딩 처리 -->    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <title>O_PYUNG</title>

<link rel="stylesheet" href="./css/deal.css">

<script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
 
 	function confirmProduct(){
 		
 		if(confirm("검수 공지사항 및 주의사항을 확인하셨나요?")){
			
 			location.href="deal.do?command=deal_status_update&dealno=${dealdto.deal_no}";
 			
 		}else{
 			alert("확인 후 다시 검수신청해주세요");
 		}
 		
 	}
 	
 		//채팅기록가져오기
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
  					$('#console').append('<p>'+val['ccb_id']+' : '+val['ccb_content']+'</p>');
  						
  					});
  				 document.getElementById("console").scrollTop = document.getElementById("console").scrollHeight;
  			},
  			error:function(data){
  				alert("실패");
  			}
			})

 	
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

                   //Console.log('Info: 상대방과 자유롭게 얘기하세요!');

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
    <div class="container">
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
        <script type="text/javascript">
        	$('.chat').css('height',$(window).innerHeight()*0.7);
        	$('.chat-content').focus();
        </script>

		<div>
		
	        <!-- 거래 정보 영역 -->
	        <div id="deal_area" class="common">
	
	            <table>
	                <col width="80px">
	                <col width="300px">
	                
	                <tr >
	                    <th>상품</th>
	                    <td style="font-size: 20px;" id="product_name">: <a href="product.do?command=detail&ptno=${ptdto.product_no }">${ptdto.product_title }</a></td>
	                </tr>
	                <tr>
	                    <th>판매자</th>
	                    <td>: ${siddto.mb_id }</td>
	                </tr>
	                <tr>
	                    <th>구매자</th>
	                    <td>: ${biddto.mb_id }</td>
	                </tr>
	                <tr>
	                    <th>가격</th>
	                    <td>: ${ptdto.product_price } 원</td>
	                </tr>
	            </table>
	
	
				 <!-- 검수버튼 & 거래하기 버튼 영역 -->
	            <div id="button_area">
	            	<c:choose>
	            		<c:when test="${id eq siddto.mb_id }">
			                <input class="btn btn-primary" type="button" value="검수신청" onclick="confirmProduct();" >
			                <input class="btn btn-secondary" type="button" value="직거래 완료" onclick="location.href='deal.do?command=directDeal&dealno=${dealdto.deal_no}&id=${siddto.mb_id }'">
	            		</c:when>
	            		<c:otherwise>
			                <input class="btn btn-primary" type="button" value="예약금결제" onclick="location.href='deal.do?command=deal_buyer&dealno=${dealdto.deal_no}'" >
	            		</c:otherwise>
	            	</c:choose>
	                <input class="btn btn-secondary" type="button" value="거래취소" onclick="location.href='deal.do?command=dealTableDelete&dealno=${dealdto.deal_no}'">
	            </div>
	        </div>
	
	        <!--공지사항 및 검수방식/패널티 영역-->
	        <div id="notice_area" class="common">
	            
	         <div class="notice_content" style="padding: 10px; border:0;font-size: 12px;">   
	         <p><strong>[업데이트] 2021/07/08 목<br>
				[적용일시] 2021/07/16 금 00:00 체결 건 부터</strong></p>

			 <p>O-PYUNG의 검수기준은 거래 당사자간 원활한 거래와 보다 균형있는 검수기준 확립을 위해 지속적으로 업데이트 되고 있습니다. 
				거래에 앞서 최신 검수기준을 참고하시기 바랍니다.<p>

			 <p>회원님께서 판매 또는 구매하신 모든 상품은 O_PYUNG의 전문 검수팀이 제품의 컨디션을 꼼꼼하게 확인한 후, 
				검수 합격 시에만 출고하고 있습니다.</p>
				
	         <p style="color: red">
	         	전자기기 거래 관련 주의사항
				O-PYUNG은 정가품 판정 및 검수기준에 의한 기본 품질 확인을 수행하고 있으나,
				통신판매 중개자로서 제조업체의 제품별 보증에 대해서는 책임을 지지 않습니다.<br>
				제품 기능에 관한 사항이나 착용 후 불량 발생 등 기타 제품 관련 질문은 제조업체에 문의하시기 바랍니다.
				단, 제조업체의 A/S 여부는 보장하지 않습니다. (이용약관 제22조 3항 참고)</p>

			 <p>O-PYUNG의 검수기준으로 고지된 사항 이외 아래와 같이 제조사에서 불량으로 인정하지 않는 기준, 
				또는 제조사의 공정상 발생하는 상품상태 중 당사 검수기준에 따라 그 여부를 명확히 분별할 수 없는 상품의 경우 하자로 판단하지 않으며, 
				이로 인한 구매취소는 불가하므로 신중한 거래 부탁 드립니다.</p>
				
				<p id="ptag" style="color: gray">&nbsp&nbsp&nbsp- 상품택,구성품 등의 고리 이탈</p>
				<p id="ptag" style="color: gray">&nbsp&nbsp&nbsp- 제조 공정 또는 소재 특성 상 발생할 수 있는 사항</p>
				
			 <p>고지드린 검수 기준으로 판정하기 모호한 상품 상태, 비특정적 상품 상태, 
				특정 모델의 제조공정에 따른 개체차이와 관련하여서는<br>
				<strong>검수센터 책임자의 최종 판단 하에 결정하게 됩니다.</strong></p>
				
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
			<p>※ '구매자 의사 확인'의 상품은 최초 문자 연락 기준 24시간 이내 회신이 없을 경우에 자동 검수 합격 처리 되며 이와 관련한 취소는 불가능합니다.</p>
			<p>※ 모조품/가품 판매 및 페널티 회피 시 해당 계정은 회원 자격이 정지되며, 새로운 아이디로 가입을 하여도 이전 거래 기록을 근거로 서비스 이용을 제재할 수 있습니다.</p>
			<p>※ 국내 발매 제품/해외 발매 제품의 여부는 검수 불합격 사항이 아니며, 이로 인한 구매 취소 또한 불가합니다.</p>
			
			<p style="font-size: 16px"><strong>검수 불합격 시 반송 택배 운임</strong></p>
			<p style="font-size: 13px"><strong>[착불]</strong></p>
			<p>패키지 - 박스: 덮개없음, 상품 불일치, 사이즈 불일치<br>
			      패키지 - 그 외 구성품: 모조품/가품, 기본 구성품 누락<br>
			      상품 - 상태: 모조품/가품, 중고품, 상품 불일치, 사이즈 불일치</p>
			
			<p style="font-size: 13px"><strong>[선불]</strong></p>
			<p>착불 반송에 해당하는 기준을 제외한 모든 검수 불합격</p>
			
			<img src="./img/deal/검수과정.png" style="width: 730px">
			
			</div>
			 
	        </div>
	
	        
	        <!-- 지도 & 버튼 영역 -->
	        <div id="map_button_area" class="common">
	            
	            <!-- 카카오 api 영역 -->
	            <div id="map_area">		<!-- 지도 담는 영역 태그 id값 -->
	            
	            	<!-- 발급받은 app key 넣기 -->
	                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8582c94d0c3acdae42928406badb7847&libraries=services"></script> 
	                
	                <script type="text/javascript">
	                
	                
	                    var mapContainer = document.getElementById('map_area');		//지도를 담을 영역의 DOM 레퍼런스
	                    
	                    //지도를 생성할 때 필요한 기본 옵션
	                    var mapOptions = {
	                        center: new kakao.maps.LatLng(33.450701, 126.570667),			//지도의 중심좌표, 지도를 생성하는데 반드시 필요, 위도(latitude) , 경도(longitude)
	                        level: 3														//지도의 레벨 (확대, 축소 정도)
	                    };
	                    
	                    //지도 생성 및 객체 리턴 
	                    var map = new kakao.maps.Map(mapContainer, mapOptions);
	                
	                 	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다 
	                    var mapTypeControl = new kakao.maps.MapTypeControl();
	                    
	                 	//지도 타입 컨트롤을 지도에 표시합니다 
	                    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
						
	                    //유저1 좌표(구매자)
	                	var user1_latitude = ${biddto.mb_addr_latitude };
	                	var user1_longitude = ${biddto.mb_addr_longitude };
	                	
	                	//유저2 좌표(판매자)
	                	var user2_latitude = ${ptdto.product_addr_latitude };
	                	var user2_longitude = ${ptdto.product_addr_longitude };
	                	
	                	//중간좌표
	                    var middle_latitude = (parseFloat(user1_latitude) + parseFloat(user2_latitude)) / 2; 
	                    var middle_longitude = (parseFloat(user1_longitude) + parseFloat(user2_longitude)) / 2;
	                    
	                    //유저1과 유저2의 위치를 기준으로 전체 맵 보여주기 
	                    var points = [
	                        new kakao.maps.LatLng(user1_latitude, user1_longitude),
	                        new kakao.maps.LatLng(user2_latitude, user2_longitude)
	                    ]; 
	                   
	                    
	                    var bounds = new kakao.maps.LatLngBounds();   
	                    
	                    var marker0 = new kakao.maps.Marker({ position : points[0] });
						marker0.setMap(map);
	                    var marker1 = new kakao.maps.Marker({ position : points[1] });
	                    marker1.setMap(map);
	                    
	                    var i;
	                    for (i = 0; i < 2; i++) {
	                        bounds.extend(points[i]);
	                    }
					 	
	                    window.onload = function(){
					 		map.setBounds(bounds);
					 	}
	                    
	                    //마커 위에 유저 1,2 표시하기
	                    var iwContent0 = '<div style="font-size:15px; margin-top:27px; background-color: white; border: 1px solid black;">'+'${biddto.mb_id }'+'</div>', 
	                    	iwPosition0 = new kakao.maps.LatLng(user1_latitude, user1_longitude);
	                    var iwContent1 = '<div style="font-size:15spx; margin-top:27px; background-color: white; border: 1px solid black;">'+'${siddto.mb_id }'+'</div>', 
	                    	iwPosition1 = new kakao.maps.LatLng(user2_latitude, user2_longitude);
	                    
	                    var customOverlay0 = new kakao.maps.CustomOverlay({
	                        position : iwPosition0, 
	                        content : iwContent0 
	                    });
	                    
	                    var customOverlay1 = new kakao.maps.CustomOverlay({
	                        position : iwPosition1, 
	                        content : iwContent1 
	                    });
	                    
	                    customOverlay0.setMap(map);           
	                    customOverlay1.setMap(map);
	                    
	                    //선 그리기 
		                var line;				//선
	                    var distanceOverlay;	//선의 거리정보를 표시할 커스텀오버레이
	                    
						line = new kakao.maps.Polyline({
							map: map,
							path: [points[0],points[1]],
							strokeWeight: 3,
							strokeColor: '#db4040',
							strokeOpacity: 1,
							strokeStyle: 'solid'
						});
	                    
						var distance = Math.round(line.getLength()),
							content = '<div style="background-color:white; font-size:10px; border: 1px solid black;">총거리 <span style="font-size:10px; ">' + distance + '</span>m</div>';
				
							
						var middle = new kakao.maps.LatLng(middle_latitude, middle_longitude);
							
							
						distanceOverlay = new kakao.maps.CustomOverlay({
							map: map,
							content: content,
							position: middle
	
						});
						
	                    
	                </script>
	            </div>
	
	           
	
	        </div>
	        
   		</div>

    </div>
    

</body>
</html>