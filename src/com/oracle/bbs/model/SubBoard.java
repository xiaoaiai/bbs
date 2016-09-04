package com.oracle.bbs.model;

import java.io.Serializable;

/**
 * POJO
 * 
 * @author oracle
 *
 */
@SuppressWarnings("serial")
public class SubBoard implements Serializable {

	private int sub_boardid;
	private String sub_boardname;
	private int boardid;

	public SubBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getSub_boardid() {
		return sub_boardid;
	}

	public void setSub_boardid(int sub_boardid) {
		this.sub_boardid = sub_boardid;
	}

	public String getSub_boardname() {
		return sub_boardname;
	}

	public void setSub_boardname(String sub_boardname) {
		this.sub_boardname = sub_boardname;
	}

	public int getBoardid() {
		return boardid;
	}

	public void setBoardid(int boardid) {
		this.boardid = boardid;
	}

}
