//검수내역 테이블
package com.opyung.dto;

public class CheckBoardDto {

	//필드
	private int check_no;
	private int check_dealNo; //거래 넘버
	private String check_id;  //검수자
	private String check_content;
	
	//생성자
	public CheckBoardDto() {
		super();
	}
	
	//매개변수 생성자
	public CheckBoardDto(int check_no, int check_dealNo, String check_id, String check_content) {
		super();
		this.check_no = check_no;
		this.check_dealNo = check_dealNo;
		this.check_id = check_id;
		this.check_content = check_content;
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
	
	
	
	
	
	
	
}
