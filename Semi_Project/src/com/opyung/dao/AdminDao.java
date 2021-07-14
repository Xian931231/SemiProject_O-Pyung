package com.opyung.dao;



import com.opyung.dto.DealBoardDto;
import com.opyung.dto.MemberDto;
import com.opyung.dto.ReportBoardDto;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;



public class AdminDao {
	
	
	///////////////admin_user////////////////////////////////////
	//유저정보 전체 출력
	public List<MemberDto> selectAll(Connection con){
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MemberDto> res = new ArrayList<MemberDto>();
		
		String sql = " SELECT MB_ID, MB_PW, MB_NAME, MB_EMAIL, MB_PHONE, MB_ABLE, MB_SCORE FROM MEMBERBOARD ORDER BY MB_NO ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03.query 준비" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				MemberDto dto = new MemberDto(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));

				res.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("05. db종료\n");
			
		}
		
		return res;
	}
	
	//selectOne
	public MemberDto selectOne(Connection con, String mb_id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = null;
		String sql = "SELECT MB_ID, MB_PW, MB_NAME, MB_EMAIL, MB_PHONE, MB_ABLE, MB_SCORE FROM MEMBERBOARD WHERE MB_ID=?  ";
	
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, mb_id);
			System.out.println("03. query 준비 : " + sql);
			
			rs= pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			if(rs.next()) {
				res = new MemberDto(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));
				
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	//black 처리
	public boolean black(Connection con, MemberDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MEMBERBOARD SET MB_ABLE='N' WHERE MB_ID=?";
		
		try {
			pstm= con.prepareStatement(sql);
			pstm.setString(1, dto.getMb_id());
			System.out.println("03. query준비 : " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			} catch (SQLException e) {
				System.out.println("3/4단계에러");
				e.printStackTrace();
			}finally {
				close(pstm);
				System.out.println("05. db종료\n");
			}
		
		return (res>0)?true:false;
	}
	
	//black 해지
	public int blackCancel(Connection con, MemberDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MEMBERBOARD SET MB_ABLE='Y' WHERE MB_ID=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMb_id());
			System.out.println("03. query준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. 실행 및 리턴");
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			System.out.println("05. db종료\n");
		}
		
		return res;
	}
	
	
	
	
	

	//검색을 통한 출력
	public List<MemberDto> search(Connection con,String keyword,String keyField) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MemberDto> res = new ArrayList<MemberDto>();
		String sql = " SELECT MB_ID, MB_PW, MB_NAME, MB_EMAIL, MB_PHONE, MB_ABLE, MB_SCORE FROM MEMBERBOARD WHERE ";
		
	
		
		if(keyword == null) {
			sql += " ORDER BY "+keyField;
		
		}else if(keyField.equals("MB_ABLE")) {
			sql += keyField+" LIKE 'N' ";
		}else {
			
			sql += keyField+ " LIKE '%"+keyword+"%' ";
		}
		
		try {
			pstm = con.prepareStatement(sql);
			
			System.out.println("03.query 준비" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				MemberDto dto = new MemberDto(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));

				res.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("05. db종료\n");
			
		}
		
		
		return res;
	}
	
	/////////////////////user_deal///////////////////////////////////
	//거래중인 것만 보이게하기 '검수신청'
		public List<DealBoardDto> dealAll(Connection con){
			PreparedStatement pstm = null;
			ResultSet rs = null;
			List<DealBoardDto> res = new ArrayList<DealBoardDto>();
			
			String sql = " SELECT D.DEAL_NO,P.PRODUCT_TITLE,D.DEAL_SID,D.DEAL_BID,S.SCHEDULE_STATUS,S.SCHEDULE_SDATE,S.SCHEDULE_EDATE FROM DEALBOARD D INNER JOIN DEALSCHEDULEBOARD S ON(D.DEAL_NO=S.SCHEDULE_DEALNO) INNER JOIN PRODUCTBOARD P ON(D.deal_productno=P.PRODUCT_NO) WHERE S.SCHEDULE_STATUS='검수신청' ";
			
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03.query 준비 "+sql);
				
				rs=pstm.executeQuery();
				System.out.println("04. query 실행 및 리턴");
				
				while(rs.next()) {
					DealBoardDto dto = new DealBoardDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getDate(7));
				
					res.add(dto);
					
				}
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			
			
			return res;
		}
		
		public List<DealBoardDto> countready(Connection con) {
			PreparedStatement pstm = null;
			ResultSet rs = null;
			List<DealBoardDto> res = new ArrayList<DealBoardDto>();
			
			
			String sql = " SELECT D.DEAL_NO,P.PRODUCT_TITLE,D.DEAL_SID,D.DEAL_BID,S.SCHEDULE_STATUS,S.SCHEDULE_SDATE,S.SCHEDULE_EDATE FROM DEALBOARD D INNER JOIN DEALSCHEDULEBOARD S ON(D.DEAL_NO=S.SCHEDULE_DEALNO) INNER JOIN PRODUCTBOARD P ON(D.deal_productno=P.PRODUCT_NO) WHERE S.SCHEDULE_STATUS = '검수신청' OR S.SCHEDULE_STATUS = '거래신청' OR S.SCHEDULE_STATUS = '예약금결제'   ";
			
			
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03. query 준비 : " +sql);
			
				rs = pstm.executeQuery();
				System.out.println("04. query 실행 및 리턴");
				
				while(rs.next()) {
					DealBoardDto dto = new DealBoardDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getDate(7));
					System.out.println(dto);
					
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
//				=거래신청
//				거래 신청
//
//				=결제완료
//				예약금결제
//				검수신청
//				판매자 발송준비
//
//				=검수시작
//				검수중
//
//				=검수완료
//				구매자 발송준비
//
//				=배송시작
//				결제완료
//
//				=배송완료
//				배송완료
//				거래확정
		
		public List<DealBoardDto> counting(Connection con) {
			PreparedStatement pstm = null;
			ResultSet rs = null;
			List<DealBoardDto> res = new ArrayList<DealBoardDto>();
			
			String sql = " SELECT D.DEAL_NO,P.PRODUCT_TITLE,D.DEAL_SID,D.DEAL_BID,S.SCHEDULE_STATUS,S.SCHEDULE_SDATE,S.SCHEDULE_EDATE FROM DEALBOARD D INNER JOIN DEALSCHEDULEBOARD S ON(D.DEAL_NO=S.SCHEDULE_DEALNO) INNER JOIN PRODUCTBOARD P ON(D.deal_productno=P.PRODUCT_NO) WHERE S.SCHEDULE_STATUS ='검수중' ";
			
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03. query 준비 : " +sql);
			
				rs = pstm.executeQuery();
				System.out.println("04. query 실행 및 리턴");
				
				while(rs.next()) {
					DealBoardDto dto = new DealBoardDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getDate(7));
				
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
		
		
		
		public List<DealBoardDto> countgo(Connection con) {
			PreparedStatement pstm = null;
			ResultSet rs = null;
			List<DealBoardDto> res = new ArrayList<DealBoardDto>();
			
			String sql = " SELECT D.DEAL_NO,P.PRODUCT_TITLE,D.DEAL_SID,D.DEAL_BID,S.SCHEDULE_STATUS,S.SCHEDULE_SDATE,S.SCHEDULE_EDATE FROM DEALBOARD D INNER JOIN DEALSCHEDULEBOARD S ON(D.DEAL_NO=S.SCHEDULE_DEALNO) INNER JOIN PRODUCTBOARD P ON(D.deal_productno=P.PRODUCT_NO) WHERE S.SCHEDULE_STATUS = '구매자발송준비' OR S.SCHEDULE_STATUS = '결제완료' OR S.SCHEDULE_STATUS = '거래확정' ";
			
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03. query 준비 : " +sql);
			
				rs = pstm.executeQuery();
				System.out.println("04. query 실행 및 리턴");
				
				while(rs.next()) {
					DealBoardDto dto = new DealBoardDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getDate(7));
				
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
		
		public DealBoardDto dealselect(Connection con, int sche_no) {
			PreparedStatement pstm = null;
			ResultSet rs = null;
			DealBoardDto res = null;
			
			String sql = " SELECT D.DEAL_NO,P.PRODUCT_TITLE,D.DEAL_SID,D.DEAL_BID,S.SCHEDULE_STATUS,S.SCHEDULE_SDATE,S.SCHEDULE_EDATE FROM DEALBOARD D INNER JOIN DEALSCHEDULEBOARD S ON(D.DEAL_NO=S.SCHEDULE_DEALNO) INNER JOIN PRODUCTBOARD P ON(D.deal_productno=P.PRODUCT_NO) WHERE D.deal_no=? ";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, sche_no);
				System.out.println("03. query 준비: "+sql);
				
				rs = pstm.executeQuery();
				System.out.println("04.query 실행 및 리턴");
				
				if(rs.next()) {
					res = new DealBoardDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getDate(7));
				}
				
			} catch (SQLException e) {
				System.out.println("3/4단계");
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstm);
				System.out.println("05. db종료\n");
			}
			
			return res;
		}
		
		public boolean dealupdate(Connection con, String dealselect, String start, String end, int sche_no) {
			PreparedStatement pstm = null;
			int res = 0;
			

			//sql에 date값을 넣으려면 java.sql.Date로 형변환 하여야한다.	
			
			java.sql.Date sqlstart =  java.sql.Date.valueOf(start);
			java.sql.Date sqlend =   java.sql.Date.valueOf(end);
			
			
				String sql = " UPDATE DEALSCHEDULEBOARD SET SCHEDULE_STATUS= ? , SCHEDULE_SDATE= ?, SCHEDULE_EDATE= ? WHERE SCHEDULE_DEALNO = ? ";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, dealselect);
				pstm.setDate(2, sqlstart);
				pstm.setDate(3, sqlend);
				pstm.setInt(4, sche_no);
				System.out.println("03.query 준비: "+sql);
				
				res = pstm.executeUpdate();
				System.out.println("04. query 실행 및 리턴");
				
				
			} catch (SQLException e) {
				System.out.println("3/4단계 오류");
				e.printStackTrace();
			}finally {

				close(pstm);
				System.out.println("05.db종료\n");
			}
			
			
			return (res>0)?true:false;
		}
		
		
		
	
	/////////////////////user_report///////////////////////////////////
	//신고 전체 출력
		public List<ReportBoardDto> reportAll(Connection con){
			PreparedStatement pstm = null;
			ResultSet rs = null;
			List<ReportBoardDto> res = new ArrayList<ReportBoardDto>();
			
			String sql = " SELECT REPORT_NO, REPORT_TID, REPORT_ID, REPORT_CONTENT, REPORT_SDATE FROM REPORTBOARD WHERE REPORT_EDATE IS NULL ORDER BY REPORT_NO ";
			
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03.query 준비" + sql);
				
				rs = pstm.executeQuery();
				System.out.println("04. query 실행 및 리턴");
				
				while(rs.next()) {
					ReportBoardDto dto = new ReportBoardDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));

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
		
		public List<ReportBoardDto> count(Connection con) {
			PreparedStatement pstm = null;
			ResultSet rs = null;
			List<ReportBoardDto> res = new ArrayList<ReportBoardDto>();
			
			
			String sql =" SELECT REPORT_NO, REPORT_TID, REPORT_ID, REPORT_CONTENT, REPORT_SDATE FROM REPORTBOARD WHERE REPORT_EDATE IS NOT NULL ORDER BY REPORT_NO ";
			
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03.query 준비 : " +sql);
				
				rs=pstm.executeQuery();
				System.out.println("04.query 실행 및 리턴");
				
				while(rs.next()) {
					ReportBoardDto dto = new ReportBoardDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));

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
		
		
		
		
		public ReportBoardDto reselect(Connection con, int report_no) {
			PreparedStatement pstm = null;
			ResultSet rs = null;
			ReportBoardDto res = null;
			String sql = " SELECT REPORT_NO, REPORT_TID, REPORT_ID, REPORT_CONTENT, REPORT_SDATE FROM REPORTBOARD WHERE REPORT_NO=?  ";
		
			try {
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, report_no);
				System.out.println("03. query 준비 : " + sql);
				
				rs= pstm.executeQuery();
				System.out.println("04. query 실행 및 리턴");
				
				if(rs.next()) {
					res = new ReportBoardDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));
					
				}
				
			} catch (SQLException e) {
				System.out.println("3/4단계");
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstm);
				System.out.println("05. db 종료\n");
			}
			
			return res;
		}
	//신고 완료 날짜 update
		public boolean edate(Connection con, int report_no) {
			PreparedStatement pstm = null;
			int res = 0;
			
			String sql = " UPDATE REPORTBOARD SET REPORT_EDATE=SYSDATE WHERE REPORT_NO=? ";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, report_no);
				System.out.println("03.query 준비 : " +sql);
				
				res = pstm.executeUpdate();
				System.out.println("04.query 실행 및 리턴");
				
				
				

			} catch (SQLException e) {
				System.out.println("3/4단계 에러");
				e.printStackTrace();
			}finally {
				
				close(pstm);
				System.out.println("05. db 종료\n");
			}
			
			
			return (res>0)?true:false;
		}
	
		public boolean minus(Connection con, String report_tid) {
			PreparedStatement pstm = null;
			int res = 0;
			
			String sql = " UPDATE MEMBERBOARD SET MB_SCORE=MB_SCORE-1 WHERE MB_ID = ? ";
			
			try {
				pstm= con.prepareStatement(sql);
				pstm.setString(1, report_tid);
				System.out.println("03.query준비:" + sql);
				
				res = pstm.executeUpdate();
				System.out.println("04. qurty 실행 및 리턴");
				
			} catch (SQLException e) {
				System.out.println("3/4 단계 에러");
				e.printStackTrace();
			}finally {
				close(pstm);
				System.out.println("05. db종료\n");
			}
			
			
			
			
			
			
			
			
			return (res>0)?true:false;
		}
		
		
		
		
		
		
}
