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
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8582c94d0c3acdae42928406badb7847"></script>
                <script type="text/javascript">
                    var container = document.getElementById('map_area');
                    var options = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667),
                        level: 3
                    };
                    var map = new kakao.maps.Map(container, options);
                
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