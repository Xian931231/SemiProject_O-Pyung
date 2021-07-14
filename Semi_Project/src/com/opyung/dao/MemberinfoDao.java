package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.opyung.dto.MemberDto;

import common.JDBCTemplate;

public class MemberinfoDao extends JDBCTemplate{
	//특정 회원 정보 조회
	public MemberDto selectOne(Connection con, String id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = new MemberDto();
		
		String sql = "SELECT MEMBERBOARD.*,GRADE.GRADE_NAME FROM MEMBERBOARD,GRADE WHERE MB_SCORE BETWEEN GRADE_MIN AND GRADE_MAX AND MB_ID=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03 "+ sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				res.setMb_no(rs.getInt(1));
				res.setMb_id(rs.getString(2));
				res.setMb_pw(rs.getString(3));
				res.setMb_name(rs.getString(4));
				res.setMb_email(rs.getString(5));
				res.setMb_phone(rs.getString(6));
				res.setMb_addr(rs.getString(7));
				res.setMb_addr_latitude(rs.getString(8));
				res.setMb_addr_longitude(rs.getString(9));
				res.setMb_able(rs.getString(10));
				res.setMb_role(rs.getString(11));
				res.setMb_score(rs.getInt(12));
				res.setMb_grade(rs.getString(13));
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

	//회원정보 수정
	public int meminfoUpdate(Connection con, MemberDto memdto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "UPDATE MEMBERBOARD SET MB_PW=?, MB_NAME=?, MB_EMAIL=?, MB_PHONE=?, MB_ADDR=?, MB_ADDR_LATITUDE=?, MB_ADDR_LONGITUDE=? WHERE MB_NO=?";
		
				
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, memdto.getMb_pw());
			pstm.setString(2, memdto.getMb_name());
			pstm.setString(3, memdto.getMb_email());
			pstm.setString(4, memdto.getMb_phone());
			pstm.setString(5, memdto.getMb_addr());
			pstm.setString(6, memdto.getMb_addr_latitude());
			pstm.setString(7, memdto.getMb_addr_longitude());
			pstm.setInt(8, memdto.getMb_no());
			System.out.println("03"+ sql);
			
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
	
	//회원탈퇴
	public int memberDelete(Connection con, MemberDto memdto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "DELETE FROM MEMBERBOARD WHERE MB_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, memdto.getMb_no());
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
	
	//해당 상품이 관심상품 등록했는지 확인
	public boolean isLikePt(Connection con, MemberDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "SELECT * FROM LIKEPRODUCTBOARD WHERE LIKEPT_MEMBERNO=? AND LIKEPT_PRODUCTNO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getLikept_memberNo());
			pstm.setInt(2, dto.getLikept_productNo());
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

	//관심상품 등록
	public int likeInsert(Connection con, MemberDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO LIKEPRODUCTBOARD VALUES(?,?)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getLikept_memberNo());
			pstm.setInt(2, dto.getLikept_productNo());
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

	//관심상품 삭제
	public int likeDelete(Connection con, MemberDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "DELETE FROM LIKEPRODUCTBOARD WHERE LIKEPT_MEMBERNO=? AND LIKEPT_PRODUCTNO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getLikept_memberNo());
			pstm.setInt(2, dto.getLikept_productNo());
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


	//계좌번호 추가
	public int bankInsert(Connection con, MemberDto memdto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO BANKBOARD VALUES(BANKSQ.NEXTVAL,?,?,?,?)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, memdto.getMb_no());
			pstm.setString(2, memdto.getBank_name());
			pstm.setString(3, memdto.getBank_account());
			pstm.setString(4, memdto.getBank_memname());
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


	//계좌번호 리스트
	public List<MemberDto> bankList(Connection con, String id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MemberDto> res = new ArrayList<MemberDto>();
		
		String sql = "SELECT BANKBOARD.* FROM BANKBOARD,MEMBERBOARD WHERE BANK_ID = MB_NO AND MB_ID=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setBank_no(rs.getInt(1));
				dto.setBank_id(rs.getInt(2));
				dto.setBank_name(rs.getString(3));
				dto.setBank_account(rs.getString(4));
				dto.setBank_memname(rs.getString(5));
				
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

	//계좌번호선택
	public MemberDto bankSelect(Connection con,int bankno, String id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = new MemberDto();
		
		String sql = "SELECT BANKBOARD.* FROM BANKBOARD,MEMBERBOARD WHERE BANK_ID = MB_NO AND MB_ID=? AND BANK_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setInt(2, bankno);
			System.out.println("03" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				res.setBank_no(rs.getInt(1));
				res.setBank_id(rs.getInt(2));
				res.setBank_name(rs.getString(3));
				res.setBank_account(rs.getString(4));
				res.setBank_memname(rs.getString(5));
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


	//계좌 삭제
	public int bankDelete(Connection con, int bankno) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "DELETE FROM BANKBOARD WHERE BANK_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, bankno);
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
	
	

	//회원점수 + 1
	public int updateScore(Connection con, String id, int score) {
		
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MEMBERBOARD SET MB_SCORE=? WHERE MB_ID =? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, score);
			pstm.setString(2, id);
			System.out.println("03. query 작성:" + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. 실행");
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	


	


}
