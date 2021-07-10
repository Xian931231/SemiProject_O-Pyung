//회원정보 테이블, 계좌 테이블, 관심상품

package com.opyung.dto;

public class MemberDto {
	
	//MemberBoard(회원정보)
	private int mb_no;
	private String mb_id;
	private String mb_pw;
	private String mb_name;
	private String mb_email;
	private String mb_phone;
	private String mb_addr;
	private String mb_addr_latitude;
	private String mb_addr_longitude;
	private String mb_able;
	private String mb_role;
	private int mb_score;
	private String mb_grade;

	//BankBoard(계좌 테이블)
	private int bank_no;
	private int bank_id;
	private String bank_name;
	private String bank_account;
	private String bank_memname;
	
	//LikeProductBoard(관심상품)
	private int likept_memberNo;		//좋아요 누른 사용자
	private int likept_productNo;		//좋아요 눌린 상품 ID
	
	//생성자
	public MemberDto() {
		super();
	}
	
	
	//admin 유저 정보 매개변수 생성자
	
	public MemberDto(String mb_id, String mb_pw, String mb_name, String mb_email, String mb_phone, String mb_able,
			int mb_score) {
		super();
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
		this.mb_email = mb_email;
		this.mb_phone = mb_phone;
		this.mb_able = mb_able;
		this.mb_score = mb_score;
	}
	


	//매개변수 생성자
	public MemberDto(int mb_no, String mb_id, String mb_pw, String mb_name, String mb_email, String mb_phone,
			String mb_addr, String mb_addr_latitude, String mb_addr_longitude, String mb_able, String mb_role,
			int bank_no, int bank_id, String bank_account, int likept_memberNo, int likept_productNo) {
		super();
		this.mb_no = mb_no;
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
		this.mb_email = mb_email;
		this.mb_phone = mb_phone;
		this.mb_addr = mb_addr;
		this.mb_addr_latitude = mb_addr_latitude;
		this.mb_addr_longitude = mb_addr_longitude;
		this.mb_able = mb_able;
		this.mb_role = mb_role;
		this.bank_no = bank_no;
		this.bank_id = bank_id;
		this.bank_account = bank_account;
		this.likept_memberNo = likept_memberNo;
		this.likept_productNo = likept_productNo;
	}
	
	

	
	






	//getter & setter
	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getMb_email() {
		return mb_email;
	}

	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}

	public String getMb_phone() {
		return mb_phone;
	}

	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}

	public String getMb_addr() {
		return mb_addr;
	}

	public void setMb_addr(String mb_addr) {
		this.mb_addr = mb_addr;
	}

	public String getMb_addr_latitude() {
		return mb_addr_latitude;
	}

	public void setMb_addr_latitude(String mb_addr_latitude) {
		this.mb_addr_latitude = mb_addr_latitude;
	}

	public String getMb_addr_longitude() {
		return mb_addr_longitude;
	}

	public void setMb_addr_longitude(String mb_addr_longitude) {
		this.mb_addr_longitude = mb_addr_longitude;
	}

	public String getMb_able() {
		return mb_able;
	}

	public void setMb_able(String mb_able) {
		this.mb_able = mb_able;
	}

	public String getMb_role() {
		return mb_role;
	}

	public void setMb_role(String mb_role) {
		this.mb_role = mb_role;
	}

	public int getBank_no() {
		return bank_no;
	}

	public void setBank_no(int bank_no) {
		this.bank_no = bank_no;
	}

	public int getBank_id() {
		return bank_id;
	}

	public void setBank_id(int bank_id) {
		this.bank_id = bank_id;
	}

	public String getBank_account() {
		return bank_account;
	}

	public void setBank_account(String bank_account) {
		this.bank_account = bank_account;
	}

	public int getLikept_memberNo() {
		return likept_memberNo;
	}

	public void setLikept_memberNo(int likept_memberNo) {
		this.likept_memberNo = likept_memberNo;
	}

	public int getLikept_productNo() {
		return likept_productNo;
	}

	public void setLikept_productNo(int likept_productNo) {
		this.likept_productNo = likept_productNo;
	}
	
	public int getMb_score() {
		return mb_score;
	}

	public void setMb_score(int mb_score) {
		this.mb_score = mb_score;
	}

	public String getMb_grade() {
		return mb_grade;
	}

	public void setMb_grade(String mb_grade) {
		this.mb_grade = mb_grade;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getBank_memname() {
		return bank_memname;
	}

	public void setBank_memname(String bank_memname) {
		this.bank_memname = bank_memname;
	}
	
	
}
