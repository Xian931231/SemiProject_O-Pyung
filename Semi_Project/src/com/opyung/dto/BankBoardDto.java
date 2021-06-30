package com.opyung.dto;

public class BankBoardDto {

	//필드
	private int bank_no;
	private int bank_id;
	private String bank_account;
	
	//생성자
	public BankBoardDto() {
		super();
	}
	
	//매개변수 생성자
	public BankBoardDto(int bank_no, int bank_id, String bank_account) {
		super();
		this.bank_no = bank_no;
		this.bank_id = bank_id;
		this.bank_account = bank_account;
	}

	//getter & setter
	public int getBank_no() {
		return bank_no;
	}

	public void setBank_no(int bank_no) {
		this.bank_no = bank_no;
	}

	public int getBank_id() {
		return bank_id;
	}

	public void setBank_id(int bank_id) {
		this.bank_id = bank_id;
	}

	public String getBank_account() {
		return bank_account;
	}

	public void setBank_account(String bank_account) {
		this.bank_account = bank_account;
	}
	
	
	
	
	
	

	
	
	
	
}
