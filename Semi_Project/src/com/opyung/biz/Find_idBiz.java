package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.Find_idDao;
import com.opyung.dto.MemberDto;

import common.JDBCTemplate;

public class Find_idBiz extends JDBCTemplate {
	//
	public MemberDto find_id(String name, String phone) {
		Connection con = getConnection();
		
		Find_idDao dao = new Find_idDao();
		MemberDto dto = dao.find_id(name,phone);
		
		close(con);
		return dto;
	}
}
