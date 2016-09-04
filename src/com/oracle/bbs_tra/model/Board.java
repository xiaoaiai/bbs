package com.oracle.bbs_tra.model;

public class Board {
	private int boardid;
	private String boardname;
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int boardid, String boardname) {
		super();
		this.boardid = boardid;
		this.boardname = boardname;
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
	@Override
	public String toString() {
		return "Board [boardid=" + boardid + ", boardname=" + boardname + "]";
	}
	

}
