package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.DealDao;
import com.opyung.dto.DealBoardDto;
import com.opyung.dto.ProductBoardDto;

import common.JDBCTemplate;

public class DealBiz extends JDBCTemplate{
	DealDao dao = new DealDao();
	

	//마지막 번호
	public int lastno() {
		Connection con = getConnection();
		
		int res = dao.lastno(con);
		
		close(con);
		return res;
	}
	
	
	//거래생성
	public int insert(int dealno,ProductBoardDto ptdto, String bid) {
		Connection con = getConnection();
		
		int res = dao.insert(con,dealno,ptdto,bid);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return res;
	}

	//거래페이지 조회
	public DealBoardDto selectOne(int dealno) {
		Connection con = getConnection();
		
		DealBoardDto dto = dao.selecOne(con,dealno);
		close(con);
		return dto;
	}
	
	
	//거래일정 생성
	public int insertStatus(int dealno) {
		
		Connection con = getConnection();
		
		int res = dao.insertStatus(con,dealno);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);

		return res;
	}
	
	//거래일정 조회
	public DealBoardDto selectStatus(int dealno) {
		
		Connection con = getConnection();
		
		DealBoardDto dto = dao.selectStatus(con, dealno);
		
		
		
		
		return null;
	}
	
	

}
