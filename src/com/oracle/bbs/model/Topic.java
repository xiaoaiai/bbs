package com.oracle.bbs.model;

import java.sql.Timestamp;

public class Topic {

	private int topicid;
	private String title;
	private String content;
	private Timestamp publishtime;
	private Timestamp modifytime;
	private int sub_boardid;
	private int uid;

	public Topic() {
		super();
	}

	public int getTopicid() {
		return topicid;
	}

	public void setTopicid(int topicid) {
		this.topicid = topicid;
	}

	public String getTitle() {
		if (title == null) {
			return "нч";
		}
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

	public String getPublishtimeToString() {
		if (publishtime == null) {
			return "нч";
		}
		return publishtime.toString();
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

	public int getSub_boardid() {
		return sub_boardid;
	}

	public void setSub_boardid(int sub_boardid) {
		this.sub_boardid = sub_boardid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

}
