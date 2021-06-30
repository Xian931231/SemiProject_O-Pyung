//거래 일정
package com.opyung.dto;

import java.util.Date;

public class DealScheduleBoardDto {

	//필드
	private int schedule_no;
	private int schedule_dealNo;		//거래 테이블 넘버
	private String schedule_status;
	private Date sdate;					//상태시작
	private Date edate;					//상태종료
	
	//생성자
	public DealScheduleBoardDto() {
		super();
	}
	
	//매개변수 생성자
	public DealScheduleBoardDto(int schedule_no, int schedule_dealNo, String schedule_status, Date sdate, Date edate) {
		super();
		this.schedule_no = schedule_no;
		this.schedule_dealNo = schedule_dealNo;
		this.schedule_status = schedule_status;
		this.sdate = sdate;
		this.edate = edate;
	}
	
	//getter & setter
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public int getSchedule_dealNo() {
		return schedule_dealNo;
	}
	public void setSchedule_dealNo(int schedule_dealNo) {
		this.schedule_dealNo = schedule_dealNo;
	}
	public String getSchedule_status() {
		return schedule_status;
	}
	public void setSchedule_status(String schedule_status) {
		this.schedule_status = schedule_status;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
	}
	
	
	
	
	
	
	
}
