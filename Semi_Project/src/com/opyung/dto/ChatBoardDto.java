//채팅, 채팅내역

package com.opyung.dto;

import java.util.Date;

public class ChatBoardDto {

	//ChatBoard(채팅)
	private int chat_no;
	private String chat_user1;
	private String chat_user2;
	private String chat_sdate;		//채팅 시작날짜
	private String chat_edate;		//채팅 종료날짜

	//ChatContentBoard(채팅내역)
	private int ccb_no;
	private int ccb_chatNo;
	private String ccb_id;
	private String ccb_content;
	private Date ccb_date;
	
	//생성자
	public ChatBoardDto() {
		super();
	}
	
	//매개변수 생성자
	public ChatBoardDto(int chat_no, String chat_user1, String chat_user2, String chat_sdate, String chat_edate,
			int ccb_no, int ccb_chatNo, String ccb_id, String ccb_content, Date ccb_date) {
		super();
		this.chat_no = chat_no;
		this.chat_user1 = chat_user1;
		this.chat_user2 = chat_user2;
		this.chat_sdate = chat_sdate;
		this.chat_edate = chat_edate;
		this.ccb_no = ccb_no;
		this.ccb_chatNo = ccb_chatNo;
		this.ccb_id = ccb_id;
		this.ccb_content = ccb_content;
		this.ccb_date = ccb_date;
	}
	
	//getter & setter
	public int getChat_no() {
		return chat_no;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public String getChat_user1() {
		return chat_user1;
	}
	public void setChat_user1(String chat_user1) {
		this.chat_user1 = chat_user1;
	}
	public String getChat_user2() {
		return chat_user2;
	}
	public void setChat_user2(String chat_user2) {
		this.chat_user2 = chat_user2;
	}
	public String getChat_sdate() {
		return chat_sdate;
	}
	public void setChat_sdate(String chat_sdate) {
		this.chat_sdate = chat_sdate;
	}
	public String getChat_edate() {
		return chat_edate;
	}
	public void setChat_edate(String chat_edate) {
		this.chat_edate = chat_edate;
	}
	public int getCcb_no() {
		return ccb_no;
	}
	public void setCcb_no(int ccb_no) {
		this.ccb_no = ccb_no;
	}
	public int getCcb_chatNo() {
		return ccb_chatNo;
	}
	public void setCcb_chatNo(int ccb_chatNo) {
		this.ccb_chatNo = ccb_chatNo;
	}
	public String getCcb_id() {
		return ccb_id;
	}
	public void setCcb_id(String ccb_id) {
		this.ccb_id = ccb_id;
	}
	public String getCcb_content() {
		return ccb_content;
	}
	public void setCcb_content(String ccb_content) {
		this.ccb_content = ccb_content;
	}
	public Date getCcb_date() {
		return ccb_date;
	}
	public void setCcb_date(Date ccb_date) {
		this.ccb_date = ccb_date;
	}
	
	
	

	
	
	
	
	
	
	
	
}
