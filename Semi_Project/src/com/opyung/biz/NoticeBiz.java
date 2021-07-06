package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.NoticeDao;
import com.opyung.dto.NoticeBoardDto;

import common.JDBCTemplate;

public class NoticeBiz extends JDBCTemplate{
	
	public boolean insert(NoticeBoardDto dto) {
		
		Connection con = getConnection();
		
		NoticeDao dao = new NoticeDao();
		
		boolean res = dao.insert(con,dto);
		
		if(res) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return res;
	}
}
