package com.oracle.bbs.model;

import java.io.Serializable;

public class Board implements Serializable {

	private static final long serialVersionUID = 1L;

	private int boardid;
	private String boardname;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getBoardid() {
		return boardid;
	}

	public void setBoardid(int boardid) {
		this.boardid = boardid;
	}

	public String getBoardname() {
		return boardname;
	}

	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}

}
