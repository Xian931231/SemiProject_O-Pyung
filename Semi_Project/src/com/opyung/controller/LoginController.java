package com.opyung.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opyung.biz.LoginBiz;
import com.opyung.dto.MemberDto;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
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

		
		//로그인 기능
		if(command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			LoginBiz biz = new LoginBiz();
			MemberDto memdto = biz.login(id,pw);
			
			if(memdto.getMb_id() != null) {
				session.setAttribute("memdto", memdto);
				session.setMaxInactiveInterval(60*60);
						
				response.sendRedirect("main.do?command=main");
			}else {
				response.sendRedirect("main.do?command=login");
			}
				
		//로그아웃 기능
		}else if(command.equals("logout")) {
			//세션 정보 삭제
			session.invalidate();
			response.sendRedirect("main.do?command=main");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
