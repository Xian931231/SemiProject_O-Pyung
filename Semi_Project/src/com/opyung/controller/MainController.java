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

import com.opyung.biz.ProductBiz;
import com.opyung.dto.ProductBoardDto;

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
			List<ProductBoardDto> list = new ArrayList<ProductBoardDto>();
			
			ProductBiz biz = new ProductBiz();
			
			list = biz.selectAll();
			request.setAttribute("list", list);

			String category = "그래픽카드";
			List<ProductBoardDto> list2 = biz.selectAll(category);
			request.setAttribute("list2", list2);
			
			category = "마우스";
			List<ProductBoardDto> list3 = biz.selectAll(category);
			request.setAttribute("list3", list3);
			
			category = "RAM";
			List<ProductBoardDto> list4 = biz.selectAll(category);
			request.setAttribute("list4", list4);
			
			category = "케이스";
			List<ProductBoardDto> list5 = biz.selectAll(category);
			request.setAttribute("list5", list5);
			
			dispatch("main.jsp", request, response);
		
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
						response.sendRedirect("admin.do?command=admin");
					}else {
						response.sendRedirect("memberinfo.do?command=mypage&id=ADMIN");
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
