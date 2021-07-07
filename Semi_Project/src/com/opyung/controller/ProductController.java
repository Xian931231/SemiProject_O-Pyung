package com.opyung.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.opyung.biz.ProductBiz;
import com.opyung.dto.CommuBoardDto;
import com.opyung.dto.ProductBoardDto;
import com.opyung.naversearch.NaverCrawler;

@WebServlet("/ProjectController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductController() {
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
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
		ProductBiz biz = new ProductBiz();
		
		//제품 리스트 조회
		if(command.equals("shop")) {
			List<ProductBoardDto> list = new ArrayList<ProductBoardDto>();
			
			list = biz.selectAll();
			
			request.setAttribute("list", list);
			dispatch("shop.jsp", request, response);

		}else if(command.equals("detail")) {
			int ptno = Integer.parseInt(request.getParameter("ptno"));
			System.out.println(ptno);
			
			ProductBoardDto ptdto = new ProductBoardDto();
			ptdto = biz.selectOne(ptno);

			System.out.println(ptdto.getProduct_content());

			//네이버 블로그 api
			
			String id = "XFrG4kMu2svegbTGZgMF";
			String secret = "2ehftuXKB8";
			
				NaverCrawler crawler = new NaverCrawler();
				String url = URLEncoder.encode(ptdto.getProduct_title(), "UTF-8");
				
				String responseSearch = crawler.search(id, secret, url);
				
				String[] fields = {"title", "link", "description", "bloggername", "postdate"};
				
				Map<String, Object> result = crawler.getResult(responseSearch, fields);
				
				List<Map<String, Object>> items = (List<Map<String, Object>>) result.get("result");
				
				
			request.setAttribute("ptdto", ptdto);
			request.setAttribute("items", items);
			dispatch("product.jsp", request, response);

		//상품 등록
		}else if(command.equals("writeform")) {
			response.sendRedirect("product_add.jsp");
		}else if(command.equals("insert")) {
			
			String latitude = "";
			String longitude = "";
			
			int product_no = (biz.lastno())+1;
			String id = "";
			String title = "";
			String content = "";
			String imgname= "";
			String type = "";
			int size = 0;
			String brand = "";
			String category = "";
			int price = 0;
			String location = "";
			String newvar = "";
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
		            while (iter.hasNext()) {
		                FileItem item = iter.next();
		 
		 
		                if (item.isFormField()) {
		                    // file 형식이 아닐 때
		                	//System.out.println(item.getFieldName());
		                	//System.out.println(item.getString());
		                	
		                	if(item.getFieldName().equals("id")) {
		                		id = item.getString();
		                	}else if(item.getFieldName().equals("content")) {
		                		content = item.getString();
		                		//한글깨짐
		                		content = new String(content.getBytes("8859_1"),"UTF-8");
		                	}else if(item.getFieldName().equals("title")) {
		                		title = item.getString();
		                		title = new String(title.getBytes("8859_1"),"UTF-8");
		                	}else if(item.getFieldName().equals("brand")) {
		                		brand = item.getString();
		                		brand = new String(brand.getBytes("8859_1"),"UTF-8");
		                	}else if(item.getFieldName().equals("price")) {
		                		price = Integer.parseInt(item.getString());
		                	}else if(item.getFieldName().equals("newvar")) {
		                		newvar = item.getString();
		                	}else if(item.getFieldName().equals("catogory-desk")){
		                		if(!item.getString().equals("")) {
		                			category = item.getString();
		                			category = new String(category.getBytes("8859_1"),"UTF-8");
		                		}
		                	}else if(item.getFieldName().equals("catogory-out")) {
		                		if(!item.getString().equals("")) {
		                			category = item.getString();
		                			category = new String(category.getBytes("8859_1"),"UTF-8");
		                		}
		                	}else if(item.getFieldName().equals("location")){
		                		location = item.getString();
		                		location = new String(location.getBytes("8859_1"),"UTF-8");
		                	}else if(item.getFieldName().equals("latitude")) {
		                		latitude = item.getString();
		                	}else if(item.getFieldName().equals("longitude")) {
		                		longitude = item.getString();
		                	}
		                	
		                } else {
		                	if(item.getSize()>0) {
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
		            }//반복끝
		            ProductBoardDto dto = new ProductBoardDto();
	                dto.setProduct_no(product_no);
	                dto.setProduct_title(title);
	                dto.setProduct_category(category);
	                dto.setProduct_price(price);
	                dto.setProduct_brand(brand);
	                dto.setProduct_addr(location);
	                dto.setProduct_addr_latitude(latitude);
	                dto.setProduct_addr_longitude(longitude);
	                dto.setProduct_new(newvar);
	                dto.setProduct_content(content);
	                dto.setProduct_id(id);
	                dto.setPtimg_productNo(product_no);
	                dto.setPtimg_size(size);
	                dto.setPtimg_name(imgname);
	                dto.setPtimg_type(type);
	                dto.setPtimg_src(saveDir);
	                int res = biz.insert(dto);;
	                if(res>0) {
	                	int res2 = biz.insertImg(dto);
	                	if(res2>0) {
	                		System.out.println("이미지성공");
	                		response.sendRedirect("product.do?command=detail&ptno="+product_no);
	                	}else {
	                		System.out.println("이미지 실패");
	                	}
	                }else {
	                	System.out.println("실패");
	                }
		        }
               
		    } catch ( Exception e ) { System.out.println(e); }
		
		//수정 폼으로 이동    
		}else if(command.equals("updateform")) {
			int ptno = Integer.parseInt(request.getParameter("ptno"));
			System.out.println(ptno);
			ProductBoardDto ptdto = biz.selectOne(ptno);
			request.setAttribute("ptdto", ptdto);
			request.setAttribute("content", ptdto.getProduct_content());
			dispatch("product_update.jsp", request, response);
		
			
		//업데이트
		}else if(command.equals("update")) {
			int ptno = Integer.parseInt(request.getParameter("ptno"));
			ProductBoardDto dto = new ProductBoardDto();
			dto.setProduct_no(ptno);
			String id = "";
			String title = "";
			String content = "";
			String imgname= "";
			String type = "";
			int size = 0;
			String brand = "";
			String category = "";
			int price = 0;
			String location = "";
			String newvar = "";
			String latitude = "";
			String longitude = "";
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
		            while (iter.hasNext()) {
		                FileItem item = iter.next();
		 
		 
		                if (item.isFormField()) {
		                    // file 형식이 아닐 때
		                	//System.out.println(item.getFieldName());
		                	//System.out.println(item.getString());
		                	
		                	if(item.getFieldName().equals("id")) {
		                		id = item.getString();
		                	}else if(item.getFieldName().equals("content")) {
		                		content = item.getString();
		                		//한글깨짐
		                		content = new String(content.getBytes("8859_1"),"UTF-8");
		                	}else if(item.getFieldName().equals("title")) {
		                		title = item.getString();
		                		title = new String(title.getBytes("8859_1"),"UTF-8");
		                	}else if(item.getFieldName().equals("brand")) {
		                		brand = item.getString();
		                		brand = new String(brand.getBytes("8859_1"),"UTF-8");
		                	}else if(item.getFieldName().equals("price")) {
		                		price = Integer.parseInt(item.getString());
		                	}else if(item.getFieldName().equals("newvar")) {
		                		newvar = item.getString();
		                	}else if(item.getFieldName().equals("catogory-desk")){
		                		if(!item.getString().equals("")) {
		                			category = item.getString();
		                			category = new String(category.getBytes("8859_1"),"UTF-8");
		                		}
		                	}else if(item.getFieldName().equals("catogory-out")) {
		                		if(!item.getString().equals("")) {
		                			category = item.getString();
		                			category = new String(category.getBytes("8859_1"),"UTF-8");
		                		}
		                	}else if(item.getFieldName().equals("location")){
		                		location = item.getString();
		                		location = new String(location.getBytes("8859_1"),"UTF-8");
		                	}else if(item.getFieldName().equals("latitude")) {
		                		latitude = item.getString();
		                	}else if(item.getFieldName().equals("longitude")) {
		                		longitude = item.getString();
		                	}
		                } else {
		                	if(item.getSize()>0) {
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
			                    

			                    dto.setPtimg_productNo(ptno);
			                    dto.setPtimg_size(size);
			                    dto.setPtimg_name(imgname);
			                    dto.setPtimg_type(type);
			                    dto.setPtimg_src(saveDir);
			                    int res = biz.updateImg(dto);
			                    
			                    if(res>0) {
			                    	System.out.println("이미지 수정 성공");
			                    }else {
			                    	System.out.println("이미지 수정 실패");
			                    }
		                	}
		                    
		                }
		            }//반복끝
		            dto.setProduct_title(title);
	                dto.setProduct_category(category);
	                dto.setProduct_price(price);
	                dto.setProduct_brand(brand);
	                dto.setProduct_addr(location);
	                dto.setProduct_new(newvar);
	                dto.setProduct_content(content);
	                dto.setProduct_id(id);
	                dto.setProduct_addr_latitude(latitude);
	                dto.setProduct_addr_longitude(longitude);
	                
	                int res = biz.update(dto);
	                
	                if(res>0) {
	                	System.out.println("수정성공");
	                	response.sendRedirect("product.do?command=detail&ptno="+ptno);
	                }else {
	                	System.out.println("수정 실패");
	                	response.sendRedirect("product.do?command=detail&ptno="+ptno);
	                }
		        }
                
		    } catch ( Exception e ) { System.out.println(e); }
		
        //상품 삭제	
		}else if(command.equals("delete")) {
			int ptno = Integer.parseInt(request.getParameter("ptno"));
			
			int res = biz.delete(ptno);
			
			if(res>0) {
				System.out.println("삭제 성공");
				response.sendRedirect("product.do?command=shop");
			}else {
				System.out.println("삭제 실패");
				response.sendRedirect("product.do?command=detail&ptno="+ptno);
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
