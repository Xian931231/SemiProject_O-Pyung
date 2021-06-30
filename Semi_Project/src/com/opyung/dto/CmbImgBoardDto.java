//커뮤니티 이미지 테이블
package com.opyung.dto;

public class CmbImgBoardDto {

	private int cimg_no;
	private int cimg_cmbNo;		//게시글 번호
	private String cimg_src;	//이미지 경로
	private String cimg_name;	//이미지 이름
	private String cimg_type;	//이미지 타입
	private int cimg_size;		//이미지 사이즈
	
	//생성자
	public CmbImgBoardDto() {
		super();
	}

	//매개변수 생성자
	public CmbImgBoardDto(int cimg_no, int cimg_cmbNo, String cimg_src, String cimg_name, String cimg_type,
			int cimg_size) {
		super();
		this.cimg_no = cimg_no;
		this.cimg_cmbNo = cimg_cmbNo;
		this.cimg_src = cimg_src;
		this.cimg_name = cimg_name;
		this.cimg_type = cimg_type;
		this.cimg_size = cimg_size;
	}

	
	//getter & setter
	public int getCimg_no() {
		return cimg_no;
	}

	public void setCimg_no(int cimg_no) {
		this.cimg_no = cimg_no;
	}

	public int getCimg_cmbNo() {
		return cimg_cmbNo;
	}

	public void setCimg_cmbNo(int cimg_cmbNo) {
		this.cimg_cmbNo = cimg_cmbNo;
	}

	public String getCimg_src() {
		return cimg_src;
	}

	public void setCimg_src(String cimg_src) {
		this.cimg_src = cimg_src;
	}

	public String getCimg_name() {
		return cimg_name;
	}

	public void setCimg_name(String cimg_name) {
		this.cimg_name = cimg_name;
	}

	public String getCimg_type() {
		return cimg_type;
	}

	public void setCimg_type(String cimg_type) {
		this.cimg_type = cimg_type;
	}

	public int getCimg_size() {
		return cimg_size;
	}

	public void setCimg_size(int cimg_size) {
		this.cimg_size = cimg_size;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
