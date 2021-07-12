package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.Find_pwDao;
import com.opyung.dto.MemberDto;

import common.JDBCTemplate;

public class Find_pwBiz {
	public MemberDto find_id(String id, String phone) {
		Connection con = getConnection();
		
		Find_pwDao dao = new Find_pwDao();
		MemberDto dto = dao.find_pw(id,phone);
		
		close(con);
		return dto;
	}

}
