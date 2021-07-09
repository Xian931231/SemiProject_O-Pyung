package com.opyung.dao;



import com.opyung.dto.MemberDto;
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
				
//				dto.setMb_id(rs.getString(1));
//				dto.setMb_pw(rs.getString(2));
//				dto.setMb_name(rs.getString(3));
//				dto.setMb_email(rs.getString(4));
//				dto.setMb_phone(rs.getString(5));
//				dto.setMb_able(rs.getString(6));
//				dto.setMb_score(rs.getInt(7));
//				
				
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
	public MemberDto serchId(Connection con,String mb_id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = null;
		
		String sql = " SELECT * FROM MEMBERBOARD ORDER BY MB_ID  ";
		
	

		
		
		
		return null;
	}
	public MemberDto serchName(Connection con,String mb_id) {
		
		return null;
	}
	public MemberDto serchEmail(Connection con,String mb_id) {
		
		return null;
	}
	public MemberDto serchPhone(Connection con,String mb_id) {
		
		return null;
	}
	public MemberDto serchable(Connection con,String mb_id) {
		
		return null;
	}

	
	
	
}
