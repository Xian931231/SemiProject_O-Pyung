package com.opyung.dto;

import java.util.Date;

public class NoticeBoardDto {

	//필드
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private String notice_id;
	private Date notice_date;
	private int notice_cnt;
	
	//생성자
	public NoticeBoardDto() {
		super();
	}
	
	//update용 매개변수 3개 생성자
	public NoticeBoardDto(int notice_no, String notice_title, String notice_content) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
	}

	
	//매개변수 생성자
	public NoticeBoardDto(int notice_no, String notice_title, String notice_content, String notice_id, Date notice_date,
			int notice_cnt) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_id = notice_id;
		this.notice_date = notice_date;
		this.notice_cnt = notice_cnt;
	}

	//getter & setter
	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public int getNotice_cnt() {
		return notice_cnt;
	}

	public void setNotice_cnt(int notice_cnt) {
		this.notice_cnt = notice_cnt;
	}
	
	
	
	
	
	
	
}
