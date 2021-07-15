package com.opyung.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opyung.biz.ChatBiz;
import com.opyung.biz.DealBiz;
import com.opyung.biz.MemberinfoBiz;
import com.opyung.biz.ProductBiz;
import com.opyung.dto.CheckBoardDto;
import com.opyung.dto.DealBoardDto;
import com.opyung.dto.MemberDto;
import com.opyung.dto.ProductBoardDto;

@WebServlet("/DealController")
public class DealController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DealController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//command 출력
		String command = request.getParameter("command");
		System.out.println("[command:"+command+"]");
	
		//biz: DealBiz 
		DealBiz biz = new DealBiz();				
		ProductBiz ptBiz = new ProductBiz();
		MemberinfoBiz memBiz = new MemberinfoBiz();
		
		//구매요청왔을시 테이블 추가 (DEALBOARD + DEAL_SCHEDULEBOARD + CHECKBOARD)
		if(command.equals("insert")) {
			System.out.println("insert 접속");
			
			if(request.getParameter("id") == null || request.getParameter("id") == "") {
				response.sendRedirect("main.do?command=login");
			}

			
			int ptno = Integer.parseInt(request.getParameter("ptno"));
			int dealno = (biz.lastno())+1;
			String bid = request.getParameter("id");
			System.out.println(bid+ptno);
			
			ProductBoardDto ptdto = ptBiz.selectOne(ptno);
			String sid = ptdto.getProduct_id();
			
			MemberDto biddto = memBiz.selectOne(bid);
			MemberDto siddto = memBiz.selectOne(sid);
			
			//거래 테이블 생성
			int resDeal = biz.insert(dealno,ptdto,bid);
			if(resDeal > 0) {
				System.out.println("거래 테이블 성공");
				//response.sendRedirect("deal.do?command=deal&dealno="+dealno);
			}else {
				System.out.println("거래 테이블 실패");
			}
			
			//거래 일정 테이블 생성
			int resStatus = biz.insertStatus(dealno);
			
			if(resStatus > 0) {
				System.out.println("거래 일정 테이블 성공");
			}else {
				System.out.println("거래 일정 테이블 실패");
			}
			
			//채팅방 생성
			ChatBiz chatbiz = new ChatBiz();
			int reschat =  chatbiz.insertChat(dealno,sid,bid);
			
			//검수 내역 테이블 생성
			int resCheck = biz.insertCheck(dealno);
			
			if(resCheck>0) {
				System.out.println("채팅방 생성");
			}else {
				System.out.println("채팅방 생성실패");
			}
			if(resCheck>0) {
				System.out.println("거래 내역 테이블 생성");
				response.sendRedirect("deal.do?command=deal&dealno="+dealno);
			}else {
				System.out.println("거래 내역 테이블 실패");
			}
			
		//거래페이지 조회
		}else if(command.equals("deal")){
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			
			DealBoardDto dealdto = new DealBoardDto();
			
			//거래정보
			dealdto = biz.selectOne(dealno);
			String bid = dealdto.getDeal_bid();
			String sid = dealdto.getDeal_sid();
			int productno = dealdto.getDeal_productNo();
			
			//상품 정보
			ProductBoardDto ptdto = new ProductBoardDto();
			ptdto = ptBiz.selectOne(productno);
			
			//유저정보
			MemberDto siddto = new MemberDto();
			siddto = memBiz.selectOne(sid);
			MemberDto biddto = new MemberDto();
			biddto = memBiz.selectOne(bid);
			
			request.setAttribute("dealdto", dealdto);
			request.setAttribute("ptdto", ptdto);
			request.setAttribute("siddto", siddto);
			request.setAttribute("biddto", biddto);
			
			dispatch("deal.jsp?", request, response);
		
			
		//구매자가 눌렀을때 예약금창으로 연결
		}else if(command.equals("deal_buyer")) {
			
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			
			DealBoardDto dealdto = new DealBoardDto();
			
			//거래정보(구매자정보)
			dealdto = biz.selectOne(dealno);
			String bid = dealdto.getDeal_bid();
			
			
			
			//결제금액
			int productno = dealdto.getDeal_productNo();
			ProductBoardDto ptdto = new ProductBoardDto();
			ptdto = ptBiz.selectOne(productno);
			int productPrice = ptdto.getProduct_price();
			System.out.println("결제금액: "+ productPrice);
			
			//예약금
			int prePrice = (int)(productPrice*0.1);
			System.out.println("예약금: " + prePrice);
			
			//구매자 정보
			MemberDto biddto = new MemberDto();
			biddto = memBiz.selectOne(bid);
			
			request.setAttribute("prePrice", prePrice);
			request.setAttribute("biddto", biddto);
			request.setAttribute("dealdto", dealdto);
			dispatch("deal_buyer.jsp", request, response);
			
		//거래상태 페이지로
		}else if(command.equals("deal_status")) {
			
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			
			DealBoardDto dealdto = new DealBoardDto();
			
			//거래정보
			dealdto = biz.selectStatus(dealno);
			String bid = dealdto.getDeal_bid();
			String sid = dealdto.getDeal_sid();
			int productno = dealdto.getDeal_productNo();
			
			//상품정보
			ProductBoardDto ptdto = new ProductBoardDto();
			ptdto = ptBiz.selectOne(productno);
			
			//유저정보
			MemberDto siddto = new MemberDto();
			siddto = memBiz.selectOne(sid);
			MemberDto biddto = new MemberDto();
			biddto = memBiz.selectOne(bid);
			
			//검수 내용 출력
			//검수내역 조회
			CheckBoardDto chkdto = new CheckBoardDto();
			chkdto = biz.selectChk(dealno);
			//판매금액
			int ptPrice = ptdto.getProduct_price();
			System.out.println("상품금액: " + ptPrice);
			
			
			//결제금액
			int dealPrice = dealdto.getDeal_price();
			System.out.println("결제금액: "+ dealPrice);
			
			//남은 결제금액
			int restPrice = (ptPrice - dealPrice);
			
			request.setAttribute("chkdto", chkdto);
			request.setAttribute("dealdto", dealdto);
			request.setAttribute("ptdto", ptdto);
			request.setAttribute("siddto", siddto);
			request.setAttribute("biddto", biddto);
			request.setAttribute("dealPrice", dealPrice);
			request.setAttribute("restPrice", restPrice);
			dispatch("deal_status.jsp", request, response);
		
			
		//거래일정 거래상태 수정(구매자가 예약금 결제를 했을경우)
		}else if(command.equals("deal_status_make")) {
			
			//결제금액 받아오기
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			String status = "예약금결제";
			
			//거래날짜(SYSDATE)
			Date date = new Date();
			long timeInMilliSeconds = date.getTime();
			java.sql.Date eDate = new java.sql.Date(timeInMilliSeconds);
			
			//예약금 받아오기
			int prePrice = Integer.parseInt(request.getParameter("prePrice"));
			
			int resStatus = biz.updateStatus(dealno, status, eDate);
			
			if(resStatus > 0) {
				System.out.println("거래상태 수정(예약금결제)");
			}else {
				System.out.println("거래상태 수정실패(예약금결제)");
			}
			
			//결제금액 수정
			int resPrice = biz.updatePrice(dealno, prePrice);
			
			if(resPrice>0) {
				System.out.println("결제금액 수정(예약금)");
				response.sendRedirect("deal.do?command=deal_status&dealno="+dealno);
			}else {
				System.out.println("결제금액 수정 실패(예약금)");
			}
			
			
		//판매자가 검수신청 눌렀을경우 -> 거래상태변경 -> deal_status 페이지로 이동	
		}else if(command.equals("deal_status_update")) {
			
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			String status = "검수신청";
			
			//날짜 변환(SYSDATE)
			Date date = new Date();
			long timeInMilliSeconds = date.getTime();
			java.sql.Date eDate = new java.sql.Date(timeInMilliSeconds);

			
			int res = biz.updateStatus(dealno, status, eDate);
			
			if(res>0) {
				System.out.println("거래상태 수정(검수신청)");
				response.sendRedirect("deal.do?command=deal_status&dealno="+dealno);
			}else {
				System.out.println("거래상태 수정실패(검수신청)");
			}
			
		
		//거래취소 눌렀을시 거래테이블 삭제
		}else if(command.equals("dealTableDelete")) {
			
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			
			int res = biz.deleteDealBoard(dealno);
			
			if(res>0) {
				System.out.println("거래번호"+dealno+"테이블이 삭제되었습니다.");
				response.sendRedirect("main.do?command=main");
			}else {
				System.out.println("거래 테이블 삭제 실패");
			}
			
		
		//거래상태페이지에서 구매자가 구매확정을 누를경우(잔금 결제)
		}else if(command.equals("deal_status_buyer")) {
			
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			
			DealBoardDto dealdto = new DealBoardDto();
			
			//거래정보(구매자정보)
			dealdto = biz.selectOne(dealno);
			String bid = dealdto.getDeal_bid();
			
			//결제금액 받아오기
			int restPrice = Integer.parseInt(request.getParameter("restPrice"));
			System.out.println("결제금액: " + restPrice);
						
			//구매자 정보
			MemberDto biddto = new MemberDto();
			biddto = memBiz.selectOne(bid);
			
			request.setAttribute("restPrice", restPrice);
			request.setAttribute("biddto", biddto);			
			request.setAttribute("dealdto", dealdto);
			dispatch("deal_status_buyer.jsp", request, response);
		
			
		//잔금 결제 후 거래 상태 변경(결제 완료)
		}else if(command.equals("deal_status_update_restPrice")) {
			
			//결제금액 받아오기
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			String status = "결제완료";
			
			//거래날짜(SYSDATE)
			Date date = new Date();
			long timeInMilliSeconds = date.getTime();
			java.sql.Date eDate = new java.sql.Date(timeInMilliSeconds);
			
			//상품금액 가져오기
			DealBoardDto dealdto = new DealBoardDto();				
			//거래 정보 가지고 와서
			dealdto = biz.selectOne(dealno);
			int productno = dealdto.getDeal_productNo();
			//상품 정보 가지고오고
			ProductBoardDto ptdto = new ProductBoardDto();
			ptdto = ptBiz.selectOne(productno);
			//상품금액 불러온다.
			int ptPrice = ptdto.getProduct_price();
			System.out.println("상품금액: " + ptPrice);
			
			int resStatus = biz.updateStatus(dealno, status, eDate);
			
			if(resStatus > 0) {
				System.out.println("거래상태 수정(결제 완료)");
			}else {
				System.out.println("거래상태 수정실패(결제 완료)");
			}
			
			//결제금액 수정
			int resPrice = biz.updatePrice(dealno, ptPrice);
			
			if(resPrice>0) {
				System.out.println("결제금액 수정(결제완료)");
				response.sendRedirect("deal.do?command=deal_status&dealno="+dealno);
			}else {
				System.out.println("결제금액 수정 실패(결제완료)");
			}
			
			
			
		//관리자 수정페이지
		}else if(command.equals("admin")) {
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			
			
			DealBoardDto dealdto = new DealBoardDto();
			
			//거래정보
			dealdto = biz.selectStatus(dealno);
			String bid = dealdto.getDeal_bid();
			String sid = dealdto.getDeal_sid();
			int productno = dealdto.getDeal_productNo();
			
			//상품정보
			ProductBoardDto ptdto = new ProductBoardDto();
			ptdto = ptBiz.selectOne(productno);
			
			//유저정보
			MemberDto siddto = new MemberDto();
			siddto = memBiz.selectOne(sid);
			MemberDto biddto = new MemberDto();
			biddto = memBiz.selectOne(bid);
			
			//검수내역 조회
			CheckBoardDto chkdto = new CheckBoardDto();
			chkdto = biz.selectChk(dealno);
			
			
			
			
			request.setAttribute("dealdto", dealdto);
			request.setAttribute("ptdto", ptdto);
			request.setAttribute("siddto", siddto);
			request.setAttribute("biddto", biddto);
			request.setAttribute("chkdto", chkdto);
			dispatch("deal_status_admin.jsp", request, response);
			
			
			
		//검수내역 작성	
		}else if(command.equals("adminChk")) {
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			String id = request.getParameter("id");
			String content = request.getParameter("content");
			
			System.out.println(dealno+", "+content);
			
			CheckBoardDto chkdto = new CheckBoardDto();
			chkdto.setCheck_dealNo(dealno);
			chkdto.setCheck_id(id);
			chkdto.setCheck_content(content);
			
			int res = biz.updateCheck(dealno,chkdto);
			if(res >0) {
				System.out.println("성공");
				response.sendRedirect("admin.do?command=admin");
			}else {
				System.out.println("실패");
				response.sendRedirect("deal.do?command=admin&dealno="+dealno);
			}
			
			
		//거래확정버튼	
		}else if(command.equals("dealFinish")) {
			
			//계좌 생성
			String id = request.getParameter("member_id"); 
			int bank_no = Integer.parseInt(request.getParameter("bank_no"));
			String used_bankname = request.getParameter("used_bankname");
			String account_num = request.getParameter("account_num");
			String account_owner = request.getParameter("account_owner");
			
			MemberDto memdto = new MemberDto();
			
			memdto.setMb_no(bank_no);
			memdto.setBank_name(used_bankname);
			memdto.setBank_account(account_num);
			memdto.setBank_memname(account_owner);
			
			MemberinfoBiz bizMember = new MemberinfoBiz();
			int resBank = bizMember.bankInsert(memdto);
			
			if(resBank>0) {
				System.out.println("계좌등록 성공");
			}else {
				System.out.println("실패");
			}
			
			//거래상태 변경(거래 확정)
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			String status = "거래확정";
			
			Date date = new Date();
			long timeInMilliSeconds = date.getTime();
			java.sql.Date eDate = new java.sql.Date(timeInMilliSeconds);
			
			int resStatus = biz.updateStatus(dealno, status, eDate);
			
			if(resStatus>0) {
				System.out.println("거래상태 변경 성공(거래확정)");
			}else {
				System.out.println("거래상태 변경 실패(거래확정)");
			}
			
			//삼풍 판매상태 변경
			
			DealBoardDto dealdto = new DealBoardDto();
			
			dealdto = biz.selectStatus(dealno);
			String bid = dealdto.getDeal_bid();
			String sid = dealdto.getDeal_sid();
			int productno = dealdto.getDeal_productNo();
			
			ProductBoardDto ptdto = new ProductBoardDto();
			ptdto = ptBiz.selectOne(productno);
			
			String ptStatus = "판매완료";
			int resProduct = ptBiz.updatePtStatus(productno, ptStatus);
			
			if(resProduct>0) {
				System.out.println("상품 상태 변경 성공(판매완료)");
				response.sendRedirect("memberinfo.do?command=mypage&id="+id);
			}else {
				System.out.println("상품 상태 변경 실패(판매완료)");
			}
			
			
		//직거래 거래확정 상태 변경
		}else if(command.equals("directDeal")) {
			
			String id = request.getParameter("id");
			
			//거래상태 변경(거래 확정)
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			String status = "거래확정";
			
			Date date = new Date();
			long timeInMilliSeconds = date.getTime();
			java.sql.Date eDate = new java.sql.Date(timeInMilliSeconds);
			
			int resStatus = biz.updateStatus(dealno, status, eDate);
			
			if(resStatus>0) {
				System.out.println("거래상태 변경 성공(거래확정)");
			}else {
				System.out.println("거래상태 변경 실패(거래확정)");
			}
			
			//삼풍 판매상태 변경
			
			DealBoardDto dealdto = new DealBoardDto();
			
			dealdto = biz.selectStatus(dealno);
			String bid = dealdto.getDeal_bid();
			String sid = dealdto.getDeal_sid();
			int productno = dealdto.getDeal_productNo();
			
			ProductBoardDto ptdto = new ProductBoardDto();
			ptdto = ptBiz.selectOne(productno);
			
			String ptStatus = "판매완료";
			int resProduct = ptBiz.updatePtStatus(productno, ptStatus);
			
			if(resProduct>0) {
				System.out.println("상품 상태 변경 성공(판매완료)");
				response.sendRedirect("memberinfo.do?command=mypage&id="+id);
			}else {
				System.out.println("상품 상태 변경 실패(판매완료)");
			}
			
		}
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void dispatch(String url,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
