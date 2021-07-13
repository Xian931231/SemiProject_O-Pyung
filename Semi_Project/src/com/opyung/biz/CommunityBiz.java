package com.opyung.biz;

import java.sql.Connection;
import java.util.List;

import com.opyung.dao.CommunityDao;
import com.opyung.dto.CommuBoardDto;

import common.JDBCTemplate;

public class CommunityBiz extends JDBCTemplate{
	CommunityDao dao = new CommunityDao();
	
	//커뮤테이블
	
	
	//전체출력
	public List<CommuBoardDto> selectAll() {
		Connection con = getConnection();
		List<CommuBoardDto> list = dao.selectAll(con);
		
		
		close(con);
		return list;
	}

	
	
	//디테일 화면
	public CommuBoardDto selectOne(int cmb_no) {
		Connection con = getConnection();
		
		CommuBoardDto dto = dao.selectOne(con,cmb_no);
		close(con);
		
		return dto;
	}
	//게시글추가
	public int insert(CommuBoardDto commudto) {
		Connection con = getConnection();
		
		
		int res = dao.insert(con,commudto);
		if(res >0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
        return res;
	}

	
	
	
	//게시글 수정
	public int update(CommuBoardDto commudto) {
		Connection con = getConnection();
		
		int res = dao.update(con,commudto);
		
		if(res>0) {
			System.out.println("성공");
			commit(con);
		}else {
			System.out.println("실패");
			rollback(con);
		}
		
		close(con);
		return res;
	}
	
	
	//게시글 삭제

	public boolean delete(int cmb_no) {
		Connection con = getConnection();
		
		boolean res = dao.delete(con,cmb_no);
		
		if(res) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return res;
	}
	
	
	
	
	//이미지테이블
	
	//이미지 추가
	public int insertImg(CommuBoardDto commudto) {
		Connection con = getConnection();
		
		int res = dao.insertImg(con,commudto);
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return res;
	}


	//이미지 수정
	public int updateImg(CommuBoardDto commudto) {
		Connection con = getConnection();
		
		int res = dao.updateImg(con,commudto);
		
		
		if(res > 0) {
			System.out.println("성공");
			commit(con);
		}else {
			System.out.println("이미지실패");
			rollback(con);
		}
		close(con);
		return res;
	}









	//마지막 번호
	public int lastno() {
		Connection con = getConnection();
		
		int res = dao.lastno(con);
		
		close(con);
		return res;
	}












}
