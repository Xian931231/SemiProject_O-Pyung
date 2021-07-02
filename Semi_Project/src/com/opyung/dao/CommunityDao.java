package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.opyung.dto.CommuBoardDto;

import common.JDBCTemplate;

public class CommunityDao extends JDBCTemplate{

	public CommuBoardDto insert(Connection con, String id, String content) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		CommuBoardDto res = null;
		
		String sql = "INSERT INTO COMMUBOARD VALUES(COMMUSQ,?,?,SYSDATE,0,0)";
		return null;
	}

}
