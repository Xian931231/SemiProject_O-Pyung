package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBCTemplate;

public class ChatDao extends JDBCTemplate{

	//채팅방 생성
	public int insertChat(Connection con, int dealno, String sid, String bid) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO CHATBOARD VALUES(?,?,?,SYSDATE,NULL)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dealno);
			pstm.setString(2, sid);
			pstm.setString(3, bid);
			
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

	//채팅 내용 저장
	public int insert(Connection con, int dealno, String id, String msg) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO CHATCONTENTBOARD VALUES(NVL((SELECT MAX(CCB_NO) FROM CHATCONTENTBOARD)+1,0),?,?,?,SYSDATE)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1,dealno);
			pstm.setString(2, id);
			pstm.setString(3, msg);
			
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
