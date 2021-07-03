//커뮤니티 테이블, 커뮤니티 이미지 테이블, 커뮤니티 댓글
package com.opyung.dto;

import java.util.Date;

public class CommuBoardDto {
	
	//CommuBoard(커뮤니티 테이블)
	private int cmb_no;
	private String cmb_content;
	private String cmb_id;
	private Date cmb_date;
	private int cmb_like;			//좋아요
	private int cmb_cnt;			//조회수

	//CmbImgBoard(커뮤니티 이미지 테이블)
	private int cimg_no;
	private int cimg_cmbNo;		//게시글 번호
	private String cimg_src;	//이미지 경로
	private String cimg_name;	//이미지 이름
	private String cimg_type;	//이미지 타입
	private int cimg_size;		//이미지 사이즈
	
	//CmbCommentBoard(커뮤니티 댓글)
	private int ccom_no;
	private int ccom_cmbNo;			//게시글 번호
	private String ccom_id;			//작성자 아이디
	private String ccom_content;
	private Date ccom_date;
	
	
	//댓글 수 카운트
	private int ccom_cnt;
	
	public int getCcom_cnt() {
		return ccom_cnt;
	}

	public void setCcom_cnt(int ccom_cnt) {
		this.ccom_cnt = ccom_cnt;
	}

	//생성자
	public CommuBoardDto() {
		super();
	}
	
	//매개변수 생성자
	public CommuBoardDto(int cmb_no, String cmb_content, String cmb_id, Date cmb_date, int cmb_like, int cmb_cnt,
			int cimg_no, int cimg_cmbNo, String cimg_src, String cimg_name, String cimg_type, int cimg_size,
			int ccom_no, int ccom_cmbNo, String ccom_id, String ccom_content, Date ccom_date , int ccom_cnt) {
		super();
		this.cmb_no = cmb_no;
		this.cmb_content = cmb_content;
		this.cmb_id = cmb_id;
		this.cmb_date = cmb_date;
		this.cmb_like = cmb_like;
		this.cmb_cnt = cmb_cnt;
		this.cimg_no = cimg_no;
		this.cimg_cmbNo = cimg_cmbNo;
		this.cimg_src = cimg_src;
		this.cimg_name = cimg_name;
		this.cimg_type = cimg_type;
		this.cimg_size = cimg_size;
		this.ccom_no = ccom_no;
		this.ccom_cmbNo = ccom_cmbNo;
		this.ccom_id = ccom_id;
		this.ccom_content = ccom_content;
		this.ccom_date = ccom_date;
		this.ccom_cnt = ccom_cnt;
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
