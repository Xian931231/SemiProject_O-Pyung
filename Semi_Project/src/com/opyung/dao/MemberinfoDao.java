package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opyung.dto.MemberDto;

import common.JDBCTemplate;

public class MemberinfoDao extends JDBCTemplate{
	//특정 회원 정보 조회
	public MemberDto selectOne(Connection con, String id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = new MemberDto();
		
		String sql = "SELECT * FROM MEMBERBOARD WHERE MB_ID=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03 "+ sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				res.setMb_no(rs.getInt(1));
				res.setMb_id(rs.getString(2));
				res.setMb_pw(rs.getString(3));
				res.setMb_name(rs.getString(4));
				res.setMb_email(rs.getString(5));
				res.setMb_phone(rs.getString(6));
				res.setMb_addr(rs.getString(7));
				res.setMb_addr_latitude(rs.getString(8));
				res.setMb_addr_longitude(rs.getString(9));
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

}
