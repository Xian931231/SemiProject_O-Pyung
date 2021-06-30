package com.opyung.dto;

import java.util.Date;

public class ProductBoardDto {

	//필드
	private int product_no;
	private String product_title;
	private String product_category;
	private int product_price;
	private String product_brand;
	private String product_addr;
	private String product_new;
	private String product_content;
	private String product_id;
	private Date product_date;
	private String product_status;
	
	//생성자
	public ProductBoardDto() {
		super();
	}

	//매개변수 생성자
	public ProductBoardDto(int product_no, String product_title, String product_category, int product_price,
			String product_brand, String product_addr, String product_new, String product_content, String product_id,
			Date product_date, String product_status) {
		super();
		this.product_no = product_no;
		this.product_title = product_title;
		this.product_category = product_category;
		this.product_price = product_price;
		this.product_brand = product_brand;
		this.product_addr = product_addr;
		this.product_new = product_new;
		this.product_content = product_content;
		this.product_id = product_id;
		this.product_date = product_date;
		this.product_status = product_status;
	}

	//getter & setter
	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getProduct_title() {
		return product_title;
	}

	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}

	public String getProduct_category() {
		return product_category;
	}

	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_brand() {
		return product_brand;
	}

	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}

	public String getProduct_addr() {
		return product_addr;
	}

	public void setProduct_addr(String product_addr) {
		this.product_addr = product_addr;
	}

	public String getProduct_new() {
		return product_new;
	}

	public void setProduct_new(String product_new) {
		this.product_new = product_new;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public Date getProduct_date() {
		return product_date;
	}

	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}

	public String getProduct_status() {
		return product_status;
	}

	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
	
	
	
	

	
	
	
	
	
}
