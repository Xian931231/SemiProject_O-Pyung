package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.opyung.dto.CommuBoardDto;

import common.JDBCTemplate;

public class CommunityDao extends JDBCTemplate{
	//커뮤테이블
	
	//전체 출력
	public List<CommuBoardDto> selectAll(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<CommuBoardDto> res = new ArrayList<CommuBoardDto>();
		
		String sql = "SELECT COMMUBOARD.*,CMBIMGBOARD.*,(SELECT COUNT(*) FROM CMBCOMMENTBOARD WHERE CCOM_CMBNO=CMB_NO) AS CCOM_CNT FROM COMMUBOARD,CMBIMGBOARD  WHERE CMB_NO = CIMG_CMBNO ORDER BY CMB_NO DESC";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");

			while(rs.next()) {
				CommuBoardDto dto = new CommuBoardDto();
				dto.setCmb_no(rs.getInt(1));
				dto.setCmb_content(rs.getString(2));
				dto.setCmb_id(rs.getString(3));
				dto.setCmb_date(rs.getDate(4));
				dto.setCmb_like(rs.getInt(5));
				dto.setCmb_cnt(rs.getInt(6));
				dto.setCimg_no(rs.getInt(7));
				dto.setCimg_cmbNo(rs.getInt(8));
				dto.setCimg_src(rs.getString(9));
				dto.setCimg_name(rs.getString(10));
				dto.setCimg_type(rs.getString(11));
				dto.setCimg_size(rs.getInt(12));
				dto.setCcom_cnt(rs.getInt(13));
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
	
	
	//디테일 화면
	public CommuBoardDto selectOne(Connection con,int cmb_no) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		CommuBoardDto res = new CommuBoardDto();
		
		String sql = "SELECT * FROM COMMUBOARD,CMBIMGBOARD WHERE CMB_NO = CIMG_CMBNO AND CMB_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, cmb_no);
			System.out.println("03" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				res.setCmb_no(rs.getInt(1));
				res.setCmb_content(rs.getString(2));
				res.setCmb_id(rs.getString(3));
				res.setCmb_date(rs.getDate(4));
				res.setCmb_like(rs.getInt(5));
				res.setCmb_cnt(rs.getInt(6));
				res.setCimg_no(rs.getInt(7));
				res.setCimg_cmbNo(rs.getInt(8));
				res.setCimg_src(rs.getString(9));
				res.setCimg_name(rs.getString(10));
				res.setCimg_type(rs.getString(11));
				res.setCimg_size(rs.getInt(12));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}	
		return res;
	}
	//커뮤니티 게시글 추가
	public int insert(Connection con, CommuBoardDto commudto) {
		PreparedStatement pstm = null;
		int res=0;
		String sql = "INSERT INTO COMMUBOARD VALUES(?,?,?,SYSDATE,0,0)";
		
	
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, commudto.getCmb_no());
			pstm.setString(2, commudto.getCmb_content());
			pstm.setString(3, commudto.getCmb_id());
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
	
	//커뮤니티 게시글 수정

	public int update(Connection con, CommuBoardDto commudto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "UPDATE COMMUBOARD SET CMB_CONTENT=? WHERE CMB_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, commudto.getCmb_content());
			pstm.setInt(2, commudto.getCmb_no());
			System.out.println("03" + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return res;
	}

	//커뮤니티 게시글 삭제

	public boolean delete(Connection con, int cmb_no) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "DELETE FROM COMMUBOARD WHERE CMB_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, cmb_no);
			System.out.println("03" + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		return (res>0)?true:false;
	}
	
	
	//커뮤이미지 테이블
	
	
	//이미지 추가
	public int insertImg(Connection con, CommuBoardDto commudto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO CMBIMGBOARD VALUES(COMMUIMGSQ.NEXTVAL,?,?,?,?,?)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, commudto.getCmb_no());
			pstm.setString(2, commudto.getCimg_src());
			pstm.setString(3, commudto.getCimg_name());
			pstm.setString(4, commudto.getCimg_type());
			pstm.setInt(5, commudto.getCimg_size());
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

	//이미지 수정
	public int updateImg(Connection con, CommuBoardDto commudto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql ="UPDATE CMBIMGBOARD SET CIMG_NAME=?, CIMG_TYPE=?, CIMG_SIZE=? WHERE CIMG_CMBNO=?";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, commudto.getCimg_name());
			pstm.setString(2, commudto.getCimg_type());
			pstm.setInt(3, commudto.getCimg_size());
			pstm.setInt(4, commudto.getCmb_no());
			System.out.println("03" + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return res;
	}
	
	//커뮤니티 마지막 번호
	public int lastno(Connection con) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		int res = 0;
		
		String sql = "SELECT CMB_NO FROM(SELECT * FROM COMMUBOARD ORDER BY CMB_NO DESC)WHERE ROWNUM = 1";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03");
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				res = rs.getInt(1);
				System.out.println("번호 :" +rs.getInt(1));
				System.out.println("번호 :"+res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}




}
