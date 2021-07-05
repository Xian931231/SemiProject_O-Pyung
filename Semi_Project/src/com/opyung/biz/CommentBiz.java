package com.opyung.biz;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

import com.opyung.dao.CommentDao;
import com.opyung.dto.CommuBoardDto;

import common.JDBCTemplate;

public class CommentBiz extends JDBCTemplate{
	CommentDao dao = new CommentDao();
	
	//댓글 작성
	public int insert(CommuBoardDto commudto) {
		Connection con = getConnection();
		
		int res = dao.insert(con,commudto);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return res;
	}

	//게시물의 댓글 리스트
	public List<CommuBoardDto> selectCmbnoAll(int cmb_no) {
		Connection con = getConnection();
		
		List<CommuBoardDto> list = dao.selectCmbnoAll(con,cmb_no);
		
		return list;
	}

	//댓글 삭제
	public int delete(int ccom_no) {
		Connection con = getConnection();
		
		int res = dao.delete(con,ccom_no);
		
		if(res>0) {
			commit(con);
		}else{
			rollback(con);
		}
		return res;
	}
	
	//댓글 수정
	public int update(int ccom_no, String content) {
		Connection con = getConnection();
		
		int res = dao.update(con,ccom_no,content);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return res;
	}
	
}
