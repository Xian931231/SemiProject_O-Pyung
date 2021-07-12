package com.opyung.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opyung.biz.Find_pwBiz;
import com.opyung.dto.MemberDto;

@WebServlet("/Find_pwController")
public class Find_pwController {
private static final long serialVersionUID = 1L;
	
    
    public Find_pwController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		String command = request.getParameter("command");
		System.out.println("[command:"+command+"]");

		
		if(command.equals("find_pw")) {
			String name = request.getParameter("id");
			String phone = request.getParameter("phone");
			
			Find_pwBiz biz = new Find_pwBiz(); 
			MemberDto memdto = biz.find_pw(id,phone);
			
			if(memdto.getMb_id() != null) {
				session.setAttribute("id", memdto.getMb_id());
				session.setAttribute("phone", memdto.getMb_phone());
				session.setAttribute("role", memdto.getMb_role());
				session.setMaxInactiveInterval(60*60);
						
				response.sendRedirect("find_pw.do?command=found_pw");
			}else {
				response.sendRedirect("find_pw.do?command=find_pw");
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}
}
