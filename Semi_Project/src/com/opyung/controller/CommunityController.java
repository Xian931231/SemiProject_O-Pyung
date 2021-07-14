package com.opyung.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.opyung.biz.CommunityBiz;
import com.opyung.dto.CommuBoardDto;

@WebServlet("/CommunityController")
public class CommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommunityController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		//command 출력
		String command = request.getParameter("command");
		System.out.println("[command:"+command+"]");
		
		CommunityBiz biz = new CommunityBiz();
		
		//최신순()
		if(command.equals("commu")) {
			List<CommuBoardDto> list = biz.selectAll();
			
			request.setAttribute("list", list);
			dispatch("community.jsp", request, response);
			

		//디테일 화면
		}else if(command.equals("detail")) {
			int cmb_no = Integer.parseInt(request.getParameter("cmb_no"));
			System.out.println(cmb_no);
			CommuBoardDto commudto = biz.selectOne(cmb_no);
			
			request.setAttribute("commudto", commudto);
			dispatch("community_detail.jsp", request, response);
		
		
		//커뮤니티 게시글등록
		}else if(command.equals("write")) {
			int cmb_no = (biz.lastno())+1;
			System.out.println(cmb_no);
			String id = "";
			String content = "";
			String imgname= "";
			String type = "";
			int size = 0;
			
		    // 이미지는 서버에 저장
		    String saveDir = request.getServletContext().getRealPath("upload"); // 저장할 경로 지정
		 
		    // 유효한 request인지 확인
		    boolean isMultipart = FileUpload.isMultipartContent(request);
		    UUID uuid = UUID.randomUUID();
		    String fileName = uuid.toString(); // 업로드한 파일의 이름을 저장할 변수 설정
		    
		    try {
		        if(isMultipart) {
		            DiskFileItemFactory factory = new DiskFileItemFactory();
		 
		            // 파일 업로드 핸들러 생성
		            ServletFileUpload upload = new ServletFileUpload(factory);
		 
		            
		            // request parsing
		            List<FileItem> items = upload.parseRequest(request);
		            Iterator<FileItem> iter = items.iterator();
		            System.out.println(items.size());
		            while (iter.hasNext()) {
		                FileItem item = iter.next();
		 
		 
		                if (item.isFormField()) {
		                    // file 형식이 아닐 때
		                	//System.out.println(item.getFieldName());
		                	//System.out.println(item.getString());
		                	if(item.getFieldName().equals("id")) {
		                		id = item.getString();
		                	}else {
		                		content = item.getString();
		                		//한글깨짐
		                		content = new String(content.getBytes("8859_1"),"UTF-8");

		                	}
		                	
		                	
		                } else {
		                    // file 형식일 때
		                    fileName = fileName+"_"+new File(item.getName()).getName();
		                    
		                    //
		                     type = "." + item.getContentType().substring(item.getContentType().lastIndexOf("/")+1);
		                     size = (int)item.getSize();
		                     imgname = fileName.substring(0,fileName.indexOf("."));

		                    //
		                    File storeFile = new File(saveDir + "/"  + imgname + type);
		                    //commu.put("commu_img",fileName);
		                    // 파일을 업로드
		                    item.write(storeFile);
		                    
		                    
		                }
		            }
		            CommuBoardDto dto = new CommuBoardDto();
			        dto.setCmb_no(cmb_no);
	                dto.setCmb_id(id);
	                dto.setCmb_content(content);
	                dto.setCimg_name(imgname);
	                dto.setCimg_size(size);
	                dto.setCimg_type(type);
	                dto.setCimg_src(saveDir);
	                int res1 = biz.insert(dto);
	                
	                
	                if(res1>0) {
	                	int res2 = biz.insertImg(dto);
	                	if(res2>0) {
	                		System.out.println("성공");
	                		response.sendRedirect("memberinfo.do?command=updateScoreCommu&id="+dto.getCmb_id()+"&cmb_no="+cmb_no);
	                		//response.sendRedirect("community.do?command=detail&cmb_no="+cmb_no);
	                	}else {
	                	System.out.println("업로드실패");
	                	response.sendRedirect("community.do?command=detail&cmb_no="+(cmb_no));
	                	}
	                }else {
	                	response.sendRedirect("main.do?command=comunity");
	                }
		        }
		        
		    }
		    catch ( Exception e ) { System.out.println(e); }
		    
		//update폼으로 이동    
		}else if(command.equals("updateform")) {
			int cmb_no = Integer.parseInt(request.getParameter("cmb_no"));
			System.out.println(cmb_no);
			
			CommuBoardDto commudto = biz.selectOne(cmb_no);
			request.setAttribute("commudto", commudto);
			dispatch("community_update.jsp", request, response);
		
		//update 요청
		}else if(command.equals("update")) {
			int cmb_no = Integer.parseInt(request.getParameter("cmb_no"));
			String content = "";
			String imgname= "";
			String type = "";
			int size = 0;
			CommuBoardDto dto = new CommuBoardDto();
			dto.setCmb_no(cmb_no);
			// 이미지는 서버에 저장
		    String saveDir = request.getServletContext().getRealPath("upload"); // 저장할 경로 지정
		 
		    // 유효한 request인지 확인
		    boolean isMultipart = FileUpload.isMultipartContent(request);
		    UUID uuid = UUID.randomUUID();
		    String fileName = uuid.toString(); // 업로드한 파일의 이름을 저장할 변수 설정
		    
		    try {
		        if(isMultipart) {
		            DiskFileItemFactory factory = new DiskFileItemFactory();
		 
		            // 파일 업로드 핸들러 생성
		            ServletFileUpload upload = new ServletFileUpload(factory);
		 
		            
		            // request parsing
		            List<FileItem> items = upload.parseRequest(request);
		            Iterator<FileItem> iter = items.iterator();
		            System.out.println(items.size());
		            while (iter.hasNext()) {
		                FileItem item = iter.next();
		 
		 
		                if (item.isFormField()) {
		                    // file 형식이 아닐 때
		                	System.out.println(item.getFieldName());
		                	System.out.println(item.getString());
		                	if(item.getFieldName().equals("content")) {
		                		content = item.getString();
		                		//한글깨짐
		                		content = new String(content.getBytes("8859_1"),"UTF-8");
		                	
		                	}
		                	
		                	
		                } else {
		                    // file 형식일 때
		                	System.out.println(item.getSize());
		                	if(item.getSize()>0) {
		                	 fileName = fileName+"_"+new File(item.getName()).getName();
			                  //
		                     type = "." + item.getContentType().substring(item.getContentType().lastIndexOf("/")+1);
		                     size = (int)item.getSize();
		                     imgname = fileName.substring(0,fileName.indexOf("."));

		                    //
		                    File storeFile = new File(saveDir + "/"  + imgname + type);
		                    //commu.put("commu_img",fileName);
		                    // 파일을 업로드
		                    item.write(storeFile);
		                    
		                    

		    		        dto.setCimg_name(imgname);
		    		        dto.setCimg_size(size);
		    		        dto.setCimg_type(type);
		    		        dto.setCimg_src(saveDir);
		    		        biz.updateImg(dto);
		                	}
		                }
		            }
		            dto.setCmb_content(content);
	                int res = biz.update(dto);
			        
	                
	                
	                if(res>0) {
	                	System.out.println("성공");
	                	response.sendRedirect("community.do?command=detail&cmb_no="+cmb_no);
	                }else {
	                	System.out.println("업로드실패");
	                	response.sendRedirect("community.do?command=updateform&cmb_no="+cmb_no);
	                }
		        }
		        
		    }
		    catch ( Exception e ) { System.out.println(e); }
		 
		//게시글삭제
		}else if(command.equals("delete")) {
			int cmb_no = Integer.parseInt(request.getParameter("cmb_no"));
			
			boolean res = biz.delete(cmb_no);
			
			if(res) {
				System.out.println("성공");
				response.sendRedirect("community.do?command=commu");
			}else {
				System.out.println("실패");
				response.sendRedirect("community.do?command=detail&cmb_no="+cmb_no);
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
