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
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
    <title>O_PYUNG</title>
    <!--CSS-->
    <link rel="stylesheet" href="./css/sell_history.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

    <script type="text/javascript" src="./jQuery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#sh_end_table").css("display","none");
            $("#sh_continue").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"365px"});
            $("#sh_con_link").click(function() {
               $("#sh_end_table").hide();
               $("#sh_continue_table").show();
               
               $("#sh_continue").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"365px"});
               $("#sh_end").css("background-color","whitesmoke");
            });
            $("#sh_end_link").click(function() {
               $("#sh_continue_table").hide();
               $("#sh_end_table").show();
                
               $("#sh_end").css({"background-color":"rgb(219,219,219)","border-radius":"12px","width":"365px"});
               $("#sh_continue").css("background-color","whitesmoke");
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
    <div id="sell_history">
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
        
        
        <div id="sh_area">
            <div>
                <div id="sh_title">
                    <h1>판매 내역</h1>
                </div>

                <div id="sh_list">
                    <div id="sh_continue">
                        <a id="sh_con_link">
                            <dl>
                                <dt class="sh_title">진행 중</dt>
                                <dt class="sh_count">${dealListNum }</dt>
                            </dl> 
                        </a>
                    </div>

                    <div id="sh_end">
                        <a id="sh_end_link">
                            <dl>
                                <dt class="sh_title">종료</dt>
                                <dt class="sh_count">${endListNum }</dt>
                            </dl>
                        </a>
                    </div>
                    
                </div>
            </div>

            <div id="sh_continue_table">
                <table border="1">
                    <colgroup>
                        <col width="100px">
                        <col width="150px">
                        <col width="150px">
                        <col width="200px">
                        <col width="200px">
                        <col width="100px">
                        <col width="200px">
                        <col width="200px">
                        <col width="250px">
                        <col width="100px">
                    </colgroup>

                    <thead>
                        <tr class="sh_head">
                            <th>번호</th>
                            <th>이미지</th>
                            <th>거래번호</th>
                            <th>제목</th>
                            <th>가격</th>
                            <th>구매자</th>
                            <th>결제된금액</th>
                            <th>거래상태</th>
                            <th>상태시작날짜</th>
                            <th>검수자</th>
                        </tr>
                    </thead>
                    
                    <c:choose>
                    	<c:when test="${ empty dealList}">
                    		<tr>
                    			<td colspan="6">거래 중인 상품이 없습니다</td>
                    		</tr>
                    		
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach items="${dealList }" var="dealList">
                    			
                    			<tr class="sh_content">
			                       	<td>${dealList.rownum }</td>
			                        <td><img src="upload/${dealList.ptimg_name }${dealList.ptimg_type } "></td>
			                        <td><a href="deal.do?command=deal&dealno=${dealList.deal_no }" >${dealList.deal_no }</a></td>
			                        <td><a href="product.do?command=detail&ptno=${dealList.deal_productNo }" id="product_click">${dealList.product_title }</a></td>
			                        <td>${dealList.product_price }</td>
			                        <td>${dealList.deal_bid }</td>
			                        <td>${dealList.deal_price }원</td>
			                        <td><a href="deal.do?command=deal_status&dealno=${dealList.deal_no}">${dealList.schedule_status }</a></td>
			                        <td>${dealList.sdate }</td>
			                        <td>${dealList.check_id }</td>
		                    	</tr>
                    		
                    		</c:forEach>
                    		
                    	</c:otherwise>
                    </c:choose>
                </table>
            </div>
            
            <div id="sh_end_table">
                <table border="1">
                    <colgroup>
                        <col width="50px">
                        <col width="150px">
                        <col width="150px">
                        <col width="300px">
                        <col width="150px">
                        <col width="150px">
                        <col width="200px">
                        <col width="150px">
                    </colgroup>

                    <thead>
                        <tr class="ph_head">
                            <th>번호</th>
                            <th>이미지</th>
                            <th>거래번호</th>
                            <th>제목</th>
                            <th>구매자</th>
                            <th>가격</th>
                            <th>판매일자</th>
                            <th>검수자</th>
                        </tr>
                    </thead>
                    
                    <c:choose>
                    	<c:when test="${ empty endList}">
                    		<tr>
                    			<td colspan="6">거래 중인 상품이 없습니다</td>
                    		</tr>
                    		
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach items="${endList }" var="endList">
                    			
                    			<tr class="sh_content">
			                       	<td>${endList.rownum }</td>
			                        <td><img src="upload/${endList.ptimg_name }${endList.ptimg_type } "></td>
			                        <td><a href="deal.do?command=deal_status&dealno=${endList.deal_no }">${endList.deal_no}</a></td>
			                        <td><a href="product.do?command=detail&ptno=${endList.deal_productNo }" id="product_click">${endList.product_title }</a></td>
			                        <td>${endList.deal_bid }</td>
			                        <td>${endList.product_price }원</td>
			                        <td>${endList.edate }</td>
			                        <td>${endList.check_id }</td>
		                    	</tr>
                    		
                    		</c:forEach>
                    		
                    	</c:otherwise>
                    </c:choose>
                </table>
            </div>
        </div>
    </div>
</body>

		<br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br>
	     <!-- footer 추가 -->
	<%@ include file="./footer/footer.jsp" %> 
</html>