package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.opyung.dto.NoticeBoardDto;

import common.JDBCTemplate;

public class NoticeDao extends JDBCTemplate{
	
	public boolean insert(Connection con, NoticeBoardDto dto) {
		
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO NOTICEBOARD VALUES((SELECT MAX(NOTICE_NO) FROM NOTICEBOARD)+1,?,?,?,SYSDATE,DEFAULT) ";
		
		
		
		try {
			pstm = con.prepareStatement(sql);
		
			pstm.setString(1, dto.getNotice_title());
			pstm.setString(2, dto.getNotice_content());
			pstm.setString(3, dto.getNotice_id());
			
			System.out.println("쿼리준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("쿼리 실행");
			
		} catch (SQLException e) {
			System.out.println("잘못됐다.");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("db 종료\n");
		}
				
		
		return (res>0)?true:false;
	}
}
