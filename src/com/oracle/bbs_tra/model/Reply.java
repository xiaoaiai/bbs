package com.oracle.bbs_tra.model;

import java.sql.Timestamp;

public class Reply {
	private int replyid;
	private String title;
	private String content;
	private Timestamp publishtime;
	private Timestamp modifytime;
	private int topicid;
	private int uid;
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reply(int replyid, String title, String content,
			Timestamp publishtime, Timestamp modifytime, int topicid, int uid) {
		super();
		this.replyid = replyid;
		this.title = title;
		this.content = content;
		this.publishtime = publishtime;
		this.modifytime = modifytime;
		this.topicid = topicid;
		this.uid = uid;
	}
	public int getReplyid() {
		return replyid;
	}
	public void setReplyid(int replyid) {
		this.replyid = replyid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getPublishtime() {
		return publishtime;
	}
	public void setPublishtime(Timestamp publishtime) {
		this.publishtime = publishtime;
	}
	public Timestamp getModifytime() {
		return modifytime;
	}
	public void setModifytime(Timestamp modifytime) {
		this.modifytime = modifytime;
	}
	public int getTopicid() {
		return topicid;
	}
	public void setTopicid(int topicid) {
		this.topicid = topicid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	

}
