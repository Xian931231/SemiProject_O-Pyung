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
		
		String sql = " SELECT * FROM MEMBERBOARD ORDER BY MB_NO ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03.query 준비" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setMb_id(rs.getString(1));
				dto.setMb_pw(rs.getString(2));
				dto.setMb_name(rs.getString(3));
				dto.setMb_email(rs.getString(4));
				dto.setMb_phone(rs.getString(5));
				dto.setMb_able(rs.getString(6));
				dto.setMb_score(rs.getInt(7));
				
				
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
	//검색을 통한 출력
	public MemberDto serchId(Connection con,String mb_id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = null;
		
		String sql = " SELECT * FROM ";
		
		
		
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
