package com.opyung.dto;

public class ChatBoardDto {

	//필드
	private int chat_no;
	private String chat_user1;
	private String chat_user2;
	private String chat_sdate;		//채팅 시작날짜
	private String chat_edate;		//채팅 종료날짜

	//생성자
	public ChatBoardDto() {
		super();
	}

	//매개변수 생성자
	public ChatBoardDto(int chat_no, String chat_user1, String chat_user2, String chat_sdate, String chat_edate) {
		super();
		this.chat_no = chat_no;
		this.chat_user1 = chat_user1;
		this.chat_user2 = chat_user2;
		this.chat_sdate = chat_sdate;
		this.chat_edate = chat_edate;
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
	
	
	

	
	
	
	
	
	
	
	
}
