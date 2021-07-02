package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.CommunityDao;
import com.opyung.dto.CommuBoardDto;

import common.JDBCTemplate;

public class CommunityBiz extends JDBCTemplate{

	public CommuBoardDto insert(String id, String content) {
		Connection con = getConnection();
		
		CommunityDao dao = new CommunityDao();
		CommuBoardDto dto = dao.insert(con,id,content);
		
		return null;
	}

}
