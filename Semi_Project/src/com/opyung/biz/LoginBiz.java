package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.LoginDao;
import com.opyung.dto.MemberDto;

import common.JDBCTemplate;

public class LoginBiz extends JDBCTemplate{
	
    public MemberDto login(String id, String pw) {
        Connection con = getConnection();
        
        LoginDao dao = new LoginDao();
        MemberDto dto = dao.login(con,id,pw);
        
        close(con);
        return dto;
    }
    
    
}
