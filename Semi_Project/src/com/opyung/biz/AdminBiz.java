package com.opyung.biz;

import java.sql.Connection;
import java.util.List;

import com.opyung.dto.MemberDto;
import com.opyung.dao.AdminDao;

import static common.JDBCTemplate.*;

public class AdminBiz {
	
	private AdminDao dao = new AdminDao();
	
	public List<MemberDto> selectAll(){
		Connection con = getConnection();
		
		List<MemberDto> list = dao.selectAll(con);
		
		close(con);
		
		return list;
	}
	
}
