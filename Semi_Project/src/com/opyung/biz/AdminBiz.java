package com.opyung.biz;

import java.sql.Connection;
import java.util.List;

import com.opyung.dto.MemberDto;
import com.opyung.dto.ReportBoardDto;
import com.opyung.dao.AdminDao;

import static common.JDBCTemplate.*;

public class AdminBiz {
	
	private AdminDao dao = new AdminDao();
	////////////////////user_Info/////////////////////
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
	
	public List<MemberDto> search(String keyword,String keyField) {
		Connection con = getConnection();
		
		List<MemberDto> list = dao.search(con, keyword, keyField);
		
		close(con);
		
		return list;
		
	}
	////////////////////////user_report///////////////////////////////////
	
	public List<ReportBoardDto> reportAll(){
		Connection con = getConnection();
		
		List<ReportBoardDto> list = dao.reportAll(con);
		
		close(con);
		
		
		return list;
	}
	
	public ReportBoardDto reselect(int report_no) {
		Connection con = getConnection();
		
		ReportBoardDto dto = dao.reselect(con,report_no);
		
		close(con);
		
		return dto;
	}
	
	public boolean edate(int report_no) {
		Connection con = getConnection();
		
		boolean res = dao.edate(con,report_no);
		
		if(res) {
			commit(con);
		
		}else {
			rollback(con);
		}
		close(con);
		
		return res;
	}
	
	
	
	public boolean minus(String report_tid) {
		Connection con = getConnection();
		
		boolean res = dao.minus(con,report_tid);
		
		if(res) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return res;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
