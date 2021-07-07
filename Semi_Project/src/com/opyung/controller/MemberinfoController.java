package com.opyung.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opyung.biz.MemberinfoBiz;
import com.opyung.dto.MemberDto;

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
		
		MemberDto memdto = new MemberDto();
		memdto = biz.selectOne(id);
		
		request.setAttribute("memdto", memdto);
		
		//마이페이지 홈
		if(command.equals("mypage")) {
			dispatch("mypage.jsp", request, response);
		}else if(command.equals("memupdate")) {
			dispatch("mypage_memUpdate.jsp", request, response);
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
