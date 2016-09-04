package com.oracle.bbs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oracle.bbs.model.Topic;

public class TopicDAO extends BaseDAO {

	/**
	 * 根据子版块id获取帖子数
	 * 
	 * @param sub_boardid
	 * @return
	 */
	public String findCountBySubBoardId(int sub_boardid) {

		String sql = "select count(*) from topic where sub_boardid = " + sub_boardid;

		return this.getJdbc().executeScalar(sql);
	}

	/**
	 * 根据子版块id获取最后一个帖子信息
	 * 
	 * @param sub_boardid
	 * @return
	 */
	public Topic findLastBySubBoardId(int sub_boardid) {

		Topic topic = new Topic();

		String sql = "select * from topic where sub_boardid = " + sub_boardid + " ORDER BY publishtime DESC limit 0, 1";

		ResultSet rs = this.getJdbc().executeQuery(sql, null);

		try {
			if (rs.next()) {
				topic.setTopicid(rs.getInt(1));
				topic.setTitle(rs.getString(2));
				topic.setContent(rs.getString(3));
				topic.setPublishtime(rs.getTimestamp(4));
				topic.setModifytime(rs.getTimestamp(5));
				topic.setSub_boardid(rs.getInt(6));
				topic.setUid(rs.getInt(7));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}
		return topic;
	}

	public List<Topic> findAllBySubBoardId(String sub_boardid, int currentPage) {

		List<Topic> topicList = new ArrayList<Topic>();

		String sql = "SELECT * from topic where sub_boardid = " + sub_boardid + " limit " + (currentPage - 1) * 2
				+ ",2";
		System.out.println(sql);
		ResultSet rs = this.getJdbc().executeQuery(sql, null);

		try {
			while (rs.next()) {
				Topic topic = new Topic();
				topic.setTopicid(rs.getInt(1));
				topic.setTitle(rs.getString(2));
				topic.setContent(rs.getString(3));
				topic.setPublishtime(rs.getTimestamp(4));
				topic.setModifytime(rs.getTimestamp(5));
				topic.setSub_boardid(rs.getInt(6));
				topic.setUid(rs.getInt(7));

				topicList.add(topic);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}

		return topicList;

	}

	/**
	 * 根据sub_boardId 查询对应子版块的帖子数量
	 * 
	 */
	public int findCountBysub_boardId(String sub_boardId) {
		String sql = "select count(*) from topic where sub_boardid =" + sub_boardId;
		System.out.println(sql);
		return Integer.parseInt(this.getJdbc().executeScalar(sql));
	}

	/**
	 * 
	 * @param topic
	 * @return
	 */
	public int doAdd(Topic topic) {

		String sql = "insert into topic values(null,?,?,?,?,?,?)";

		return this.getJdbc().executeUpdate(sql,
				new String[] { topic.getTitle(), topic.getContent(), topic.getPublishtime().toString(),
						topic.getModifytime().toString(), topic.getSub_boardid() + "", topic.getUid() + "" });
	}
	public Topic findById(String topicid){
		Topic topic = new Topic();
		
		String sql = "select * from topic where topicid =" + topicid;
		
		ResultSet rs = this.getJdbc().executeQuery(sql, null);
		try {
			if (rs.next()) {
				topic.setTopicid(rs.getInt(1));
				topic.setTitle(rs.getString(2));
				topic.setContent(rs.getString(3));
				topic.setPublishtime(rs.getTimestamp(4));
				topic.setModifytime(rs.getTimestamp(5));
				topic.setSub_boardid(rs.getInt(6));
				topic.setUid(rs.getInt(7));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}

		return topic;
	}

}
