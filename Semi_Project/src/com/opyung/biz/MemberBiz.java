package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.MemberBoardDao;
import com.opyung.dto.MemberDto;

import common.JDBCTemplate;

public class MemberBiz extends JDBCTemplate {

	public MemberDto login(String id, String pw) {
		Connection con = getConnection();
		
		MemberBoardDao dao = new MemberBoardDao();
		MemberDto dto = dao.login(con,id,pw);
		
		close(con);
		return dto;
	}

}
