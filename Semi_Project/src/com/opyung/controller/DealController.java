package com.opyung.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opyung.biz.DealBiz;
import com.opyung.biz.MemberinfoBiz;
import com.opyung.biz.ProductBiz;
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
		
		//구매요청왔을시 테이블 추가
		if(command.equals("insert")) {
			System.out.println("insert 접속");
			int ptno = Integer.parseInt(request.getParameter("ptno"));
			int dealno = (biz.lastno())+1;
			String bid = request.getParameter("id");
			System.out.println(bid+ptno);

			
			ProductBoardDto ptdto = ptBiz.selectOne(ptno);
			String sid = ptdto.getProduct_id();
			
			MemberDto biddto = memBiz.selectOne(bid);
			MemberDto siddto = memBiz.selectOne(sid);
			
			int res = biz.insert(dealno,ptdto,bid);
			if(res>0) {
				System.out.println("성공");
				response.sendRedirect("deal.do?command=deal&dealno="+dealno);
			}else {
				System.out.println("실패");
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
			int dealprice = dealdto.getDeal_price();
			System.out.println("결제금액: "+ dealprice);
			
			//예약금
			int prePrice = (int)(dealprice*0.1);
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
			
			//결제금액
			int dealPrice = dealdto.getDeal_price();
			System.out.println("결제금액: "+ dealPrice);
			
			//예약금
			int prePrice = (int)(dealPrice*0.1);
			System.out.println("예약금: " + prePrice);
			
			//남은 결제금액
			int restPrice = (dealPrice - prePrice);
			
			request.setAttribute("dealdto", dealdto);
			request.setAttribute("ptdto", ptdto);
			request.setAttribute("siddto", siddto);
			request.setAttribute("biddto", biddto);
			request.setAttribute("prePrice", prePrice);
			request.setAttribute("restPrice", restPrice);
			dispatch("deal_status.jsp", request, response);
		
			
		//거래일정 테이블 생성(구매자가 예약금 결제를 했을경우)
		}else if(command.equals("deal_status_make")) {
			
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			
			int res = biz.insertStatus(dealno);
			
			if(res>0) {
				System.out.println("거래일정 생성 성공");
				response.sendRedirect("deal.do?command=deal_status&dealno="+dealno);
			}else {
				System.out.println("db생성 추가 실패 확인바람");
			}
			
			
		//판매자가 검수신청 눌렀을경우 -> 거래상태변경 -> deal_status 페이지로 이동	
		}else if(command.equals("deal_status_update")) {
			
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			String status = "검수신청";
			String eDate = "SYSDATE";
			
			
			int res = biz.updateStatus(dealno, status, eDate);
			
			if(res>0) {
				System.out.println("거래상태 수정(검수신청)");
				response.sendRedirect("deal.do?command=deal_status&dealno="+dealno);
			}else {
				System.out.println("거래상태 수정실패(검수신청)");
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
