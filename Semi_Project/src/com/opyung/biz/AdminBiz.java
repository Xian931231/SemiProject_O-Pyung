package com.opyung.biz;

import java.sql.Connection;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.concurrent.CountDownLatch;

import com.opyung.dto.DealBoardDto;
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
	
	//유저 정지
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
	
	
	//유저 정지 해지
	public int blackCancel(MemberDto dto) {
		
		Connection con = getConnection();
		
		int res = dao.blackCancel(con, dto);
		
		if(res>0) {
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
	////////////////////////user_deal///////////////////////////////////
	
	public List<DealBoardDto> dealAll(){
		Connection con = getConnection();
		
		List<DealBoardDto> list = dao.dealAll(con);
		
		close(con);
		
		
		
		
		return list;
	}
	public DealBoardDto dealselect(int sche_no) {
		Connection con = getConnection();
		
		DealBoardDto dto = dao.dealselect(con,sche_no);
		
		close(con);
		
		return dto;
	}
	
	public boolean dealupdate(String dealselect,String start,String end, int sche_no) {
		
		
		
		Connection con = getConnection();
		
		boolean res = dao.dealupdate(con,dealselect,start,end,sche_no);
		
		
		if(res) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		
		close(con);
		
		return res;
	}
	
	
	public List<DealBoardDto> countready() {
		Connection con = getConnection();
		
		List<DealBoardDto> countready = dao.countready(con);
		
		close(con);
		
		return countready;
	}
	public List<DealBoardDto> counting() {
		Connection con = getConnection();
		
		List<DealBoardDto> counting = dao.counting(con);
		
		close(con);
		
		return counting;
	}
	public List<DealBoardDto> countgo() {
		Connection con = getConnection();
		
		List<DealBoardDto> countgo = dao.countgo(con);
		
		close(con);
		
		return countgo;
	}
	
	////////////////////////user_report///////////////////////////////////
	
	public List<ReportBoardDto> reportAll(){
		Connection con = getConnection();
		
		List<ReportBoardDto> list = dao.reportAll(con);
		
		close(con);
		
		
		return list;
	}
	
	public List<ReportBoardDto> count() {
		Connection con = getConnection();
		
		List<ReportBoardDto> count = dao.count(con);
		
		close(con);
		
		return count;
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
