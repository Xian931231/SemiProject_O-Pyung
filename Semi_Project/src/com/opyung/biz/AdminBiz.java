package com.opyung.biz;

import java.sql.Connection;
import java.util.List;

import com.opyung.dto.MemberDto;
import com.opyung.dao.AdminDao;

import static common.JDBCTemplate.*;

public class AdminBiz {
	
	private AdminDao dao = new AdminDao();
	
	//전체출력
	public List<MemberDto> selectAll(){
		Connection con = getConnection();
		
		List<MemberDto> list = dao.selectAll(con);
		
		close(con);
		
		return list;
	}
	
	public MemberDto selectOne(String mb_id) {
		Connection con = getConnection();
		
		MemberDto dto = dao.selectOne(con,mb_id);
		
		close(con);
		
		return dto;
	}
	
	public boolean black(MemberDto dto) {
		Connection con = getConnection();
		
		boolean res = dao.black(con, dto);
		
		if(res) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return res;
		
	}
	
	//검색창 통한 정렬 및 검색
	
	public MemberDto serchId(String mb_id) {
		Connection con = getConnection();
		
		MemberDto dto = dao.serchId(con, mb_id);
		
		close(con);
		
		return dto;
		
	}
	public MemberDto serchName(String mb_name) {
		return null;
	}
	public MemberDto serchEmail(String mb_email) {
		return null;
	}
	public MemberDto serchPhone(String mb_phone) {
		return null;
	}
	public MemberDto serchable(String mb_able) {
		return null;
	}
}
