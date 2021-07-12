package com.opyung.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opyung.dto.MemberDto;

public class Find_pwDao {
	public MemberDto find_pw(String id, String phone) {
    	Connection con = getConnection();
    	PreparedStatement pstm = null;
    	
    	ResultSet rs = null;
    	MemberDto res = new MemberDto();
    	
    	String sql = "SELECT MB_PW FROM MEMBERBOARD WHERE MB_ID=? AND MB_PHONE=?";
    	
    	try {
    		pstm = con.prepareStatement(sql);
    		pstm.setString(1, id);
    		pstm.setString(2, phone);
    		pstm.setString(3, "Y");
    		System.out.println("03. query 준비 : "+sql);
    		
    		rs = pstm.executeQuery();
    		System.out.println("04.query 실행 및 리턴");
    		
    		while(rs.next()) {
    			res.setMb_no(rs.getInt(1));
                res.setMb_id(rs.getString(2));
                res.setMb_pw(rs.getString(3));
                res.setMb_name(rs.getString(4));
                res.setMb_email(rs.getString(5));
                res.setMb_phone(rs.getString(6));
                res.setMb_addr(rs.getString(7));
                res.setMb_able(rs.getString(8));
                res.setMb_role(rs.getString(9));
    		}
    		
    	} catch (SQLException e) {
    		System.out.println("3/4 단계 오류");
    		e.printStackTrace();
    	}finally {
    		close(rs);
    		close(pstm);
    		close(con);
    		System.out.println("05. db 종료 \n");
    	}
    	
		return null;
    }

	private Connection getConnection() {
		return null;
	}
}
