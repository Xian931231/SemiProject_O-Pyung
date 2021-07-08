package com.opyung.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.opyung.biz.AdminBiz;
import com.opyung.dto.MemberDto;




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
				
				//유저 정보 전체 출력
				if(command.equals("userInfo")) {
					List<MemberDto> list = biz.selectAll();
					
					request.setAttribute("list", list);
					dispatch("admin_user.jsp", request, response);
				
				//검색창 통한 정렬 및 검색
					
				}else if(command.equals("serchId")){
					String mb_id = request.getParameter("mb_id");
					
					MemberDto dto = biz.serchId(mb_id);
					
					request.setAttribute("dto", dto);
					dispatch("admin.jsp", request, response);
					
					
				}else if(command.equals("serchName")){
					String mb_name = request.getParameter("mb_name");
					
					MemberDto dto = biz.serchId(mb_name);
					
					request.setAttribute("dto", dto);
					dispatch("admin.jsp", request, response);
					
					
				}else if(command.equals("serchEmail")){
					String mb_email = request.getParameter("mb_email");
					
					MemberDto dto = biz.serchId(mb_email);
					
					request.setAttribute("dto", dto);
					dispatch("admin.jsp", request, response);
					
					
				}else if(command.equals("serchPhone")){
					String mb_phone = request.getParameter("mb_phone");
					
					MemberDto dto = biz.serchId(mb_phone);
					
					request.setAttribute("dto", dto);
					dispatch("admin.jsp", request, response);
					
					
				}else if(command.equals("serchable")){
					String mb_able = request.getParameter("mb_able");
					
					MemberDto dto = biz.serchId(mb_able);
					
					request.setAttribute("dto", dto);
					dispatch("admin.jsp", request, response);
					
					
				}else if(command.equals("admin")){
					
				}
				
				//블랙 버튼 클릭시 로그인 불가
				
				
				
				
				
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
