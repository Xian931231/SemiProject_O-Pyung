//관심 상품 테이블

package com.opyung.dto;

public class LikeProductBoardDto {

	//필드
	private int likept_memberNo;		//좋아요 누른 사용자
	private int likept_productNo;		//좋아요 눌린 상품 ID
	
	//생성자
	public LikeProductBoardDto() {
		super();
	}
	
	//매개변수 생성자
	public LikeProductBoardDto(int likept_memberNo, int likept_productNo) {
		super();
		this.likept_memberNo = likept_memberNo;
		this.likept_productNo = likept_productNo;
	}
	
	//getter & setter
	public int getLikept_memberNo() {
		return likept_memberNo;
	}
	public void setLikept_memberNo(int likept_memberNo) {
		this.likept_memberNo = likept_memberNo;
	}
	public int getLikept_productNo() {
		return likept_productNo;
	}
	public void setLikept_productNo(int likept_productNo) {
		this.likept_productNo = likept_productNo;
	}
	
	
	
	
	
	
	
}
