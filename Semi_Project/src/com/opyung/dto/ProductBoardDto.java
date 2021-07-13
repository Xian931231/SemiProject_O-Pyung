//상품 테이블, 상품 이미지 테이블

package com.opyung.dto;

import java.util.Date;

public class ProductBoardDto {

	//ProductBoard(상품 테이블)
	private int product_no;
	private String product_title;
	private String product_category;
	private int product_price;
	private String product_brand;
	private String product_addr;
	private String product_addr_latitude;
	private String product_addr_longitude;
	private String product_new;
	private String product_content;
	private String product_id;
	private Date product_date;
	private String product_status;
	
	//PtImgBoard(상품 이미지 테이블)
	private int ptimg_no;
	private int ptimg_productNo;
	private String ptimg_src;
	private String ptimg_name;
	private String ptimg_type;
	private int ptimg_size;
	
	//생성자
	public ProductBoardDto() {
		super();
	}

	//매개변수 생성자
	public ProductBoardDto(int product_no, String product_title, String product_category, int product_price,
			String product_brand, String product_addr, String product_addr_latitude, String product_addr_longitude,
			String product_new, String product_content, String product_id, Date product_date, String product_status,
			int ptimg_no, int ptimg_productNo, String ptimg_src, String ptimg_name, String ptimg_type, int ptimg_size) {
		super();
		this.product_no = product_no;
		this.product_title = product_title;
		this.product_category = product_category;
		this.product_price = product_price;
		this.product_brand = product_brand;
		this.product_addr = product_addr;
		this.product_addr_latitude = product_addr_latitude;
		this.product_addr_longitude = product_addr_longitude;
		this.product_new = product_new;
		this.product_content = product_content;
		this.product_id = product_id;
		this.product_date = product_date;
		this.product_status = product_status;
		this.ptimg_no = ptimg_no;
		this.ptimg_productNo = ptimg_productNo;
		this.ptimg_src = ptimg_src;
		this.ptimg_name = ptimg_name;
		this.ptimg_type = ptimg_type;
		this.ptimg_size = ptimg_size;
	}

	//getter & settter
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

	public String getProduct_addr_latitude() {
		return product_addr_latitude;
	}

	public void setProduct_addr_latitude(String product_addr_latitude) {
		this.product_addr_latitude = product_addr_latitude;
	}

	public String getProduct_addr_longitude() {
		return product_addr_longitude;
	}

	public void setProduct_addr_longitude(String product_addr_longitude) {
		this.product_addr_longitude = product_addr_longitude;
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
