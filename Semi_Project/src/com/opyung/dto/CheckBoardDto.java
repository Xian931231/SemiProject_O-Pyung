//검수내역 테이블, 검수 이미지 테이블 
package com.opyung.dto;

public class CheckBoardDto {

	//CheckBoard(검수 내역 테이블)
	private int check_no;
	private int check_dealNo; //거래 넘버
	private String check_id;  //검수자
	private String check_content;
	
	//ChkImgBoard(검수 이미지 테이블)
	private int chkimg_no;
	private int chkimg_checkNo;
	private String chkimg_src;
	private String chkimg_name;
	private String chkimg_type;
	private int chkimg_size;
	
	//생성자
	public CheckBoardDto() {
		super();
	}
	
	//매개변수 생성자
	public CheckBoardDto(int check_no, int check_dealNo, String check_id, String check_content, int chkimg_no,
			int chkimg_checkNo, String chkimg_src, String chkimg_name, String chkimg_type, int chkimg_size) {
		super();
		this.check_no = check_no;
		this.check_dealNo = check_dealNo;
		this.check_id = check_id;
		this.check_content = check_content;
		this.chkimg_no = chkimg_no;
		this.chkimg_checkNo = chkimg_checkNo;
		this.chkimg_src = chkimg_src;
		this.chkimg_name = chkimg_name;
		this.chkimg_type = chkimg_type;
		this.chkimg_size = chkimg_size;
	}
	
	//getter & setter
	public int getCheck_no() {
		return check_no;
	}
	public void setCheck_no(int check_no) {
		this.check_no = check_no;
	}
	public int getCheck_dealNo() {
		return check_dealNo;
	}
	public void setCheck_dealNo(int check_dealNo) {
		this.check_dealNo = check_dealNo;
	}
	public String getCheck_id() {
		return check_id;
	}
	public void setCheck_id(String check_id) {
		this.check_id = check_id;
	}
	public String getCheck_content() {
		return check_content;
	}
	public void setCheck_content(String check_content) {
		this.check_content = check_content;
	}
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
