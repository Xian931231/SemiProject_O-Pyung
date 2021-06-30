//커뮤니티 테이블
package com.opyung.dto;

import java.util.Date;

public class CommuBoardDto {
	
	//필드
	private int cmb_no;
	private String cmb_content;
	private String cmb_id;
	private Date cmb_date;
	private int cmb_like;			//좋아요
	private int cmb_cnt;			//조회수
	
	//생성자
	public CommuBoardDto() {
		super();
	}
	
	//매개변수 생성자
	public CommuBoardDto(int cmb_no, String cmb_content, String cmb_id, Date cmb_date, int cmb_like,
			int cmb_cnt) {
		super();
		this.cmb_no = cmb_no;
		this.cmb_content = cmb_content;
		this.cmb_id = cmb_id;
		this.cmb_date = cmb_date;
		this.cmb_like = cmb_like;
		this.cmb_cnt = cmb_cnt;
	}

	
	//getter & setter
	public int getCmb_no() {
		return cmb_no;
	}

	public void setCmb_no(int cmb_no) {
		this.cmb_no = cmb_no;
	}

	public String getCmb_content() {
		return cmb_content;
	}

	public void setCmb_content(String cmb_content) {
		this.cmb_content = cmb_content;
	}

	public String getCmb_id() {
		return cmb_id;
	}

	public void setCmb_id(String cmb_id) {
		this.cmb_id = cmb_id;
	}

	public Date getCmb_date() {
		return cmb_date;
	}

	public void setCmb_date(Date cmb_date) {
		this.cmb_date = cmb_date;
	}

	public int getCmb_like() {
		return cmb_like;
	}

	public void setCmb_like(int cmb_like) {
		this.cmb_like = cmb_like;
	}

	public int getCmb_cnt() {
		return cmb_cnt;
	}

	public void setCmb_cnt(int cmb_cnt) {
		this.cmb_cnt = cmb_cnt;
	}
	
	
	
	
	
	
	
	
}
