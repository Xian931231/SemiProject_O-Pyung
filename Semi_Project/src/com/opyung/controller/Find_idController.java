package com.opyung.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opyung.biz.Find_idBiz;
import com.opyung.dto.MemberDto;

@WebServlet("/Find_idController")
public class Find_idController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    
    public Find_idController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		String command = request.getParameter("command");
		System.out.println("[command:"+command+"]");

		
		if(command.equals("find_id")) {
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			
			Find_idBiz biz = new Find_idBiz(); 
			MemberDto memdto = biz.find_id(name,phone);
			
			if(memdto.getMb_name() != null) {
				session.setAttribute("name", memdto.getMb_name());
				session.setAttribute("phone", memdto.getMb_phone());
				session.setAttribute("role", memdto.getMb_role());
				session.setMaxInactiveInterval(60*60);
						
				response.sendRedirect("find_id.do?command=found_id");
			}else {
				response.sendRedirect("find_id.do?command=find_id");
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
