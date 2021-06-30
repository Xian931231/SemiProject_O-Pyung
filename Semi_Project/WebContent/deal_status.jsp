<!-- 거래 상태 페이지(구매자, 판매자, 관리자 접근가능) -->

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
    <link rel="stylesheet" href="./css/deal_status.css">
    <script src="./js/deal_status.js" defer></script>
    <title>Document</title>
</head>
<body>
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
                            <td class="td2">결제완료</td>
                        </tr>
                        <tr>
                            <td >예약금</td>
                            <td class="td2">얼마</td>
                        </tr>                        
                        <tr class="tr-price">
                            <td>결제 금액</td>
                            <td class="td2">얼마</td>
                        </tr>
                        
                    </table>      
                    
                </div>
        
                <div class="btns gap-2">
                    <button class="btn btn-danger">구매확정</button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target=".modal" >거래확정</button>

                    <button class="btn btn-primary">구매취소</button>
                    
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
        <div class="modal-body">
            <form>
            <div class="mb-3">
                <label for="bank-name" class="col-form-label">은행:</label>
                <select name="bank-name" class="form-select" id="">
                    <option value="" selected>은행선택</option>
                    <option value="kb">KB국민은행</option>
                    <option value="keb">KEB하나은행</option>
                    <option value="sh">신한은행</option>
                    <option value="wr">우리은행</option>
                    <option value="nh">NH농협</option>
                    <option value="ibk">IBK기업은행</option>
                    <option value="kdb">KDB산업은행</option>
                    <option value="kc">한국씨티은행</option>
                    <option value="sc">SC제일은행</option>
                    <option value="none">무통장</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="bank-number" class="col-form-label">계좌번호:</label>
                <input type="text" class="form-control" id="bank-number">
            </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary">완료</button>
        </div>
        </div>
    </div>
    </div>
</body>
</html>