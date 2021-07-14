package com.opyung.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.opyung.biz.CommentBiz;
import com.opyung.dto.CommuBoardDto;

@WebServlet("/CommentController")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//command 출력
		String command = request.getParameter("command");
		System.out.println("[comment command:"+command+"]");
		
		CommentBiz biz = new CommentBiz();
		
		//댓글 작성
		if(command.equals("insertMsg")) {
			System.out.println("insert 접속");
			int cmb_no = Integer.parseInt(request.getParameter("cmb_no"));
			String id = request.getParameter("id");
			String content = request.getParameter("content");
			
			System.out.println(id);
			System.out.println(cmb_no);
			System.out.println(content);
			
			CommuBoardDto commudto =  new CommuBoardDto();
			commudto.setCcom_cmbNo(cmb_no);
			commudto.setCcom_id(id);
			commudto.setCcom_content(content);
			
			
			int res = biz.insert(commudto);
			
			if (res>0){
				System.out.println("댓글작성 성공");
			}else {
				System.out.println("댓글작성 실패");
			}
		
		//댓글 리스트
		}else if(command.equals("list")) {
			System.out.println("list 접속");
			int cmb_no = Integer.parseInt(request.getParameter("cmb_no"));
			
			List<CommuBoardDto> list =biz.selectCmbnoAll(cmb_no);
			request.setAttribute("commentlist", list);
			
			//타입을 json으로 변경
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            //DTO 타입의 어레이리스트를 json 형태로 바꿔주는 구문
            String gson = new Gson().toJson(list);
           
            try {
                //ajax로 리턴해주는 부분
                response.getWriter().write(gson);
            } catch (JsonIOException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        
        //댓글 수정
		}else if(command.equals("update")){    
			System.out.println("update 접속");
			int ccom_no = Integer.parseInt(request.getParameter("ccom_no"));
			String content = request.getParameter("content");
			System.out.println(content);
			System.out.println(ccom_no);
			
			int res = biz.update(ccom_no,content);
			
			if(res>0) {
				System.out.println("수정성공");
			}else {
				System.out.println("수정실패");
			}
			
        //댓글 삭제
		}else if(command.equals("delete")) {
			System.out.println("delete 접속");
			int ccom_no = Integer.parseInt(request.getParameter("ccom_no"));
			System.out.println(ccom_no);
			
			int res = biz.delete(ccom_no);
			
			if(res>0) {
				System.out.println("삭제성공");
			}else {
				System.out.println("삭제실패");
			}
		}
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
