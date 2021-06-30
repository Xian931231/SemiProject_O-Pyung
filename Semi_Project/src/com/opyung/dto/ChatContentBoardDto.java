package com.opyung.dto;

import java.util.Date;

public class ChatContentBoardDto {

	//필드
	private int ccb_no;
	private int ccb_chatNo;
	private String ccb_id;
	private String ccb_content;
	private Date ccb_date;

	//생성자
	public ChatContentBoardDto() {
		super();
	}

	//매개변수 생성자
	public ChatContentBoardDto(int ccb_no, int ccb_chatNo, String ccb_id, String ccb_content, Date ccb_date) {
		super();
		this.ccb_no = ccb_no;
		this.ccb_chatNo = ccb_chatNo;
		this.ccb_id = ccb_id;
		this.ccb_content = ccb_content;
		this.ccb_date = ccb_date;
	}

	//getter & setter
	public int getCcb_no() {
		return ccb_no;
	}

	public void setCcb_no(int ccb_no) {
		this.ccb_no = ccb_no;
	}

	public int getCcb_chatNo() {
		return ccb_chatNo;
	}

	public void setCcb_chatNo(int ccb_chatNo) {
		this.ccb_chatNo = ccb_chatNo;
	}

	public String getCcb_id() {
		return ccb_id;
	}

	public void setCcb_id(String ccb_id) {
		this.ccb_id = ccb_id;
	}

	public String getCcb_content() {
		return ccb_content;
	}

	public void setCcb_content(String ccb_content) {
		this.ccb_content = ccb_content;
	}

	public Date getCcb_date() {
		return ccb_date;
	}

	public void setCcb_date(Date ccb_date) {
		this.ccb_date = ccb_date;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
