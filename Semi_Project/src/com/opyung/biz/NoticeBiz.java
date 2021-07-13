package com.opyung.biz;

import java.sql.Connection;
import java.util.List;

import com.opyung.dao.NoticeDao;
import com.opyung.dto.NoticeBoardDto;

import common.JDBCTemplate;

public class NoticeBiz extends JDBCTemplate{
	NoticeDao dao = new NoticeDao();
	
	
	//게시글 전체 조회
	public List<NoticeBoardDto> selectAll(){
		
		Connection con = getConnection();
		List<NoticeBoardDto> list = dao.selectAll(con);
		
		close(con);
		
		return list;
	}
	
	public NoticeBoardDto selectOne(int notice_no) {
		
		Connection con = getConnection();
		
		NoticeBoardDto dto = dao.selectOne(con,notice_no);
		
		close(con);
		
		return dto;
		
	}
	
	
	//게시글 등록
	public boolean insert(NoticeBoardDto dto) {
		
		Connection con = getConnection();
		
		boolean res = dao.insert(con,dto);
		
		if(res) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return res;
	}
	
	public boolean update(NoticeBoardDto dto) {
		
		Connection con = getConnection();
		
		boolean res = dao.update(con, dto);
		
		if(res) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return res;
	}
	
	
	
	//게시글 삭제
	public boolean delete(int notice_no) {
		
		Connection con = getConnection();
		
		boolean res = dao.delete(con,notice_no);
		
		if(res) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return res;
	}
	
}
