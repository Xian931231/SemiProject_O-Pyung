package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.ReportDao;
import com.opyung.dto.ReportBoardDto;

import common.JDBCTemplate;

public class ReportBiz extends JDBCTemplate{
	ReportDao dao = new ReportDao();
	//신고하기 추가
	public int insert(ReportBoardDto reportDto) {
		Connection con = getConnection();
		
		int res = dao.insert(con,reportDto);
		
		if(res >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return res;
	}

}
