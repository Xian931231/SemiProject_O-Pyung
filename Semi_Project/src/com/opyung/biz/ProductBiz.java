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
	
	//특정 상품목록 조회
	public List<ProductBoardDto> selectAll(String category) {
		Connection con = getConnection();
		
		List<ProductBoardDto> list = dao.selectAll(con,category);
		
		close(con);
		
		return list;
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

	//관심상품 목록 조회
	public List<ProductBoardDto> likeList(String id) {
		Connection con = getConnection();
		
		List<ProductBoardDto> list = dao.likeList(con,id);
		close(con);
		return list;
	}

	//헤더 검색기능
	public List<ProductBoardDto> selectSearchVal(String searchVal) {
		Connection con = getConnection();
		
		List<ProductBoardDto> list = dao.selectSearchVal(con,searchVal);
		
		close(con);
		
		return list;
	}

	//최대가격
	public int maxPrice() {
		Connection con =getConnection();
		int res = dao.maxPrice(con);
		close(con);
		return res;
	}

	//체크박스 검색
	public List<ProductBoardDto> searchChk(String[] category, String[] brand, String[] addr, String[] newvar, int min,
			int max) {
		Connection con = getConnection();
		
		List<ProductBoardDto> list = dao.searchChk(con,category,brand,addr,newvar,min,max);
		close(con);
		return list;
	}

	//버튼 클릭 검색
	public List<ProductBoardDto> searchBtn(String category) {
		Connection con = getConnection();
		
		List<ProductBoardDto> list = dao.searchBtn(con,category);
		close(con);
		return list;
	}
	
	
	//거래확정시 판매상태 판매완료로 변경
	public int updatePtStatus(int productno, String ptStatus) {
		
		Connection con = getConnection();
		
		int res = dao.updatePtStatus(con, productno, ptStatus);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
	
		close(con);
		
		return res;
	}

	//탈퇴시 상품 전체 삭제
	public void deletePtAll(String id) {
		Connection con = getConnection();
		
		int res =dao.deletePtAll(con,id);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
	
		close(con);
		
	}




	



}
