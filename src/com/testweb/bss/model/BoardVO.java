package com.testweb.bss.model;

import java.sql.Timestamp;

public class BoardVO {
	
	private String bno;
	private String title;
	private String writer;
	private String content;
	private Timestamp regdate;
	
	public BoardVO() {
		
	}

	public BoardVO(String bno, String title, String writer, String content, Timestamp regdate) {
		super();
		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
	}

	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
}
