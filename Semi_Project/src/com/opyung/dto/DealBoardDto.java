package com.opyung.dto;

public class DealBoardDto {

	//필드
	private int deal_no;
	private int deal_productNo;
	private String deal_sid;		//판매자 (seller)
	private String deal_bid;		//구매자 (buyer)
	private String deal_price; 		//결제한 금액

	//생성자
	public DealBoardDto() {
		super();
	}
	
	//매개변수 생성자
	public DealBoardDto(int deal_no, int deal_productNo, String deal_sid, String deal_bid, String deal_price) {
		super();
		this.deal_no = deal_no;
		this.deal_productNo = deal_productNo;
		this.deal_sid = deal_sid;
		this.deal_bid = deal_bid;
		this.deal_price = deal_price;
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

	public String getDeal_price() {
		return deal_price;
	}

	public void setDeal_price(String deal_price) {
		this.deal_price = deal_price;
	}
	
	
	
	
	
	
	
	
	
	
}
