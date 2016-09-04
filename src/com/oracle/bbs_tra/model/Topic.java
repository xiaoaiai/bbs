package com.oracle.bbs_tra.model;

import java.sql.Timestamp;

public class Topic {
 private int topicid;
 private String title;
 private int subboardid;
 private int uid;
 private String content;
 private Timestamp publishTime;
 private Timestamp modifyTime;
public Topic() {
	super();
	// TODO Auto-generated constructor stub
}
public Topic(int topicid, String title, int subboardid, int uid,
		String content, Timestamp publishTime, Timestamp modifyTime) {
	super();
	this.topicid = topicid;
	this.title = title;
	this.subboardid = subboardid;
	this.uid = uid;
	this.content = content;
	this.publishTime = publishTime;
	this.modifyTime = modifyTime;
}
public int getTopicid() {
	return topicid;
}
public void setTopicid(int topicid) {
	this.topicid = topicid;
}
public String getTitle() {
	if(title == null){
		return "";
	}
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public int getSubboardid() {
	return subboardid;
}
public void setSubboardid(int subboardid) {
	this.subboardid = subboardid;
}
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Timestamp getPublishTime() {
	return publishTime;
}
public String getLastPublishTime() {
	if( publishTime == null ){
		return "";
		
	}
	return publishTime.toString();
}
public void setPublishTime(Timestamp publishTime) {
	this.publishTime = publishTime;
}
public Timestamp getModifyTime() {
	return modifyTime;
}
public void setModifyTime(Timestamp modifyTime) {
	this.modifyTime = modifyTime;
}
 
 
 
 

}
