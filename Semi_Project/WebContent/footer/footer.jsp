<!-- footer 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인코딩처리 -->
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./footer/footer.css" type="text/css"/>


</head>
<body>
<div class="footer_body" style="font-family: 'Noto Sans KR', sans-serif;">
        
        <footer style="padding: 30px;">
            <hr id="footer_hrtag" style="opacity: 30%;">
            <br>
            
            <div class="footer_link">
            <a href="notice.do?command=noticelist" style="text-decoration: none;font-size: 13px;color: black;"><strong>공지사항</strong></a>
            &nbsp;
            <a href="notice.do?command=noticecheck" style="text-decoration: none;font-size: 13px;color: black;"><strong>검수기준</strong></a>
			</div>

            <br>

			<div class="footer_content" style="font-size: 11px; opacity: 60%;">

            <p>오평 주식회사 · 대표성의진
                &nbsp;&nbsp;
                사업자등록번호:570-88-01618사업자정보확인
                &nbsp;&nbsp;
                통신판매업:제 2021-성남분당C-0093호
            </p>
                
            <p>
                사업장소재지:경기도 성남시 분당구 분당내곡로 117, 8층
                &nbsp;&nbsp;
                개인정보관리책임자:고한솔
                &nbsp;&nbsp;
                호스팅 서비스:네이버 클라우드 (주)
            </p>

            <br>

            <p>
                오평(주)는 통신판매 중개자로서 통신판매의 당사자가 아니므로 개별 판매자가 등록한 상품정보에 대해서 책임을 지지 않습니다.
            </p>

            <p>
                단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 당사에 있습니다. 
            </p>

			</div>
			
            <p class="corp" style="float: right; font-size: 9px;">(c) 2021 O-PYUNG Corp.</p>
        </footer>

    </div>
</body>
</html>