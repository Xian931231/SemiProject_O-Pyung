package com.opyung.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opyung.biz.ReportBiz;
import com.opyung.dto.ReportBoardDto;

@WebServlet("/ReportController")
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReportController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//command 출력
		String command = request.getParameter("command");
		System.out.println("[command:"+command+"]");
	
		ReportBiz biz = new ReportBiz();
		//신고하기
		if(command.equals("report")) {
			String tid = request.getParameter("tid");
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String referer = request.getHeader("Referer");
			
			
			ReportBoardDto reportDto = new ReportBoardDto();
			reportDto.setReport_tid(tid);
			reportDto.setReport_id(id);
			reportDto.setReport_title(title);
			reportDto.setReport_content(content);
			
			int res = biz.insert(reportDto);
			
			if(res>0) {
				System.out.println("insert성공");
				response.sendRedirect(referer);
			}else {
				System.out.println("insert실패");
				response.sendRedirect(referer);
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
