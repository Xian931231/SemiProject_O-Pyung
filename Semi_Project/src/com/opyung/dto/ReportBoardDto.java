package com.opyung.dto;

import java.util.Date;

public class ReportBoardDto {
	
	//필드
	private int report_no;
	private String report_tid; 		//신고 대상자
	private String report_id; 		//신고자
	private String report_title;
	private String report_content;
	private Date report_sdate;  	//신고날짜
	private Date report_edate; 		//신고 처리 날짜
	
	//생성자
	public ReportBoardDto() {
		super();
	}
	
	//admin 신고 처리 매개변수 생성자
	
	public ReportBoardDto(int report_no, String report_tid, String report_id, String report_content,
			Date report_sdate) {
		super();
		this.report_no = report_no;
		this.report_tid = report_tid;
		this.report_id = report_id;
		this.report_content = report_content;
		this.report_sdate = report_sdate;
	}

	//매개변수 생성자
	public ReportBoardDto(int report_no, String report_tid, String report_id, String report_title,
			String report_content, Date report_sdate, Date report_edate) {
		super();
		this.report_no = report_no;
		this.report_tid = report_tid;
		this.report_id = report_id;
		this.report_title = report_title;
		this.report_content = report_content;
		this.report_sdate = report_sdate;
		this.report_edate = report_edate;
	}

	//getter & setter
	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getReport_tid() {
		return report_tid;
	}

	public void setReport_tid(String report_tid) {
		this.report_tid = report_tid;
	}

	public String getReport_id() {
		return report_id;
	}

	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}

	public String getReport_title() {
		return report_title;
	}

	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public Date getReport_sdate() {
		return report_sdate;
	}

	public void setReport_sdate(Date report_sdate) {
		this.report_sdate = report_sdate;
	}

	public Date getReport_edate() {
		return report_edate;
	}

	public void setReport_edate(Date report_edate) {
		this.report_edate = report_edate;
	}
	
	

	
	
	
	
	
}
