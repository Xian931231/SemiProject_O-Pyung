package com.opyung.memberBoard.dto;

public class MemberBoardDto {
	
	//필드
	private int mb_no;
	private String mb_id;
	private String mb_pw;
	private String mb_name;
	private String mb_email;
	private String mb_phone;
	private String mb_addr;
	private String mb_able;
	private String mb_role;
	
	//생성자
	public MemberBoardDto() {
		super();
	}
	
	//매개변수 생성자
	public MemberBoardDto(int mb_no, String mb_id, String mb_pw, String mb_name, String mb_email, String mb_phone,
			String mb_addr, String mb_able, String mb_role) {
		super();
		this.mb_no = mb_no;
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
		this.mb_email = mb_email;
		this.mb_phone = mb_phone;
		this.mb_addr = mb_addr;
		this.mb_able = mb_able;
		this.mb_role = mb_role;
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
	
	
	 
	
	
	

	
	
	
	
	
}
