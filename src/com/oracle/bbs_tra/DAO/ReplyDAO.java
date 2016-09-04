package com.oracle.bbs_tra.DAO;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oracle.bbs_tra.model.Reply;

public class ReplyDAO extends BaseDAO {
	public String findBytopicid(int topicid){
		
		String sql ="select count(*) from reply where topicid = " + topicid;
		String  count =this.getJdbc().executeScalar(sql);
		return count;
		
		
		
	}
	public List<Reply> findByid(int topicid){
		
		List<Reply> replylist = new ArrayList<Reply>();
		
		String sql = "select * from reply where topicid = " +topicid;
		
		ResultSet rs = this.getJdbc().executeQuery(sql);
		
		try {
			while(rs.next()){
				Reply reply=new Reply();
				reply.setReplyid(rs.getInt("replyid"));
				reply.setTitle(rs.getString("title"));
				reply.setContent(rs.getString("content"));
				reply.setPublishtime(rs.getTimestamp("publishtime"));
				reply.setModifytime(rs.getTimestamp("modifytime"));
				reply.setTopicid(rs.getInt(rs.getInt("topicid")));
				reply.setUid(rs.getInt("uid"));
				replylist.add(reply);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			this.getJdbc().closeResource();
		}
		
		
		
		
		return replylist;
	}

}
