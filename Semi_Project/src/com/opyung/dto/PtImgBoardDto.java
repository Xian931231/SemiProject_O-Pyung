//상품 이미지 테이블 dto

package com.opyung.dto;

public class PtImgBoardDto {

	//필드
	private int ptimg_no;
	private int ptimg_productNo;
	private String ptimg_src;
	private String ptimg_name;
	private String ptimg_type;
	private int ptimg_size;

	//생성자
	public PtImgBoardDto() {
		super();
	}
	
	//매개변수 생성자
	public PtImgBoardDto(int ptimg_no, int ptimg_productNo, String ptimg_src, String ptimg_name, String ptimg_type,
			int ptimg_size) {
		super();
		this.ptimg_no = ptimg_no;
		this.ptimg_productNo = ptimg_productNo;
		this.ptimg_src = ptimg_src;
		this.ptimg_name = ptimg_name;
		this.ptimg_type = ptimg_type;
		this.ptimg_size = ptimg_size;
	}

	
	//getter & setter
	public int getPtimg_no() {
		return ptimg_no;
	}

	public void setPtimg_no(int ptimg_no) {
		this.ptimg_no = ptimg_no;
	}

	public int getPtimg_productNo() {
		return ptimg_productNo;
	}

	public void setPtimg_productNo(int ptimg_productNo) {
		this.ptimg_productNo = ptimg_productNo;
	}

	public String getPtimg_src() {
		return ptimg_src;
	}

	public void setPtimg_src(String ptimg_src) {
		this.ptimg_src = ptimg_src;
	}

	public String getPtimg_name() {
		return ptimg_name;
	}

	public void setPtimg_name(String ptimg_name) {
		this.ptimg_name = ptimg_name;
	}

	public String getPtimg_type() {
		return ptimg_type;
	}

	public void setPtimg_type(String ptimg_type) {
		this.ptimg_type = ptimg_type;
	}

	public int getPtimg_size() {
		return ptimg_size;
	}

	public void setPtimg_size(int ptimg_size) {
		this.ptimg_size = ptimg_size;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
