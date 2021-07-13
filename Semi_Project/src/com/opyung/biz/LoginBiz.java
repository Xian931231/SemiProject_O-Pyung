package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.LoginDao;
import com.opyung.dto.MemberDto;

import common.JDBCTemplate;

public class LoginBiz extends JDBCTemplate{
	
	LoginDao dao = new LoginDao();
	
	//로그인
    public MemberDto login(String id, String pw) {
        Connection con = getConnection();
        
        MemberDto dto = dao.login(con,id,pw);
        
        close(con);
        return dto;
    }
    //회원가입
	public int signup(MemberDto memdto) {
		Connection con = getConnection();
		
		int res = dao.signup(con,memdto);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
				
		close(con);
		return res;
	}
    
    
}
