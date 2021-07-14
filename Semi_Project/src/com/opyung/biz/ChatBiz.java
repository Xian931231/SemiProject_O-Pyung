package com.opyung.biz;

import java.sql.Connection;

import com.opyung.dao.ChatDao;

import common.JDBCTemplate;

public class ChatBiz extends JDBCTemplate{
	ChatDao dao = new ChatDao();
	
	//채팅내용 저장
	public int insert(int dealno, String id, String msg) {
		Connection con = getConnection();
		
		int res = dao.insert(con, dealno, id, msg);
		if(res >0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return res;
	}

	//채팅방 생성
	public int insertChat(int dealno, String sid, String bid) {
		Connection con = getConnection();
		
		int res = dao.insertChat(con,dealno,sid,bid);
		
		if(res >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return res;
	}

}
