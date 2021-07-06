package com.opyung.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainController() {
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
				}else if(command.equals("notice")) {
					response.sendRedirect("notice.jsp");
				}else if(command.equals("login")) {
					String referer = request.getHeader("Referer");
					request.getSession().setAttribute("redirectURI", referer);
					response.sendRedirect("login.jsp");
				}else if(command.equals("community")) {
					response.sendRedirect("community.jsp");
				}else if(command.equals("shop")) {
					response.sendRedirect("shop.jsp");
				}else if(command.equals("mypage")) {
					
					String role = (String) session.getAttribute("role");
					System.out.println("나의 ROLE은: "+ role);
					
					if(role.equals("ADMIN")) {
						response.sendRedirect("adminpage.jsp");
					}else {
						response.sendRedirect("mypage.jsp");
					}
				}
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
