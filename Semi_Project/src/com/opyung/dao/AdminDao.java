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
				MemberDto tmp = new MemberDto(rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return null;
	}
	
	
}
