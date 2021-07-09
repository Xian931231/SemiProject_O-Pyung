package com.opyung.biz;

import java.sql.Connection;
import java.util.List;

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





	//거래 스케쥴러에 있는지 확인
	public int selectDealSchduleCnt(int deal_no) {
		Connection con =getConnection();
		int res = dao.selectDealSchduleCnt(con,deal_no);
		close(con);
		return res;
	}

	//거래 스케쥴러 조회 
	public List<DealBoardDto> selectStatusAll(String id) {
		Connection con = getConnection();
		
		List<DealBoardDto> dealList = dao.selectStatusAll(con,id);
		close(con);
		return dealList;
	}

	//진행중인 구매내역 조회
	public List<DealBoardDto> selectBidAll(String id) {
		Connection con = getConnection();
		
		List<DealBoardDto> list = dao.selectBidAll(con,id);
		return list;
	}

	//종료된 구매 내역 조회
	public List<DealBoardDto> selectBidEnd(String id) {
		Connection con = getConnection();
		
		List<DealBoardDto> list = dao.selectBidEnd(con,id);
		return list;
	}

	//진행중인 판매내역 조회
	public List<DealBoardDto> selectSidAll(String id) {
		Connection con = getConnection();
		
		List<DealBoardDto> list = dao.selectSidAll(con,id);
		return list;
	}

	//종료된 판매내역 조회
	public List<DealBoardDto> selectSidEnd(String id) {
		Connection con = getConnection();
		
		List<DealBoardDto> list = dao.selectSidEnd(con,id);
		return list;
	}


	//전체 판매 내역 조회
	public List<DealBoardDto> sidListAll(String id) {
		Connection con = getConnection();
		
		List<DealBoardDto> list = dao.sidListAll(con,id);
		return list;
	}

	//전체 구매 내역 조회
	public List<DealBoardDto> bidListAll(String id) {
Connection con = getConnection();
		
		List<DealBoardDto> list = dao.bidListAll(con,id);
		return list;
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
