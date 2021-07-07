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


import com.opyung.biz.AdminBiz;
import com.opyung.dto.MemberDto;




@WebServlet("/AdminConrtoller")
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
				
				if(command.equals("list")) {
					List<MemberDto> list = biz.selectAll();
					
					request.setAttribute("list", list);
					dispatch("boardlist.jsp", request, response);
				}
				
				
				
				
				
				
				
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
