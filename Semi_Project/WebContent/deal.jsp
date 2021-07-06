<!-- 거래 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인코딩 처리 -->    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
    <title>거래 창</title>

<link rel="stylesheet" href="./css/deal.css">

<script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>

</head>
<body>
    
    <div id="wrap">

        <!-- 채팅 영역-->
        <div id="chat_area">
            <!-- 채팅 내역 -->
            <div ></div>

            <!-- 채팅 입력창 -->
            <div id="chatInput_area">
                <div id="chatInput_button">
                    <input type="button"  value="전송">
                </div>
                <div id="chatInput_text">
                    <textarea name="chatInput" id="chatInput"></textarea>
                </div>
            </div> 


        </div>

        <!-- 거래 정보 영역 -->
        <div id="deal_area" class="common">

            <table>
                
                <tr>
                    <th>판매자: &nbsp&nbsp</th>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <th>구매자: &nbsp&nbsp</th>
                    <td>홍길동</td>
                </tr>
                <tr >
                    <th>상품: &nbsp&nbsp</th>
                    <td id="product_name"><a>로지텍 G102 LIGHTSYNC (정품) </a></td>
                </tr>
                <tr>
                    <th>가격: &nbsp&nbsp</th>
                    <td>20000</td>
                </tr>
                <tr>
                    <th>미개봉: &nbsp&nbsp</th>
                    <td>Y</td>
                </tr>


            </table>

        </div>

        <!--공지사항 및 검수방식/패널티 영역-->
        <div id="notice_area" class="common">
            

        </div>

        
        <!-- 지도 & 버튼 영역 -->
        <div id="map_button_area" class="common">
            
            <!-- 카카오 api 영역 -->
            <div id="map_area">		<!-- 지도 담는 영역 태그 id값 -->
            
            	<!-- 발급받은 app key 넣기 -->
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8582c94d0c3acdae42928406badb7847&libraries=services"></script> 
                
                <script type="text/javascript">
                
                
                    var mapContainer = document.getElementById('map_area');		<!-- 지도를 담을 영역의 DOM 레퍼런스 -->
                    
                    <!-- 지도를 생성할 때 필요한 기본 옵션 -->
                    var mapOptions = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667),			<!-- 지도의 중심좌표, 지도를 생성하는데 반드시 필요, 위도(latitude) , 경도(longitude) -->
                        level: 3														<!-- 지도의 레벨 (확대, 축소 정도)-->
                    };
                    
                    <!-- 지도 생성 및 객체 리턴 -->
                    var map = new kakao.maps.Map(mapContainer, mapOptions);
                
                 	<!-- 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다 -->
                    var mapTypeControl = new kakao.maps.MapTypeControl();
                    
                 	<!-- 지도 타입 컨트롤을 지도에 표시합니다 -->
                    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
                    
                    
                    //유저1 좌표
                	var user1_latitude = "37.49909512221489";
                	var user1_longitude = "127.03286608288428";

                	//유저2 좌표
                	var user2_latitude = "37.500606922890086";
                	var user2_longitude = "127.03676965260385";
                	
                	//중간좌표
                    var middle_latitude = (parseFloat(user1_latitude) + parseFloat(user2_latitude)) / 2; 
                    var middle_longitude = (parseFloat(user1_longitude) + parseFloat(user2_longitude)) / 2;
                    
                    <!-- 유저1과 유저2의 위치를 기준으로 전체 맵 보여주기 -->
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
                    var iwContent0 = '<div style="font-size:13px; margin-top:27px; background-color: white;">USER1</div>', 
                    	iwPosition0 = new kakao.maps.LatLng(user1_latitude, user1_longitude);
                    var iwContent1 = '<div style="font-size:13px; margin-top:27px; background-color: white;">USER2</div>', 
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
						content = '<div style="background-color:white; font-size:10px">총거리 <span style="font-size:10px;">' + distance + '</span>m</div>';
			
						
					var middle = new kakao.maps.LatLng(middle_latitude, middle_longitude);
						
						
					distanceOverlay = new kakao.maps.CustomOverlay({
						map: map,
						content: content,
						position: middle

					});
					
                    
                </script>
            </div>

            <!-- 검수버튼 & 거래하기 버튼 영역 -->
            <div id="button_area">
                <input type="button" value="거래취소">
                <input type="button" value="거래하기">
            </div>

        </div>
   

    </div>
    
    

</body>
</html>