package com.opyung.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			dealdto = biz.selectOne(dealno);
			String bid = dealdto.getDeal_bid();
			String sid = dealdto.getDeal_sid();
			int productno = dealdto.getDeal_productNo();
			ProductBoardDto ptdto = new ProductBoardDto();
			ptdto = ptBiz.selectOne(productno);
			MemberDto siddto = new MemberDto();
			siddto = memBiz.selectOne(sid);
			MemberDto biddto = new MemberDto();
			biddto = memBiz.selectOne(bid);
			
			request.setAttribute("dealdto", dealdto);
			request.setAttribute("ptdto", ptdto);
			request.setAttribute("siddto", siddto);
			request.setAttribute("biddto", biddto);
			
			dispatch("deal.jsp?", request, response);
			
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
