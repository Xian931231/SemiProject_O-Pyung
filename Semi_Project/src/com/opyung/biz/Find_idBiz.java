package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.Find_idDao;
import com.opyung.dto.MemberDto;

import common.JDBCTemplate;

public class Find_idBiz extends JDBCTemplate {
	//
	public String find_id(String name, String phone) {
		Connection con = getConnection();
		
		Find_idDao dao = new Find_idDao();
		String find_id = dao.find_id(con,name,phone);
		
		close(con);
		return find_id;
	}
}
