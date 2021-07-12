package com.opyung.biz;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import com.opyung.dao.DealDao;
import com.opyung.dto.CheckBoardDto;
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


	//판매중인 상품  조회
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
	
	//검수 내역 테이블 생성
	public int insertCheck(int dealno) {
		
		Connection con = getConnection();
		
		int res = dao.insertCheck(con,dealno);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return res;
	}
	

	//검수 내역 작성
	public int updateCheck(int dealno, CheckBoardDto chkdto) {
		Connection con = getConnection();
		
		int res = dao.updateCheck(con,dealno,chkdto);

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
		
		DealBoardDto res = dao.selectStatus(con, dealno);
		
		close(con);
		
		return res;
	}
	

	//검수내역 조회
	public CheckBoardDto selectChk(int dealno) {
		Connection con = getConnection();
		
		CheckBoardDto dto = dao.selectChk(con,dealno);
		close(con);
		return dto;
	}
	
	//거래일정 수정(거래상태 변경) / 재사용가능
	public int updateStatus(int dealno, String status, Date eDate) {
		
		Connection con = getConnection();
		
		int res = dao.updateStatus(con ,dealno, status, eDate);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return res;
	}
	
	
	//결제금액 변경
	public int updatePrice(int dealno,int price) {
		
		Connection con = getConnection();
		
		int res = dao.updatePrice(con,dealno,price);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return res;
	}
	
	
	//거래페이지에서(deal.jsp)에서 거래 취소시 생성된 DEALBOARD 테이블 삭제
	public int deleteDealBoard(int dealno) {
		
		Connection con = getConnection();
		
		int res = dao.deleteDealBoard(con,dealno);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return res;
	}



	


	
	
	
	
}
