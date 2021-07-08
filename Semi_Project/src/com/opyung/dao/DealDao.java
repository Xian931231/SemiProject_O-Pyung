package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.opyung.dto.DealBoardDto;
import com.opyung.dto.ProductBoardDto;

import common.JDBCTemplate;

public class DealDao extends JDBCTemplate{

	//마지막번호
	public int lastno(Connection con) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		int res = 0;
		
		String sql = "SELECT DEAL_NO FROM(SELECT * FROM DEALBOARD ORDER BY DEAL_NO DESC)WHERE ROWNUM = 1";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03"+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				res = rs.getInt(1);
				System.out.println("번호 :" +rs.getInt(1));
				System.out.println("번호 :"+res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}
	
	//거래시작
	public int insert(Connection con,int dealno, ProductBoardDto ptdto, String bid) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO DEALBOARD VALUES(?,?,?,?,?)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dealno);
			pstm.setInt(2, ptdto.getProduct_no());
			pstm.setString(3, ptdto.getProduct_id());
			pstm.setString(4, bid);
			pstm.setInt(5, ptdto.getProduct_price());
			System.out.println("03"+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		
		
		return res;
	}

	//거래페이지 조회
	public DealBoardDto selecOne(Connection con, int dealno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		DealBoardDto res = new DealBoardDto();
		
		String sql = "SELECT * FROM DEALBOARD WHERE DEAL_NO = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dealno);
			System.out.println("03"+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				res.setDeal_no(rs.getInt(1));
				res.setDeal_productNo(rs.getInt(2));
				res.setDeal_sid(rs.getString(3));
				res.setDeal_bid(rs.getString(4));
				res.setDeal_price(rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}

	

	

	
	//거래중인 상품 수
	public int selectDealSchduleCnt(Connection con, int deal_no) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;
		
		String sql = "SELECT COUNT(*) FROM DEALSCHEDULEBOARD WHERE SCHEDULE_DEALNO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, deal_no);
			System.out.println("03" +sql);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				res=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}

	//거래 스케쥴러 조회 
	public List<DealBoardDto> selectStatusAll(Connection con, String id) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		List<DealBoardDto> res = new ArrayList<DealBoardDto>();		
		
		String sql = "SELECT ROWNUM,PRODUCT_TITLE,DEALBOARD.*,DEALSCHEDULEBOARD.* FROM DEALBOARD LEFT JOIN DEALSCHEDULEBOARD ON DEAL_NO = SCHEDULE_DEALNO JOIN PRODUCTBOARD ON PRODUCT_NO = DEAL_PRODUCTNO WHERE (DEAL_BID=? OR DEAL_SID=?)AND SCHEDULE_EDATE IS NULL";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, id);
			System.out.println("03" +sql);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				DealBoardDto dto = new DealBoardDto();
				dto.setRownum(rs.getInt(1));
				dto.setProduct_title(rs.getString(2));
				dto.setDeal_no(rs.getInt(3));
				dto.setDeal_productNo(rs.getInt(4));
				dto.setDeal_sid(rs.getString(5));
				dto.setDeal_bid(rs.getString(6));
				dto.setDeal_price(rs.getString(7));
				dto.setSchedule_status(rs.getString(10));
				dto.setSdate(rs.getDate(11));
				
				res.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}

	//진행중인 구매 내역 조회
	public List<DealBoardDto> selectBidAll(Connection con, String id) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		List<DealBoardDto> res = new ArrayList<DealBoardDto>();		
		
		String sql = "SELECT ROWNUM,DEAL_NO,PRODUCT_NO,PRODUCT_TITLE,PTIMG_NAME,PTIMG_TYPE,DEAL_BID,DEAL_SID,DEAL_PRICE,PRODUCT_PRICE,SCHEDULE_STATUS,SCHEDULE_SDATE,CHECK_ID,PRODUCT_STATUS FROM DEALBOARD LEFT JOIN DEALSCHEDULEBOARD ON DEAL_NO = SCHEDULE_DEALNO JOIN PRODUCTBOARD ON PRODUCT_NO = DEAL_PRODUCTNO JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO LEFT JOIN CHECKBOARD ON DEAL_NO = CHECK_DEALNO WHERE DEAL_BID=? AND SCHEDULE_EDATE IS NULL AND PRODUCT_STATUS !='판매완료'";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03" +sql);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				DealBoardDto dto = new DealBoardDto();
				dto.setRownum(rs.getInt(1));
				dto.setDeal_no(rs.getInt(2));
				dto.setDeal_productNo(rs.getInt(3));
				dto.setProduct_title(rs.getString(4));
				dto.setPtimg_name(rs.getString(5));
				dto.setPtimg_type(rs.getString(6));
				dto.setDeal_bid(rs.getString(7));
				dto.setDeal_sid(rs.getString(8));
				dto.setDeal_price(rs.getString(9));
				dto.setProduct_price(rs.getInt(10));
				dto.setSchedule_status(rs.getString(11));
				dto.setSdate(rs.getDate(12));
				dto.setCheck_id(rs.getString(13));
				dto.setProduct_status(rs.getString(14));
				res.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}

	//종료된 구매 내역 조회
	public List<DealBoardDto> selectBidEnd(Connection con, String id) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		List<DealBoardDto> res = new ArrayList<DealBoardDto>();		
		
		String sql = "SELECT ROWNUM,DEAL_NO,PRODUCT_NO,PRODUCT_TITLE,PTIMG_NAME,PTIMG_TYPE,DEAL_BID,DEAL_SID,DEAL_PRICE,PRODUCT_PRICE,SCHEDULE_STATUS,SCHEDULE_SDATE,SCHEDULE_EDATE,CHECK_ID,PRODUCT_STATUS FROM DEALBOARD LEFT JOIN DEALSCHEDULEBOARD ON DEAL_NO = SCHEDULE_DEALNO JOIN PRODUCTBOARD ON PRODUCT_NO = DEAL_PRODUCTNO JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO LEFT JOIN CHECKBOARD ON DEAL_NO = CHECK_DEALNO WHERE DEAL_BID=? AND SCHEDULE_STATUS='거래완료' AND PRODUCT_STATUS='판매완료'";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03" +sql);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				DealBoardDto dto = new DealBoardDto();
				dto.setRownum(rs.getInt(1));
				dto.setDeal_no(rs.getInt(2));
				dto.setDeal_productNo(rs.getInt(3));
				dto.setProduct_title(rs.getString(4));
				dto.setPtimg_name(rs.getString(5));
				dto.setPtimg_type(rs.getString(6));
				dto.setDeal_bid(rs.getString(7));
				dto.setDeal_sid(rs.getString(8));
				dto.setDeal_price(rs.getString(9));
				dto.setProduct_price(rs.getInt(10));
				dto.setSchedule_status(rs.getString(11));
				dto.setSdate(rs.getDate(12));
				dto.setEdate(rs.getDate(13));
				dto.setCheck_id(rs.getString(14));
				dto.setProduct_status(rs.getString(15));
				res.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}

	//진행중인 판매 내역 조회
	public List<DealBoardDto> selectSidAll(Connection con, String id) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		List<DealBoardDto> res = new ArrayList<DealBoardDto>();		
		
		String sql = "SELECT ROWNUM,DEAL_NO,PRODUCT_NO,PRODUCT_TITLE,PTIMG_NAME,PTIMG_TYPE,DEAL_BID,DEAL_SID,DEAL_PRICE,PRODUCT_PRICE,SCHEDULE_STATUS,SCHEDULE_SDATE,CHECK_ID,PRODUCT_STATUS FROM DEALBOARD LEFT JOIN DEALSCHEDULEBOARD ON DEAL_NO = SCHEDULE_DEALNO JOIN PRODUCTBOARD ON PRODUCT_NO = DEAL_PRODUCTNO JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO LEFT JOIN CHECKBOARD ON DEAL_NO = CHECK_DEALNO WHERE DEAL_SID=? AND SCHEDULE_EDATE IS NULL AND PRODUCT_STATUS !='판매완료'";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03" +sql);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				DealBoardDto dto = new DealBoardDto();
				dto.setRownum(rs.getInt(1));
				dto.setDeal_no(rs.getInt(2));
				dto.setDeal_productNo(rs.getInt(3));
				dto.setProduct_title(rs.getString(4));
				dto.setPtimg_name(rs.getString(5));
				dto.setPtimg_type(rs.getString(6));
				dto.setDeal_bid(rs.getString(7));
				dto.setDeal_sid(rs.getString(8));
				dto.setDeal_price(rs.getString(9));
				dto.setProduct_price(rs.getInt(10));
				dto.setSchedule_status(rs.getString(11));
				dto.setSdate(rs.getDate(12));
				dto.setCheck_id(rs.getString(13));
				dto.setProduct_status(rs.getString(14));
				res.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}

	//종료된 판매 내역 조회
	public List<DealBoardDto> selectSidEnd(Connection con, String id) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		List<DealBoardDto> res = new ArrayList<DealBoardDto>();		
		
		String sql = "SELECT ROWNUM,DEAL_NO,PRODUCT_NO,PRODUCT_TITLE,PTIMG_NAME,PTIMG_TYPE,DEAL_BID,DEAL_SID,DEAL_PRICE,PRODUCT_PRICE,SCHEDULE_STATUS,SCHEDULE_SDATE,SCHEDULE_EDATE,CHECK_ID,PRODUCT_STATUS FROM DEALBOARD LEFT JOIN DEALSCHEDULEBOARD ON DEAL_NO = SCHEDULE_DEALNO JOIN PRODUCTBOARD ON PRODUCT_NO = DEAL_PRODUCTNO JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO LEFT JOIN CHECKBOARD ON DEAL_NO = CHECK_DEALNO WHERE DEAL_SID=? AND SCHEDULE_STATUS='거래완료' AND PRODUCT_STATUS='판매완료'";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03" +sql);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				DealBoardDto dto = new DealBoardDto();
				dto.setRownum(rs.getInt(1));
				dto.setDeal_no(rs.getInt(2));
				dto.setDeal_productNo(rs.getInt(3));
				dto.setProduct_title(rs.getString(4));
				dto.setPtimg_name(rs.getString(5));
				dto.setPtimg_type(rs.getString(6));
				dto.setDeal_bid(rs.getString(7));
				dto.setDeal_sid(rs.getString(8));
				dto.setDeal_price(rs.getString(9));
				dto.setProduct_price(rs.getInt(10));
				dto.setSchedule_status(rs.getString(11));
				dto.setSdate(rs.getDate(12));
				dto.setEdate(rs.getDate(13));
				dto.setCheck_id(rs.getString(14));
				dto.setProduct_status(rs.getString(15));
				res.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}

	//전체 판매 내역 조회
	public List<DealBoardDto> sidListAll(Connection con, String id) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		List<DealBoardDto> res = new ArrayList<DealBoardDto>();		
		
		String sql = "SELECT ROWNUM,PRODUCT_TITLE,PTIMG_NAME,PTIMG_TYPE,PRODUCT_PRICE,PRODUCT_STATUS,DEALBOARD.*,CHECK_ID FROM DEALBOARD LEFT JOIN PRODUCTBOARD ON DEAL_PRODUCTNO = PRODUCT_NO JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO LEFT JOIN CHECKBOARD ON DEAL_NO = CHECK_DEALNO WHERE DEAL_SID=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03" +sql);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				DealBoardDto dto = new DealBoardDto();
				dto.setRownum(rs.getInt(1));
				dto.setProduct_title(rs.getString(2));
				dto.setPtimg_name(rs.getString(3));
				dto.setPtimg_type(rs.getString(4));
				dto.setProduct_price(rs.getInt(5));
				dto.setProduct_status(rs.getString(6));
				dto.setDeal_no(rs.getInt(7));
				dto.setDeal_productNo(rs.getInt(8));
				dto.setDeal_sid(rs.getString(9));
				dto.setDeal_bid(rs.getString(10));
				dto.setDeal_price(rs.getString(11));
				dto.setCheck_id(rs.getString(12));
				res.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}

	
	//전체 구매 내역
	public List<DealBoardDto> bidListAll(Connection con, String id) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		List<DealBoardDto> res = new ArrayList<DealBoardDto>();		
		
		String sql = "SELECT ROWNUM,PRODUCT_TITLE,PTIMG_NAME,PTIMG_TYPE,PRODUCT_PRICE,PRODUCT_STATUS,DEALBOARD.*,CHECK_ID FROM DEALBOARD LEFT JOIN PRODUCTBOARD ON DEAL_PRODUCTNO = PRODUCT_NO JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO LEFT JOIN CHECKBOARD ON DEAL_NO = CHECK_DEALNO WHERE DEAL_BID=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03" +sql);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				DealBoardDto dto = new DealBoardDto();
				dto.setRownum(rs.getInt(1));
				dto.setProduct_title(rs.getString(2));
				dto.setPtimg_name(rs.getString(3));
				dto.setPtimg_type(rs.getString(4));
				dto.setProduct_price(rs.getInt(5));
				dto.setProduct_status(rs.getString(6));
				dto.setDeal_no(rs.getInt(7));
				dto.setDeal_productNo(rs.getInt(8));
				dto.setDeal_sid(rs.getString(9));
				dto.setDeal_bid(rs.getString(10));
				dto.setDeal_price(rs.getString(11));
				dto.setCheck_id(rs.getString(12));
				res.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}

	
	

}
