package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.opyung.dto.NoticeBoardDto;

import common.JDBCTemplate;

public class NoticeDao extends JDBCTemplate{
	
	public List<NoticeBoardDto> selectAll(Connection con){
		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<NoticeBoardDto> res = new ArrayList<NoticeBoardDto>();
		
		String sql = " SELECT * FROM NOTICEBOARD ORDER BY NOTICE_NO DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("query준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("query 실행 및 리턴");
			
			while(rs.next()) {
				
				NoticeBoardDto tmp = new NoticeBoardDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5),rs.getInt(6));
			
				res.add(tmp);

			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("05. db종료\n");
		}
		
		
		return res;
		
	}
	
	//게시판 글하나 가져오기
	public NoticeBoardDto selectOne(Connection con, int notice_no) {
			
		PreparedStatement pstm = null;
		ResultSet rs = null;
		NoticeBoardDto res = null;
		
		String sql = " SELECT * FROM NOTICEBOARD WHERE NOTICE_NO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("query 준비: " + sql);
			
			pstm.setInt(1, notice_no);
			
			rs = pstm.executeQuery();
			System.out.println("query 실행 및 리턴");
			
			if(rs.next()) {
				res = new NoticeBoardDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5),rs.getInt(6));
				//dto 객체에 db의 데이터를 담음.
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("db종료 \n");
		}
		
		return res;
	}
	
	//글 등록
	public boolean insert(Connection con, NoticeBoardDto dto) {
		
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO NOTICEBOARD VALUES(NVL((SELECT MAX(NOTICE_NO) FROM NOTICEBOARD)+1,0),?,?,'ADMIN',SYSDATE,DEFAULT) ";
		
		
		
		try {
			pstm = con.prepareStatement(sql);
		
			pstm.setString(1, dto.getNotice_title());
			pstm.setString(2, dto.getNotice_content());
			
			System.out.println("쿼리준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("쿼리 실행");
			
		} catch (SQLException e) {
			System.out.println("잘못됐다.");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("db 종료\n");
		}
				
		
		return (res>0)?true:false;
	}
	
	public boolean update(Connection con, NoticeBoardDto dto) {
		
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE NOTICEBOARD SET NOTICE_TITLE=?, NOTICE_CONTENT=? WHERE NOTICE_NO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
		
			pstm.setString(1, dto.getNotice_title());
			pstm.setString(2, dto.getNotice_content());
			pstm.setInt(3, dto.getNotice_no());
			System.out.println("query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("query 실행 및 리턴");
			
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		System.out.println("db 종료\n");
		
		return (res>0)?true:false;
	}
	
	
	
	
	
	public boolean delete(Connection con, int notice_no) {
		
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " DELETE FROM NOTICEBOARD WHERE NOTICE_NO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setInt(1, notice_no);
			System.out.println("query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("db 종료\n");
		}
		
		return (res>0)?true:false;
		
	}
	
}
