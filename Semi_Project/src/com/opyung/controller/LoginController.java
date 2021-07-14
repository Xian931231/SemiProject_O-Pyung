package com.opyung.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opyung.biz.Find_idBiz;
import com.opyung.biz.Find_pwBiz;
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

		
		LoginBiz biz = new LoginBiz();
		
		//로그인 기능
		if(command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			MemberDto memdto = biz.login(id,pw);
			
			System.out.println(memdto.getMb_able());
			
			
			if(memdto.getMb_id() != null) {
				
				if(memdto.getMb_able().equals("Y")){
					session.setAttribute("id", memdto.getMb_id());
					session.setAttribute("name", memdto.getMb_name());
					session.setAttribute("role", memdto.getMb_role());
					session.setMaxInactiveInterval(60*60);
					
					response.sendRedirect("main.do?command=main");
				}else {
					response.sendRedirect("login_block.jsp");
				}
			}else {
				response.sendRedirect("login_error.jsp");
			}
			
				
		//로그아웃 기능
		}else if(command.equals("logout")) {
			//세션 정보 삭제
			session.invalidate();
			response.sendRedirect("main.do?command=main");

		//아이디 찾기
		}else if(command.equals("find_id_form")) {
			
			response.sendRedirect("find_id.jsp");
			
		}else if(command.equals("find_id")) {
			  String name = request.getParameter("name");
			  String phone = request.getParameter("phone");
			
			  System.out.println(name+phone);

			  Find_idBiz findbiz = new Find_idBiz(); 
			  String find_id = findbiz.find_id(name,phone);
			
			  System.out.println("id : " +find_id);
			
			  if(find_id != "") {
				System.out.println("조건"+find_id);
				request.setAttribute("find_id", find_id);
				dispatch("found_id.jsp", request, response);
			  }else {
				System.out.println("없음");
				response.sendRedirect("find_id_error.jsp");
			  }
		
		//비밀번호 찾기
		}else if(command.equals("find_pw_form")) {
			
			response.sendRedirect("find_pw.jsp");
			  
	  	}else if(command.equals("find_pw")) {
			String id = request.getParameter("id");
			String phone = request.getParameter("phone");
			
			Find_pwBiz findbiz = new Find_pwBiz();
			String find_pw = findbiz.find_pw(id,phone);
			
			System.out.println(id+phone);
			System.out.println("pw : " +find_pw);
			
			if(find_pw != "") {
				System.out.println("조건"+find_pw);
				request.setAttribute("find_pw", find_pw);
				dispatch("found_pw.jsp",request, response);
			}else {
				System.out.println("없음");
				response.sendRedirect("find_pw_error.jsp");
			}
		
		//회원가입 페이지로 이동
		}else if(command.equals("signupform")) {
			response.sendRedirect("signup.jsp");
		
		//회원가입
		}else if(command.equals("signup")){
			String id = request.getParameter("id");
			String pw = request.getParameter("pwd");
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String postcode = request.getParameter("postcode");
			String address = request.getParameter("address");
			String extraAddress = request.getParameter("extraAddress");
			String detailAddress = request.getParameter("detailAddress");
			String addr = postcode+ " " + address + extraAddress + " " +detailAddress;
			String latitude = request.getParameter("latitude");
			String longitude = request.getParameter("longitude");
			System.out.println(addr);
			
			MemberDto memdto = new MemberDto();
			memdto.setMb_id(id);
			memdto.setMb_pw(pw);
			memdto.setMb_name(name);
			memdto.setMb_email(email);
			memdto.setMb_phone(phone);
			memdto.setMb_addr(addr);
			memdto.setMb_addr_latitude(latitude);
			memdto.setMb_addr_longitude(longitude);
			
			int res = biz.signup(memdto);
			
			if(res>0) {
				System.out.println("성공");
				response.sendRedirect("login.jsp");
			}else {
				System.out.println("실패");
				response.sendRedirect("signup.jsp");

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
