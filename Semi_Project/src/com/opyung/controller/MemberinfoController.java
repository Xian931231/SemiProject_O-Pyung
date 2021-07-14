package com.opyung.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
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
			//판매중인 상품
			List<DealBoardDto> sidlist = dealbiz.sidListAll(id);
			//판매중인 상품 수
			int sidlistNum = sidlist.size();
			
			//판매자 거래진행중 조회
			List<DealBoardDto> siddealList = dealbiz.selectSidAll(id);
			//판매자 거래진행중인 상품 수
			int siddealListNum = siddealList.size();
			
			//판매자 거래 종료 수
			List<DealBoardDto> sidendList = dealbiz.selectSidEnd(id);
			int sidendListNum = sidendList.size();
			
			
			List<DealBoardDto> bidlist = dealbiz.bidListAll(id);
			int bidlistNum = bidlist.size();
			
			List<DealBoardDto> biddealList = dealbiz.selectBidAll(id);
			int biddealListNum = biddealList.size();
			
			//구매자 종료 수
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
		
		//회원정보 수정 폼으로
		}else if(command.equals("memupdate")) {
			dispatch("mypage_memUpdate.jsp", request, response);
		
		//회원정보 수정
		}else if(command.equals("meminfoUpdate")) {
			String email = request.getParameter("my_email");
			String pwd = request.getParameter("my_pw");
			String name = request.getParameter("my_name");
			String phone = request.getParameter("my_phone");
			String addr =request.getParameter("addr");
			String latitude = request.getParameter("latitude");
			String longitude = request.getParameter("longitude");
			
			
			memdto.setMb_email(email);
			memdto.setMb_pw(pwd);
			memdto.setMb_name(name);
			memdto.setMb_phone(phone);
			memdto.setMb_phone(phone);
			memdto.setMb_addr(addr);
			memdto.setMb_addr_latitude(latitude);
			memdto.setMb_addr_longitude(longitude);
			
			int res = biz.meminfoUpdate(memdto);
			
			if(res>0) {
				System.out.println("수정 성공");
				response.sendRedirect("memberinfo.do?command=memupdate&id="+id);
			}else {
				System.out.println("수정 실패");
				response.sendRedirect("memberinfo.do?command=memupdate&id="+id);
			}
		
		}else if(command.equals("memberDelete")) {
			ProductBiz ptbiz = new ProductBiz();
			ptbiz.deletePtAll(id);
			int res = biz.memberDelete(memdto);
			if(res>0) {
				System.out.println("삭제 성공");
				response.sendRedirect("login.do?command=logout");
			}else {
				System.out.println("삭제 실패");
				response.sendRedirect("memberinfo.do?command=memupdate&id="+id);
			}
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
			System.out.println(id);
			System.out.println(dto.getMb_no());
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
		}else if(command.equals("isLike")) {
			int ptno = Integer.parseInt(request.getParameter("ptno"));
			
			MemberDto dto = new MemberDto();
			dto.setLikept_memberNo(memdto.getMb_no());
			dto.setLikept_productNo(ptno);
			boolean res = biz.isLikePt(dto);
			 response.getWriter().write(""+res+"");
		//관심상품 목록 조회
		}else if(command.equals("likeList")) {

			ProductBoardDto ptdto = new ProductBoardDto();
			ProductBiz ptbiz = new ProductBiz();
			List<ProductBoardDto> likeList = ptbiz.likeList(id);
			
			request.setAttribute("likeList", likeList);
			dispatch("mypage_likeProduct.jsp", request, response);
		
			
		//계좌번호 페이지
		}else if(command.equals("bank")) {
			List<MemberDto> list = new ArrayList<MemberDto>();
			list = biz.bankList(id);
			System.out.println(list.size());
			request.setAttribute("list", list);
			dispatch("mypage_bank.jsp", request, response);
		//계좌번호 등록
		}else if(command.equals("bankInsert")) {
			String used_bankname = request.getParameter("used_bankname");
			String account_num = request.getParameter("account_num");
			String account_owner = request.getParameter("account_owner");
			
			memdto.setBank_name(used_bankname);
			memdto.setBank_account(account_num);
			memdto.setBank_memname(account_owner);
			
			int res = biz.bankInsert(memdto);
			
			if(res>0) {
				System.out.println("계좌등록 성공");
				response.sendRedirect("memberinfo.do?command=bank&id="+id);
			}else {
				System.out.println("실패");
				response.sendRedirect("memberinfo.do?command=bank&id="+id);
			}
		

		//계좌번호 선택
		}else if(command.equals("bankSelect")) {
			int bankno = Integer.parseInt(request.getParameter("bankno"));
			
			MemberDto dto = new MemberDto();
			dto = biz.bankSelect(bankno,id);
			
			//타입을 json으로 변경
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            //DTO 타입의 어레이리스트를 json 형태로 바꿔주는 구문
            String gson = new Gson().toJson(dto);
           
            try {
                //ajax로 리턴해주는 부분
                response.getWriter().write(gson);
            } catch (JsonIOException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
        //계좌 삭제
		}else if(command.equals("bankDelete")) {
			int bankno = Integer.parseInt(request.getParameter("bankno"));
			System.out.println(bankno);
			
			int res = biz.bankDelete(bankno);
			
			if(res>0) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제실패");
			}
		
		//상품등록할때
		}else if(command.equals("updateScore")) {
			
			int ptno = Integer.parseInt(request.getParameter("ptno"));
			
			//회원 현재 점수
			int score = memdto.getMb_score();
			//업데이트 할 점수
			int scoreUpdate = score + 1;
			System.out.println("업데이트할 점수: " + scoreUpdate + "회원 점수: " + score);
			
			int res = biz.updateScore(id, scoreUpdate);
			
			if(res>0) {
				System.out.println("점수 수정 성공");
				response.sendRedirect("product.do?command=detail&ptno="+ptno);
			}else {
				System.out.println("점수 수정 실패");
			}
			
		//커뮤니티에서 만들때
		}else if(command.equals("updateScoreCommu")) {
			
			int cmb_no = Integer.parseInt(request.getParameter("cmb_no"));
			
			//회원 현재 점수
			int score = memdto.getMb_score();
			//업데이트 할 점수
			int scoreUpdate = score + 1;
			System.out.println("업데이트할 점수: " + scoreUpdate + "회원 점수: " + score);
			
			int res = biz.updateScore(id, scoreUpdate);
			
			if(res>0) {
				System.out.println("점수 수정 성공");
				response.sendRedirect("community.do?command=detail&cmb_no="+cmb_no);
			}else {
				System.out.println("점수 수정 실패");
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
