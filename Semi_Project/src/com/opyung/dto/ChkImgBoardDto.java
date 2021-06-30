//검수 이미지 테이블

package com.opyung.dto;

public class ChkImgBoardDto {
	
	//필드
	private int chkimg_no;
	private int chkimg_checkNo;
	private String chkimg_src;
	private String chkimg_name;
	private String chkimg_type;
	private int chkimg_size;

	//생성자
	public ChkImgBoardDto() {
		super();
	}

	//매개변수 생성자
	public ChkImgBoardDto(int chkimg_no, int chkimg_checkNo, String chkimg_src, String chkimg_name, String chkimg_type,
			int chkimg_size) {
		super();
		this.chkimg_no = chkimg_no;
		this.chkimg_checkNo = chkimg_checkNo;
		this.chkimg_src = chkimg_src;
		this.chkimg_name = chkimg_name;
		this.chkimg_type = chkimg_type;
		this.chkimg_size = chkimg_size;
	}

	//getter & setter
	public int getChkimg_no() {
		return chkimg_no;
	}

	public void setChkimg_no(int chkimg_no) {
		this.chkimg_no = chkimg_no;
	}

	public int getChkimg_checkNo() {
		return chkimg_checkNo;
	}

	public void setChkimg_checkNo(int chkimg_checkNo) {
		this.chkimg_checkNo = chkimg_checkNo;
	}

	public String getChkimg_src() {
		return chkimg_src;
	}

	public void setChkimg_src(String chkimg_src) {
		this.chkimg_src = chkimg_src;
	}

	public String getChkimg_name() {
		return chkimg_name;
	}

	public void setChkimg_name(String chkimg_name) {
		this.chkimg_name = chkimg_name;
	}

	public String getChkimg_type() {
		return chkimg_type;
	}

	public void setChkimg_type(String chkimg_type) {
		this.chkimg_type = chkimg_type;
	}

	public int getChkimg_size() {
		return chkimg_size;
	}

	public void setChkimg_size(int chkimg_size) {
		this.chkimg_size = chkimg_size;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
