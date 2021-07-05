package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.opyung.dto.ReportBoardDto;

import common.JDBCTemplate;

public class ReportDao extends JDBCTemplate{

	public int insert(Connection con, ReportBoardDto reportDto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO REPORTBOARD VALUES(REPORTSQ.NEXTVAL,?,?,?,?,SYSDATE,NULL)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, reportDto.getReport_tid());
			pstm.setString(2, reportDto.getReport_id());
			pstm.setString(3, reportDto.getReport_title());
			pstm.setString(4, reportDto.getReport_content());
			System.out.println("03" + sql);
			
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

}
