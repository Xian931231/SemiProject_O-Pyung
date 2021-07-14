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
	
	//회원 정보 수정
	public int meminfoUpdate(MemberDto memdto) {
		Connection con = getConnection();
		
		int res = dao.meminfoUpdate(con,memdto);

		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return res;
	}
	
	//회원탈퇴
	public int memberDelete(MemberDto memdto) {
		Connection con = getConnection();
		
		int res = dao.memberDelete(con,memdto);
				
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
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

	//계좌번호 추가
	public int bankInsert(MemberDto memdto) {
		Connection con = getConnection();
		
		int res = dao.bankInsert(con,memdto);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return res;
	}

	//계좌번호 리스트
	public List<MemberDto> bankList(String id) {
		Connection con = getConnection();
		
		List<MemberDto> list = dao.bankList(con,id);
		close(con);
		return list;
	
	}

	//계좌번호 선택
	public MemberDto bankSelect(int bankno,String id) {
		Connection con = getConnection();
		
		MemberDto res = dao.bankSelect(con,bankno,id);
		
		close(con);
		return res;
	}

	//계좌삭제
	public int bankDelete(int bankno) {
		Connection con = getConnection();
		
		int res = dao.bankDelete(con,bankno);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return res;
	}
	
	
	//회원점수 +1
	public int updateScore(String id, int score) {
		
		Connection con = getConnection();
		
		int res = dao.updateScore(con, id, score);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return res;
	}



}
