package com.opyung.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.opyung.biz.AdminBiz;
import com.opyung.dao.ReportDao;
import com.opyung.dto.DealBoardDto;
import com.opyung.dto.MemberDto;
import com.opyung.dto.ReportBoardDto;





@WebServlet("/AdminController")
public class AdminConrtoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminConrtoller() {
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
				
				AdminBiz biz = new AdminBiz();
				
				
				///////////////////admin_main/////////////////////
				//검수대기만보이게 '검수신청'
				if(command.equals("admin")){
					List<DealBoardDto> list = biz.dealAll();
					
					List<ReportBoardDto> relist = biz.reportAll();
					int countnull1 = relist.size();
					
					List<ReportBoardDto> count = biz.count();
					int count1 = count.size();
					
					List<DealBoardDto> countready = biz.countready(); 
					int countready1 = countready.size();
					List<DealBoardDto> counting = biz.counting();
					int counting1 = counting.size();
					List<DealBoardDto> countgo = biz.countgo();
					int countgo1 = countgo.size();
					
					request.setAttribute("countnull", countnull1);
					request.setAttribute("count", count1);
					request.setAttribute("list", relist);
					request.setAttribute("countready", countready1);
					request.setAttribute("counting", counting1);
					request.setAttribute("countgo", countgo1);
					request.setAttribute("deal", list);
					dispatch("admin.jsp", request, response);
				
				}
				
				
				///////////////////admin_user/////////////////////
				//유저 정보 전체 출력 
				
				else if(command.equals("userInfo")) {
					
					List<MemberDto> list = biz.selectAll();
				
					
					
				
					request.setAttribute("list", list);
					dispatch("admin_user.jsp", request, response);
				
				
				//블랙 처리	
				}else if(command.equals("black")) {
					String mb_id = request.getParameter("mb_id");
					String blackStatus = request.getParameter("blackStatus");
					
					MemberDto dto = biz.selectOne(mb_id);
	
					if(blackStatus.equals("black")) {

						boolean res = biz.black(dto);
						
						if(res) {
							jsResponse("블랙처리되었습니다.", "admin.do?command=userInfo", response);
						}else {
							dispatch("admin.do?command=userInfo", request, response);
						}
						
					}else {
						
						int res = biz.blackCancel(dto);
						
						if(res>0) {
							jsResponse("블랙해지 처리되었습니다.", "admin.do?command=userInfo", response);
						}else {
							dispatch("admin.do?command=userInfo", request, response);
						}
						
					}
					
					
					
				
				
				//검색창 통한 정렬 및 검색
					
				}else if(command.equals("search")){
					String keyword = request.getParameter("keyword");
					String keyField = request.getParameter("keyField");
					
					List<MemberDto> list = biz.search(keyword,keyField);
					
					request.setAttribute("list", list);
					
					dispatch("admin_user.jsp", request, response);
					
					
				
					
				}
				
				
				////////////////////admin_deal/////////////////////////////
				else if(command.equals("deal")) {
					List<DealBoardDto> list = biz.dealAll();
					
					
					List<DealBoardDto> countready = biz.countready(); 
					int countready1 = countready.size();
					List<DealBoardDto> counting = biz.counting();
					int counting1 = counting.size();
					List<DealBoardDto> countgo = biz.countgo();
					int countgo1 = countgo.size();
					
					
					
					request.setAttribute("ingAll", counting);
					request.setAttribute("goAll", countgo);
					
					request.setAttribute("countready", countready1);
					request.setAttribute("counting", counting1);
					request.setAttribute("countgo", countgo1);
					request.setAttribute("deal", list);
					dispatch("admin_deal.jsp", request, response);
					
					
				}
				else if(command.equals("dealInfo")) {
					int sche_no = Integer.parseInt(request.getParameter("dealno"));
					String dealselect = request.getParameter("dealselect");
					String start = request.getParameter("start");
					String end = request.getParameter("end");
					
					
					
					DealBoardDto dto = biz.dealselect(sche_no);
					
					boolean res = biz.dealupdate(dealselect,start,end,sche_no);
					
					if(res) {
						jsResponse("입력이 완료되었습니다.", "admin.do?command=deal", response);
					}else {
						dispatch("admin.do?command=deal", request, response);
					}
					
				}
				
				
				///////////////////admin_report/////////////////////
				
				/*전체를 보내지말고 완료 날짜에 null값인 데이터들만 불러온다.(처리완료)*/
				else if(command.equals("report")) {
					List<ReportBoardDto> list = biz.reportAll();
					int countnull1 = list.size();
					List<ReportBoardDto> count = biz.count();
					int count1 = count.size();
					
					
					
					request.setAttribute("countnull", countnull1);
					request.setAttribute("count", count1);
					request.setAttribute("count1", count);
					request.setAttribute("list", list);
					dispatch("admin_report.jsp", request, response);
					/*처리버튼를 하면 완료날짜업데이트하고 score에 점수를 -1 한다.*/
				}else if(command.equals("treat")) {
					int report_no =  Integer.parseInt(request.getParameter("report_no"));
					String report_tid = request.getParameter("report_tid");
					String report_treat = request.getParameter("report_treat");
					
					ReportBoardDto dto = biz.reselect(report_no);
					
					boolean res = biz.edate(report_no);
					
					if(report_treat.equals("yes"))
						if(res) {
							response.sendRedirect("admin.do?command=minus&report_tid="+report_tid);
						}else {
							dispatch("admin.do?command=report", request, response);
					}else {
					dispatch("admin.do?command=report", request, response);
					}

				}else if(command.equals("minus")) {
					String mb_id = request.getParameter("report_tid");
					
					MemberDto dto = biz.selectOne(mb_id);
					
					boolean res = biz.minus(mb_id);
					
					
					
					if(res) {
						jsResponse("점수 차감 처리되었습니다.", "admin.do?command=report", response);
					}else {
						dispatch("admin.do?command=report", request, response);
					}
					
				}
				
				
				
				
	}
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"
				+"alert('"+msg+"');"
				+"location.href='"+url+"';"
				+"</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	
	
	
	//dispatch
	
		private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			RequestDispatcher dispatch = request.getRequestDispatcher(url);
			dispatch.forward(request, response);
		}
		
		
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		
		
		}
		
		

}
