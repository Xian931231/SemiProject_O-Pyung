package com.opyung.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opyung.biz.MemberBiz;
import com.opyung.dto.MemberBoardDto;


// controller.do로 매핑
@WebServlet("/OpyungController")
public class OpyungController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OpyungController() {
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
	
		
		//메인페이지
		if(command.equals("main")) {
			response.sendRedirect("main.jsp");
		
		
		//로그인 기능
		}else if(command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			MemberBiz biz = new MemberBiz();
			MemberBoardDto memdto = biz.login(id,pw);
			
			if(memdto.getMb_id() != null) {
				session.setAttribute("memdto", memdto);
				session.setMaxInactiveInterval(60*60);
						
				response.sendRedirect("main.jsp");
			}
		
		//로그아웃 기능
		}else if(command.equals("logout")) {
			//세션 정보 삭제
			session.invalidate();
			response.sendRedirect("main.jsp");
		}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
