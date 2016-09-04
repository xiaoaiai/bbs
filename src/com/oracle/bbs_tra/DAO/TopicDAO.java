package com.oracle.bbs_tra.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oracle.bbs_tra.model.Topic;

public class TopicDAO extends BaseDAO {
    public  String  findByid(int sub_boardid){
    	
    	String sql ="SELECT COUNT(*) FROM topic WHERE sub_boardid =  "+ sub_boardid ;
    	
    	String count=this.getJdbc().executeScalar(sql);
    	
    	
    	return  count; 
    	
    }
   public Topic findLastBysub_boardid(int sub_boardid){
	   Topic topic =new Topic();
	   String sql="select  * from topic where sub_boardid = " + sub_boardid
		+ " order by modifytime desc limit 0, 1";                                  
	   ResultSet rs=this.getJdbc().executeQuery(sql);
	   try {
		while(rs.next()){
			   topic.setTopicid(rs.getInt("topicid"));
			   topic.setTitle(rs.getString("title"));
			   topic.setContent(rs.getString("content"));
			   topic.setPublishTime(rs.getTimestamp("publishtime"));
			   topic.setModifyTime(rs.getTimestamp("modifytime"));
			   topic.setSubboardid(rs.getInt("sub_boardid"));
			   topic.setUid(rs.getInt("uid"));
		
		
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		this.getJdbc().closeResource();
	}
	   
	   return topic;
   } 
   public List<Topic> findtopicBysubid(String sub_boardid){
	   List<Topic> topiclist =new ArrayList<Topic>();
	   
	   String sql ="select * from topic where sub_boardid = " + sub_boardid;
	   
	   ResultSet rs=this.getJdbc().executeQuery(sql);
	   
	   try {
		while(rs.next()){
			   Topic topic = new Topic();
			   topic.setTopicid(rs.getInt("topicid"));
			   topic.setTitle(rs.getString("title"));
			   topic.setContent(rs.getString("content"));
			   topic.setPublishTime(rs.getTimestamp("publishtime"));
			   topic.setModifyTime(rs.getTimestamp("modifytime"));
			   topic.setSubboardid(rs.getInt("sub_boardid"));
			   topic.setUid(rs.getInt("uid"));
			   topiclist.add(topic);
		   }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		this.getJdbc().closeResource();
	}
	   
	   
	   return topiclist;
	     
   }
   public Topic findnameByid(String topicid){
	   
	   Topic topic =new Topic ();
	   String sql = "select * from topic where topicid = " +topicid;
	   ResultSet rs= this.getJdbc().executeQuery(sql);
	   try {
			while(rs.next()){
				  
				   topic.setTopicid(rs.getInt("topicid"));
				   topic.setTitle(rs.getString("title"));
				   topic.setContent(rs.getString("content"));
				   topic.setPublishTime(rs.getTimestamp("publishtime"));
				   topic.setModifyTime(rs.getTimestamp("modifytime"));
				   topic.setSubboardid(rs.getInt("sub_boardid"));
				   topic.setUid(rs.getInt("uid"));
				 
			   }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.getJdbc().closeResource();
		}
	   
	   
	   return topic;
	   
	   
	   
   }
   
}
