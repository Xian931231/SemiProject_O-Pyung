package com.opyung.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

import com.opyung.biz.ChatBiz;
import com.opyung.dto.ChatBoardDto;

@WebServlet("/ChatController")
public class ChatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChatController() {
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
		
		ChatBiz biz = new ChatBiz();
		
		//채팅내용 db저장
		if(command.equals("insertMsg")) {
			String id = request.getParameter("id");
			String msg = request.getParameter("msg");
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			System.out.println(id +" : " + msg +","+dealno);
			
			ChatBoardDto dto = new ChatBoardDto();
			int res = biz.insert(dealno,id,msg);
			
			if(res>0) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
		//채팅내용 조회	
		}else if(command.equals("selectDealno")) {
			System.out.println("조회");
			int dealno = Integer.parseInt(request.getParameter("dealno"));
			
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
