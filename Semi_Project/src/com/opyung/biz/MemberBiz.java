package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.MemberBoardDao;
import com.opyung.dto.MemberBoardDto;

import common.JDBCTemplate;

public class MemberBiz extends JDBCTemplate {

	public MemberBoardDto login(String id, String pw) {
		Connection con = getConnection();
		
		MemberBoardDao dao = new MemberBoardDao();
		MemberBoardDto dto = dao.login(con,id,pw);
		
		close(con);
		return dto;
	}

}
