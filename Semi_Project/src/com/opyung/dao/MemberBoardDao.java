package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opyung.dto.MemberBoardDto;

import common.JDBCTemplate;

public class MemberBoardDao extends JDBCTemplate{

	public MemberBoardDto login(Connection con, String id, String pw) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberBoardDto res = new MemberBoardDto();
		
		String sql = " SELECT * FROM MEMBERBOARD WHERE MB_ID=? AND MB_PW=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			System.out.println("03 " +id+pw +sql);
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
				res.setMb_able(rs.getString(8));
				res.setMb_role(rs.getString(9));;
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}

}
