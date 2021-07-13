package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.Find_pwDao;
import com.opyung.dto.MemberDto;

import common.JDBCTemplate;

public class Find_pwBiz extends JDBCTemplate {
	//
	public String find_pw(String id, String phone) {
		Connection con = getConnection();
		
		Find_pwDao dao = new Find_pwDao();
		String find_pw = dao.find_pw(con,id,phone);
		
		close(con);
		return find_pw;
	}

}
