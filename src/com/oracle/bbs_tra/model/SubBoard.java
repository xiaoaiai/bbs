package com.oracle.bbs_tra.model;

public class SubBoard {
  private int sub_boardid;
  private String sub_boardname;
  private int boardid;
  
  
public SubBoard() {
	super();
	// TODO Auto-generated constructor stub
	
}
public SubBoard(int sub_boardid, String sub_boardname, int boardid) {
	super();
	this.sub_boardid = sub_boardid;
	this.sub_boardname = sub_boardname;
	this.boardid = boardid;
}
public int getSub_boardid() {
	return sub_boardid;
}
public void setSub_boardid(int subBoardid) {
	sub_boardid = subBoardid;
}
public String getSub_boardname() {
	return sub_boardname;
}
public void setSub_boardname(String subBoardname) {
	sub_boardname = subBoardname;
}
public int getBoardid() {
	return boardid;
}
public void setBoardid(int boardid) {
	this.boardid = boardid;
}


  
  
}
