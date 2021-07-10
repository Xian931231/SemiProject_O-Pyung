package com.opyung.dao;



import com.opyung.dto.DealBoardDto;
import com.opyung.dto.MemberDto;
import com.opyung.dto.ReportBoardDto;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class AdminDao {
	
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
		public List<DealBoardDto> dealAll(Connection con){
			PreparedStatement pstm = null;
			ResultSet rs = null;
			List<DealBoardDto> res = new ArrayList<DealBoardDto>();
			
			String sql = " SELECT DEAL_NO,PRODUCT_TITLE,DEAL_SID,DEAL_BID,SCHEDULE_STATUS,SCHEDULE_SDATE,SCHEDULE_EDATE FROM DEALBOARD INNER JOIN dealscheduleboard  ON(DEAL_NO=schedule_dealno) INNER JOIN productboard ON(DEAL_NO=PRODUCT_NO) ";
			
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
		
		public int deal_countready(Connection con) {
			PreparedStatement pstm = null;
			ResultSet rs = null;
			int res = 0;
			
			String sql = "SELECT COUNT(*) FROM DEALBOARD WHERE SCHEDULE_STATUS IS NULL ";
			
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03. query 준비 : " +sql);
			
				rs = pstm.executeQuery();
				System.out.println("04. query 실행 및 리턴");
				
				res = rs.getInt(1);
				
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstm);
			}
			
			
			return res;
		}
		
		public int deal_counting(Connection con) {
			PreparedStatement pstm = null;
			ResultSet rs = null;
			int res = 0;
			
			String sql = "SELECT COUNT(*) FROM DEALBOARD WHERE SCHEDULE_STATUS = 'ing' ";
			
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03. query 준비 : " +sql);
			
				rs = pstm.executeQuery();
				System.out.println("04. query 실행 및 리턴");
				
				res = rs.getInt(1);
				
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstm);
			}
			
			
			return res;
		}
		
		
		
		public int deal_countgo(Connection con) {
			PreparedStatement pstm = null;
			ResultSet rs = null;
			int res = 0;
			
			String sql = "SELECT COUNT(*) FROM DEALBOARD WHERE SCHEDULE_STATUS IS 'go' ";
			
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03. query 준비 : " +sql);
			
				rs = pstm.executeQuery();
				System.out.println("04. query 실행 및 리턴");
				
				res = rs.getInt(1);
				
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstm);
			}
			
			
			return res;
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
				System.out.println("3/4단계 에러");
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstm);
				System.out.println("05. db종료\n");
				
			}
			
			return res;
			
			
		}
		public int count(Connection con) {
			PreparedStatement pstm = null;
			ResultSet rs = null;
			int res = 0;
			
			String sql =" SELECT COUNT(*) FROM REPORTBOARD WHERE REPORT_EDATE IS NOT NULL ";
			
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03.query 준비 : " +sql);
				
				rs=pstm.executeQuery();
				System.out.println("04.query 실행 및 리턴");
				
				if(rs.next()) {
					res = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstm);
			}
			
			
			return res;
		}
		public int countnull(Connection con) {
			PreparedStatement pstm = null;
			ResultSet rs = null;
			int res = 0;
			
			String sql =" SELECT COUNT(*) FROM REPORTBOARD WHERE REPORT_EDATE IS NULL ";
			
			try {
				pstm = con.prepareStatement(sql);
				System.out.println("03.query 준비 : " +sql);
				
				rs=pstm.executeQuery();
				System.out.println("04.query 실행 및 리턴");
				
				if(rs.next()) {
					res = rs.getInt(1);
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
