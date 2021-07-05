package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.opyung.dto.CommuBoardDto;

import common.JDBCTemplate;

public class CommentDao extends JDBCTemplate{
	//댓글 작성
	public int insert(Connection con, CommuBoardDto dto) {
		PreparedStatement pstm = null;
		int res =0;
		
		String sql = "INSERT INTO CMBCOMMENTBOARD VALUES(COMMENTSQ.NEXTVAL,?,?,?,SYSDATE)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getCcom_cmbNo());
			pstm.setString(2, dto.getCcom_id());
			pstm.setNString(3, dto.getCcom_content());
			System.out.println("03" + sql);

			res = pstm.executeUpdate();
			System.out.println("04");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		return res;
	}

	//게시물의 댓글 리스트
	public List<CommuBoardDto> selectCmbnoAll(Connection con, int cmb_no) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<CommuBoardDto> res = new ArrayList<CommuBoardDto>();
		
		String sql = "SELECT * FROM CMBCOMMENTBOARD WHERE CCOM_CMBNO = ? ORDER BY CCOM_NO";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, cmb_no);
			System.out.println("03" +sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				CommuBoardDto dto = new CommuBoardDto();
				dto.setCcom_no(rs.getInt(1));
				dto.setCcom_cmbNo(rs.getInt(2));
				dto.setCcom_id(rs.getString(3));
				dto.setCcom_content(rs.getString(4));
				dto.setCcom_date(rs.getDate(5));
				
				res.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}

	//댓글삭제
	public int delete(Connection con, int ccom_no) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "DELETE FROM CMBCOMMENTBOARD WHERE CCOM_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, ccom_no);
			System.out.println("03" + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		return res;
	}

	//댓글 수정
	public int update(Connection con, int ccom_no, String content) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "UPDATE CMBCOMMENTBOARD SET CCOM_CONTENT = ? WHERE CCOM_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, content);
			pstm.setInt(2, ccom_no);
			System.out.println("03" + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		return res;
	}

}
