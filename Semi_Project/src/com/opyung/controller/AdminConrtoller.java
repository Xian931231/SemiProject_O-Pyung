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
import com.sun.java.util.jar.pack.Package.Class.Member;




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
				
				
				//블랙 처리	
				}else if(command.equals("black")) {
					String mb_id = request.getParameter("mb_id");
					
					MemberDto dto = biz.selectOne(mb_id);
					
					boolean res = biz.black(dto);
					
					if(res) {
						jsResponse("블랙처리되었습니다.", "admin.do?command=userInfo", response);
					}else {
						dispatch("admin.do?command=userInfo", request, response);
					}
				
				
				//검색창 통한 정렬 및 검색
					
				}else if(command.equals("search")){
					String keyword = request.getParameter("keyword");
					String keyField = request.getParameter("keyField");
					
					MemberDto dto = biz.selectsearch();
					
					
					
					
				}else if(command.equals("serchName")){
					String mb_name = request.getParameter("mb_name");
					
					MemberDto dto = biz.serchId(mb_name);
					
					request.setAttribute("dto", dto);
					dispatch("admin_user.jsp", request, response);
					
					
				}else if(command.equals("serchName")){
					String mb_name = request.getParameter("mb_name");
					
					MemberDto dto = biz.serchId(mb_name);
					
					request.setAttribute("dto", dto);
					dispatch("admin_user.jsp", request, response);
					
					
				}else if(command.equals("serchEmail")){
					String mb_email = request.getParameter("mb_email");
					
					MemberDto dto = biz.serchId(mb_email);
					
					request.setAttribute("dto", dto);
					dispatch("admin_user.jsp", request, response);
					
					
				}else if(command.equals("serchPhone")){
					String mb_phone = request.getParameter("mb_phone");
					
					MemberDto dto = biz.serchId(mb_phone);
					
					request.setAttribute("dto", dto);
					dispatch("admin_user.jsp", request, response);
					
					
				}else if(command.equals("serchable")){
					String mb_able = request.getParameter("mb_able");
					
					MemberDto dto = biz.serchId(mb_able);
					
					request.setAttribute("dto", dto);
					dispatch("admin_user.jsp", request, response);
					
					
				}else if(command.equals("admin")){
					
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
