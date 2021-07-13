package com.opyung.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opyung.dto.MemberDto;

public class Find_pwDao {
	public String find_pw(Connection con, String id, String phone) {
    	PreparedStatement pstm = null;
    	
    	ResultSet rs = null;
    	String find_pw = "";
    	
    	String sql = "SELECT MB_PW FROM MEMBERBOARD WHERE MB_ID=? AND MB_PHONE=?";
    	
    	try {
    		pstm = con.prepareStatement(sql);
    		pstm.setString(1, id);
    		pstm.setString(2, phone);
    		System.out.println("03. query 준비 : "+sql);
    		
    		rs = pstm.executeQuery();
    		System.out.println("04.query 실행 및 리턴");
    		
    		while(rs.next()) {
    			System.out.println("pw : "+rs.getString(1));
                find_pw = rs.getString(1);
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
    	
		return find_pw;
    }

	private Connection getConnection() {
		return null;
	}
}
