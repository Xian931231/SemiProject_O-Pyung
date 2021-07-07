package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opyung.dto.MemberDto;

import common.JDBCTemplate;

public class LoginDao extends JDBCTemplate{
	//로그인
	public MemberDto login(Connection con, String id, String pw) {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        MemberDto res = new MemberDto();
        
        String sql = " SELECT MEMBERBOARD.*,GRADE.GRADE_NAME FROM MEMBERBOARD,GRADE WHERE MB_SCORE BETWEEN GRADE_MIN AND GRADE_MAX AND MB_ID=? AND MB_PW=?";
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.setString(2, pw);
            System.out.println("03 " +id+pw +sql);
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
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstm);
        }
        
        return res;
    }

    //회원가입
	public int signup(Connection con, MemberDto memdto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO MEMBERBOARD VALUES(MEMBERSQ.NEXTVAL,?,?,?,?,?,?,?,?,'Y','USER','0') ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, memdto.getMb_id());
			pstm.setString(2, memdto.getMb_pw());
			pstm.setString(3, memdto.getMb_name());
			pstm.setString(4, memdto.getMb_email());
			pstm.setString(5, memdto.getMb_phone());
			pstm.setString(6, memdto.getMb_addr());
			pstm.setString(7, memdto.getMb_addr_latitude());
			pstm.setString(8, memdto.getMb_addr_longitude());
			System.out.println("03" + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04");
		} catch (SQLException e) {
			System.out.println("3/4 error");
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		return res;
	}
}

