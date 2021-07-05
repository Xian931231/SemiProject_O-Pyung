package com.opyung.biz;

import java.sql.Connection;
import java.util.List;

import com.opyung.dao.ProductDao;
import com.opyung.dto.ProductBoardDto;

import common.JDBCTemplate;

public class ProductBiz extends JDBCTemplate{
	ProductDao dao = new ProductDao();
	//상품 마지막 번호
	public int lastno() {
		Connection con = getConnection();
		
		int res = dao.lastno(con);
		
		close(con);
		
		return res;
	}
	
	//상품 전체 조회
	public List<ProductBoardDto> selectAll() {
		Connection con = getConnection();
		
		List<ProductBoardDto> list = dao.selectAll(con);
		
		close(con);
		
		return list;
	}
	
	//상품 상세 조회
	public ProductBoardDto selectOne(int ptno) {
		Connection con = getConnection();
		
		ProductBoardDto ptdto = dao.selectOne(con,ptno);
		
		close(con);
		return ptdto;
	}
	
	//상품 추가
	public int insert(ProductBoardDto dto) {
		Connection con = getConnection();
		
		
		int res = dao.insert(con,dto);
		if(res >0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
        return res;
	}
	
	//상품 수정

	public int update(ProductBoardDto dto) {
Connection con = getConnection();
		
		int res = dao.update(con,dto);
		
		if(res>0) {
			System.out.println("성공");
			commit(con);
		}else {
			System.out.println("실패");
			rollback(con);
		}
		
		close(con);
		return res;
	}
	
	
	//상품 삭제
	public int delete(int ptno) {
		Connection con = getConnection();
		
		int res = dao.delete(con,ptno);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return res;
	}

	
	//이미지 테이블 
	
	//이미지 추가
	public int insertImg(ProductBoardDto dto) {
		Connection con = getConnection();
		
		int res = dao.insertImg(con,dto);
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return res;
	}
	//이미지 수정
	public int updateImg(ProductBoardDto dto) {
		Connection con = getConnection();
		
		int res = dao.updateImg(con,dto);
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return res;
	}



	



}
