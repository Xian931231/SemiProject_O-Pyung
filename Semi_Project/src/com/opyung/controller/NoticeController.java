package com.opyung.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
		
		NoticeBiz biz = new NoticeBiz();
		
		
		//입력한 값 가져오기
		if(command.equals("noticewrite")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			//값 확인
			System.out.println(title+","+content);
			
			NoticeBoardDto dto = new NoticeBoardDto();
			dto.setNotice_title(title);
			dto.setNotice_content(content);
			
			boolean res =  biz.insert(dto);
			
			if(res) {
				jsResponse("글 작성 성공","notice.do?command=noticelist",response);
			}else {
				jsResponse("글 작성 실패","notice.do?command=noticewrite",response);
			}
			
		}else if(command.equals("noticedetail")) {
			
			int notice_no = Integer.parseInt(request.getParameter("notice_no"));
			
			NoticeBoardDto dto = biz.selectOne(notice_no);
			
			request.setAttribute("dto", dto);
			
			session.setAttribute("role", session.getAttribute("role"));

			dispatch("notice_detail.jsp",request,response);
			
		}else if(command.equals("noticelist")) {
			
			List<NoticeBoardDto> list = biz.selectAll();
			
			request.setAttribute("list", list);
			
			dispatch("notice.jsp",request,response);
			
		}else if(command.equals("noticedelete")) {
			
			int notice_no = Integer.parseInt(request.getParameter("notice_no"));
			
			boolean res = biz.delete(notice_no);
			
			if(res) {
				jsResponse("글 삭제 성공", "notice.do?command=noticelist", response);
			}else {
				jsResponse("글 삭제 실패", "notice.do?command=noticedetail", response);
			}
			
		}else if(command.equals("updateform")) {
			
			int notice_no = Integer.parseInt(request.getParameter("notice_no"));
			
			NoticeBoardDto dto = biz.selectOne(notice_no);
			
			request.setAttribute("dto", dto);
			
			dispatch("notice_update.jsp", request, response);
			
		}else if(command.equals("noticeupdate")) {
			
			int notice_no = Integer.parseInt(request.getParameter("notice_no"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			NoticeBoardDto dto = new NoticeBoardDto(notice_no,title,content);
			
			boolean res = biz.update(dto);
			
			if(res) {
				jsResponse("수정 완료", "notice.do?command=noticelist&notice_no="+notice_no, response);
			}else {
				jsResponse("수정 실패", "notice.do?command=noticelist&notice_no="+notice_no, response);
			}
		
		}else if(command.equals("noticecheck")) {
			
			dispatch("check.jsp", request, response);
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
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
