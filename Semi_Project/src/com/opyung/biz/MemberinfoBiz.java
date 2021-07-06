package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.MemberinfoDao;
import com.opyung.dto.MemberDto;

import common.JDBCTemplate;

public class MemberinfoBiz extends JDBCTemplate{
	MemberinfoDao dao = new MemberinfoDao();
	//한명의 회원 정보 얻기
	public MemberDto selectOne(String id) {
		Connection con = getConnection();
		
		MemberDto res = dao.selectOne(con,id);
		return res;
	}

}
