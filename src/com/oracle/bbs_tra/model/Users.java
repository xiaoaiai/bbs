package com.oracle.bbs_tra.model;

import java.sql.Timestamp;

public class Users {
	private int uid;
	private String uname;
	private String gender;
	private Timestamp regtime;
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Users(int uid, String uname, String gender, Timestamp regtime) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.gender = gender;
		this.regtime = regtime;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		if(uname == null){
			return "";
		}
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Timestamp getRegtime() {
		return regtime;
	}
	public void setRegtime(Timestamp regtime) {
		this.regtime = regtime;
	}
	

}
