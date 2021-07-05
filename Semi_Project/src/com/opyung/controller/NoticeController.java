package com.opyung.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opyung.biz.NoticeBiz;
import com.opyung.dto.NoticeBoardDto;

@WebServlet("/NoticeController")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeController() {
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
		
		
		//입력한 값 가져오기
		if(command.equals("noticewrite")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String id = request.getParameter("id");
			
			//값 확인
			System.out.println(id+","+title+","+content);
			
			NoticeBoardDto dto = new NoticeBoardDto();
			dto.setNotice_title(title);
			dto.setNotice_content(content);
			dto.setNotice_id(id);
			
			
			
			NoticeBiz biz = new NoticeBiz();
			
			boolean res =  biz.insert(dto);
			
			if(res) {
				jsResponse("글 작성 성공","notice.do?command=noticeBoard",response);
			}else {
				jsResponse("글 작성 실패","notice.do?command=noticewrite",response);
			}
			
		}else if(command.equals("noticedetail")) {
			
		}
	
	}

	private void jsResponse(String msg, String url,HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"
				  + "alert('"+msg+"');"
				  + "location.href = '"+url+"';"
				  + "</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
