<!-- 거래상태 관리자 페이지 -->
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="./css/deal_status_admin.css">
    <script src="./js/deal_status.js" defer></script>
    <title>Document</title>
</head>
<body>
    <article class="container">
        <form action="#">
            <section class="left">
                <div class="btns gap-2">
                    <button type="button" class="oper-btn btn btn-primary">검수시작</button>
                    <button type="button" class="oper-btn btn btn-primary">검수완료</button>
                    <button type="button" class="oper-btn btn btn-primary">배송시작</button>
                    <button type="button" class="oper-btn btn btn-primary">배송완료</button>
                </div>
                
            </section>



            <section class="status">

                <h3>진행 상태</h3>
                <div class="status-img">
                    <img src="#" alt="">
                </div>
                <h3>거래 일정</h3>
                <div class="calendar">

                </div>
                <h3>검수 내역</h3>
                <textarea class="check"></textarea>
                
            
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
                                <td class="td2"><a href="#" style="color: white;">123</a></td>
                            </tr>
                            <tr>
                                <td >판매자</td>
                                <td class="td2">누구누구</td>
                            </tr>
                            <tr>
                                <td >구매자</td>
                                <td class="td2">누구누구</td>
                            </tr>
                            <tr>
                                <td>배송상태</td>
                                <td class="td2">검수시작</td>                               </td>
                            </tr>
                            <tr>
                                <td >예약금</td>
                                <td class="td2">얼마</td>
                            </tr>                        
                            <tr class="tr-price">
                                <td>검수자</td>
                                <td class="td2">누구</td>
                            </tr>
                            
                        </table>      
                        
                    </div>
            
                    <div class="btns order gap-2">
                        <input type="submit" class="btn btn-danger" value="완료"></input>
                        <button class="btn btn-primary">취소</button>
                    </div>
                </div>
                

            </section>
        </form>
    </article>

    
</body>
</html>