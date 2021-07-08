package com.opyung.biz;

import java.sql.Connection;
import java.util.List;

import com.opyung.dao.MemberinfoDao;
import com.opyung.dto.MemberDto;

import common.JDBCTemplate;

public class MemberinfoBiz extends JDBCTemplate{
	MemberinfoDao dao = new MemberinfoDao();
	//한명의 회원 정보 얻기
	public MemberDto selectOne(String id) {
		Connection con = getConnection();
		
		MemberDto res = dao.selectOne(con,id);

		close(con);
		return res;
		
	}
	
	//해당 상품이 관심상품 등록했는지 확인
	public boolean isLikePt(MemberDto dto) {
		Connection con = getConnection();
		
		boolean res = dao.isLikePt(con,dto);
		close(con);
		return res;
	}

	//관심상품 등록
	public int likeInsert(MemberDto dto) {
		Connection con = getConnection();
		
		int res = dao.likeInsert(con,dto);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return res;
	}

	//관심상품 삭제
	public int likeDelete(MemberDto dto) {
		Connection con = getConnection();
		
		int res = dao.likeDelete(con,dto);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return res;
	}


}
