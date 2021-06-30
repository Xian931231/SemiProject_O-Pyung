//커뮤니티 댓글 테이블
package com.opyung.dto;

import java.util.Date;

public class CmbCommentBoardDto {
	
	//필드
	private int ccom_no;
	private int ccom_cmbNo;
	private String ccom_id;
	private String ccom_content;
	private Date ccom_date;
	
	//생성자
	public CmbCommentBoardDto() {
		super();
	}

	//매개변수 생성자
	public CmbCommentBoardDto(int ccom_no, int ccom_cmbNo, String ccom_id, String ccom_content, Date ccom_date) {
		super();
		this.ccom_no = ccom_no;
		this.ccom_cmbNo = ccom_cmbNo;
		this.ccom_id = ccom_id;
		this.ccom_content = ccom_content;
		this.ccom_date = ccom_date;
	}

	//getter & setter
	public int getCcom_no() {
		return ccom_no;
	}

	public void setCcom_no(int ccom_no) {
		this.ccom_no = ccom_no;
	}

	public int getCcom_cmbNo() {
		return ccom_cmbNo;
	}

	public void setCcom_cmbNo(int ccom_cmbNo) {
		this.ccom_cmbNo = ccom_cmbNo;
	}

	public String getCcom_id() {
		return ccom_id;
	}

	public void setCcom_id(String ccom_id) {
		this.ccom_id = ccom_id;
	}

	public String getCcom_content() {
		return ccom_content;
	}

	public void setCcom_content(String ccom_content) {
		this.ccom_content = ccom_content;
	}

	public Date getCcom_date() {
		return ccom_date;
	}

	public void setCcom_date(Date ccom_date) {
		this.ccom_date = ccom_date;
	}
	
	
	
	
	
	
	
	
	
	
}
