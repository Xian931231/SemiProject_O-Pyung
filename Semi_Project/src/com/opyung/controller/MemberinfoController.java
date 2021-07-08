package com.opyung.controller;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/MemberinfoController")
public class MemberinfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberinfoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		//command 출력
		String command = request.getParameter("command");
		System.out.println("[command:"+command+"]");
		
		MemberinfoBiz biz = new MemberinfoBiz();
		String id = request.getParameter("id");
		System.out.println(id);
		
		//객체 생성
		MemberDto memdto = new MemberDto();
		memdto = biz.selectOne(id);
		DealBoardDto dealdto = new DealBoardDto();
		DealBiz dealbiz = new DealBiz();
		
		//회원 정보 dto 객체
		request.setAttribute("memdto", memdto);
		
		
		//마이페이지 홈
		if(command.equals("mypage")) {
			List<DealBoardDto> sidlist = dealbiz.sidListAll(id);
			List<DealBoardDto> bidlist = dealbiz.bidListAll(id);
			int sidlistNum = sidlist.size();
			int bidlistNum = bidlist.size();
			
			
			List<DealBoardDto> siddealList = dealbiz.selectSidAll(id);
			int siddealListNum = siddealList.size();
			List<DealBoardDto> sidendList = dealbiz.selectSidEnd(id);
			int sidendListNum = sidendList.size();
			
			List<DealBoardDto> biddealList = dealbiz.selectBidAll(id);
			int biddealListNum = biddealList.size();
			List<DealBoardDto> bidendList = dealbiz.selectBidEnd(id);
			int bidendListNum = bidendList.size();
			
			
			request.setAttribute("sidlist", sidlist);
			request.setAttribute("bidlist", bidlist);
			request.setAttribute("sidlistNum", sidlistNum);
			request.setAttribute("bidlistNum", bidlistNum);
			request.setAttribute("siddealListNum", siddealListNum);
			request.setAttribute("sidendListNum", sidendListNum);
			request.setAttribute("biddealListNum", biddealListNum);
			request.setAttribute("bidendListNum", bidendListNum);
			
			
			dispatch("mypage.jsp", request, response);
		}else if(command.equals("memupdate")) {
			dispatch("mypage_memUpdate.jsp", request, response);
		
		//판매내역
		}else if(command.equals("sell")) {
			
			List<DealBoardDto> dealList = dealbiz.selectSidAll(id);
			System.out.println(dealList.size());
			request.setAttribute("dealList", dealList);
			
			List<DealBoardDto> endList = dealbiz.selectSidEnd(id);
			request.setAttribute("endList", endList);
			
			int dealListNum = dealList.size();
			int endListNum = endList.size();
			
			request.setAttribute("dealListNum", dealListNum);
			request.setAttribute("endListNum", endListNum);
			
			dispatch("mypage_sellHistory.jsp", request, response);
		
		//구매내역
		}else if(command.equals("purchase")) {
			
			List<DealBoardDto> dealList = dealbiz.selectBidAll(id);
			System.out.println(dealList.size());
			request.setAttribute("dealList", dealList);
			
			List<DealBoardDto> endList = dealbiz.selectBidEnd(id);
			request.setAttribute("endList", endList);
			
			
			int dealListNum = dealList.size();
			int endListNum = endList.size();
			
			request.setAttribute("dealListNum", dealListNum);
			request.setAttribute("endListNum", endListNum);
			
			
			dispatch("mypage_purchaseHistory.jsp", request, response);
		
		//거래진행상황
		}else if(command.equals("deal")) {

			List<DealBoardDto> dealList = dealbiz.selectStatusAll(id);
			//dealdto = dealbiz.selectStatusAll(id);
			System.out.println(dealList.size());
			request.setAttribute("dealList", dealList);
			dispatch("mypage_dealProgress.jsp", request, response);
		
		
		//관심상품
		}else if(command.equals("like")) {
			int ptno = Integer.parseInt(request.getParameter("ptno"));
			
			MemberDto dto = new MemberDto();
			dto.setLikept_memberNo(memdto.getMb_no());
			dto.setLikept_productNo(ptno);
			
			boolean res = biz.isLikePt(dto);
			System.out.println(res);
			if(!res) {
				int res1 = biz.likeInsert(dto);
				if(res1>0) {
					System.out.println("관심상품 등록성공");
				}else {
					System.out.println("실패");
				}
			}else {
				int res1 = biz.likeDelete(dto);
				if(res1>0) {
					System.out.println("관심상품 삭제성공");
				}else {
					System.out.println("실패");
				}
			}
			
		//관심상품 목록 조회
		}else if(command.equals("likeList")) {

			ProductBoardDto ptdto = new ProductBoardDto();
			ProductBiz ptbiz = new ProductBiz();
			List<ProductBoardDto> likeList = ptbiz.likeList(id);
			
			request.setAttribute("likeList", likeList);
			dispatch("mypage_likeProduct.jsp", request, response);
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
