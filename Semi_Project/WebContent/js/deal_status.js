var wh = window.innerHeight;

$(document).ready(function(){
    $('.chat').css('height',$(window).innerHeight()*0.7);
    $('.chat-content').focus();

    var str = $('.td2:eq(3)').text();
    switch (str) {
        case "검수시작":
            $('.status-img img').attr("src","status/2.png");
            $('.oper-btn').eq(0).attr("disabled",false);
            $('.oper-btn').eq(1).attr("disabled",false);
            $('.oper-btn').eq(2).attr("disabled",true);
            $('.oper-btn').eq(3).attr("disabled",true);
            break;
        case "검수완료":
            $('.status-img img').attr("src","status/3.png");
            $('.oper-btn').eq(0).attr("disabled",false);
            $('.oper-btn').eq(1).attr("disabled",false);
            $('.oper-btn').eq(2).attr("disabled",false);
            $('.oper-btn').eq(3).attr("disabled",true);
            break;
        case "배송시작":
            $('.status-img img').attr("src","status/4.png");
            $('.oper-btn').eq(0).attr("disabled",false);
            $('.oper-btn').eq(1).attr("disabled",false);
            $('.oper-btn').eq(2).attr("disabled",false);
            $('.oper-btn').eq(3).attr("disabled",false);
            break;
        case "배송완료":
            $('.status-img img').attr("src","status/5.png");
            $('.oper-btn').eq(0).attr("disabled",false);
            $('.oper-btn').eq(1).attr("disabled",false);
            $('.oper-btn').eq(2).attr("disabled",false);
            $('.oper-btn').eq(3).attr("disabled",false);
            break;        
        default:
            $('.status-img img').attr("src","status/1.png");
            $('.oper-btn').eq(0).attr("disabled",false);
            $('.oper-btn').eq(1).attr("disabled",true);
            $('.oper-btn').eq(2).attr("disabled",true);
            $('.oper-btn').eq(3).attr("disabled",true);
            break;
    }
});


$('.oper-btn').on('click',function(){
    $('.td2:eq(3)').text($(this).text());
    /*
    버튼 클릭시 해당 거래넘버 중 버튼에 해당하는 거래 상태가 있는지 확인하고
    버튼에 해당하는 거래상태가 없다면 insert하고 전 상태의 테이블id를 찾아 endtime에 sysdate를 update
    거래 상태가 있다면 update로 starttime을 sysdate로 update하고 전 상태의 테이블 id를 찾아 endtime을 sysdate로 update
    
    이후 delete로 이후의 거래상테 데이터 삭제
    */

    var idx = $('.oper-btn').index(this);
    switch (idx) {
        case 0:
            $('.oper-btn').eq(0).attr("disabled",false);
            $('.oper-btn').eq(1).attr("disabled",false);
            $('.oper-btn').eq(2).attr("disabled",true);
            $('.oper-btn').eq(3).attr("disabled",true);
            break;
        case 1:
            $('.oper-btn').eq(0).attr("disabled",false);
            $('.oper-btn').eq(1).attr("disabled",false);
            $('.oper-btn').eq(2).attr("disabled",false);
            $('.oper-btn').eq(3).attr("disabled",true);
            break;
        case 2:
            $('.oper-btn').eq(0).attr("disabled",false);
            $('.oper-btn').eq(1).attr("disabled",false);
            $('.oper-btn').eq(2).attr("disabled",false);
            $('.oper-btn').eq(3).attr("disabled",false);
            break;
        case 3:
            $('.oper-btn').eq(0).attr("disabled",false);
            $('.oper-btn').eq(1).attr("disabled",false);
            $('.oper-btn').eq(2).attr("disabled",false);
            $('.oper-btn').eq(3).attr("disabled",false);
            break;        
        default:
            $('.oper-btn').eq(0).attr("disabled",false);
            $('.oper-btn').eq(1).attr("disabled",true);
            $('.oper-btn').eq(2).attr("disabled",true);
            $('.oper-btn').eq(3).attr("disabled",true);
            break;
    }
});



$(function(){
    var str = $('.td2:eq(3)').text();
	switch (str) {
		case "거래신청":
		    $('.status-img img').attr("src","./img/deal_status/거래신청.png");
			break;
        case "예약금결제":
            $('.status-img img').attr("src","./img/deal_status/예약금결제.png");
            break;
        case "검수신청":
            $('.status-img img').attr("src","./img/deal_status/검수신청.png");
            break;
        case "판매자 발송준비":
            $('.status-img img').attr("src","./img/deal_status/판매자발송준비.png");
            break;
        case "검수중":
            $('.status-img img').attr("src","./img/deal_status/검수중.png");
            break;
        case "구매자발송준비":
            $('.status-img img').attr("src","./img/deal_status/구매자발송준비.png");
            break;   
        case "결제완료":
            $('.status-img img').attr("src","./img/deal_status/결제완료.png");
            break;
        case "배송완료":
            $('.status-img img').attr("src","./img/deal_status/배송완료.png");
            break;   
        case "거래확정":
            $('.status-img img').attr("src","./img/deal_status/거래확정.png");
            break;              
        default:
            $('.status-img img').attr("src","./img/deal_status/거래없음.png");
            break;
    }
});


