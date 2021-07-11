//거래 테이블, 거래 일정 테이블

package com.opyung.dto;

import java.util.Date;

public class DealBoardDto {

	//DealBoard(거래 테이블)
	private int deal_no;
	private int deal_productNo;
	private String deal_sid;		//판매자 (seller)
	private String deal_bid;		//구매자 (buyer)
	private int deal_price; 		//결제한 금액

	//DealScheduleBoard(거래 일정 테이블)
	private int schedule_no;
	private int schedule_dealNo;		//거래 테이블 넘버
	private String schedule_status;
	private Date sdate;					//상태시작
	private Date edate;					//상태종료
	
	//조인용 변수
	private String product_title;
	private int rownum;
	private String ptimg_name;
	private String ptimg_type;
	private String check_id;
	private int product_price;
	private String product_status;
	private int product_no;

	
	//생성자
	public DealBoardDto() {
		super();
	}
	
	//admin_deal용 매개변수 생성자
	public DealBoardDto(int deal_no,String product_title, String deal_sid, String deal_bid, String schedule_status, Date sdate, Date edate
			) {
		super();
		this.deal_no = deal_no;
		this.product_title = product_title;
		this.deal_sid = deal_sid;
		this.deal_bid = deal_bid;
		this.schedule_status = schedule_status;
		this.sdate = sdate;
		this.edate = edate;
		
	}
	
	
	
	
	
	//매개변수 생성자
	public DealBoardDto(int deal_no, int deal_productNo, String deal_sid, String deal_bid, int deal_price,
			int schedule_no, int schedule_dealNo, String schedule_status, Date sdate, Date edate) {
		super();
		this.deal_no = deal_no;
		this.deal_productNo = deal_productNo;
		this.deal_sid = deal_sid;
		this.deal_bid = deal_bid;
		this.deal_price = deal_price;
		this.schedule_no = schedule_no;
		this.schedule_dealNo = schedule_dealNo;
		this.schedule_status = schedule_status;
		this.sdate = sdate;
		this.edate = edate;
	}
	
	
	

	//getter & setter
	public int getDeal_no() {
		return deal_no;
	}
	public void setDeal_no(int deal_no) {
		this.deal_no = deal_no;
	}
	public int getDeal_productNo() {
		return deal_productNo;
	}
	public void setDeal_productNo(int deal_productNo) {
		this.deal_productNo = deal_productNo;
	}
	public String getDeal_sid() {
		return deal_sid;
	}
	public void setDeal_sid(String deal_sid) {
		this.deal_sid = deal_sid;
	}
	public String getDeal_bid() {
		return deal_bid;
	}
	public void setDeal_bid(String deal_bid) {
		this.deal_bid = deal_bid;
	}
	public int getDeal_price() {
		return deal_price;
	}
	public void setDeal_price(int deal_price) {
		this.deal_price = deal_price;
	}
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
	
	
	public String getProduct_title() {
		return product_title;
	}

	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
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

	public String getCheck_id() {
		return check_id;
	}

	public void setCheck_id(String check_id) {
		this.check_id = check_id;
	}


	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	

	public String getProduct_status() {
		return product_status;
	}

	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	
	


}
