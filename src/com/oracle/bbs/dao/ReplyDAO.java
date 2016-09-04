package com.oracle.bbs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oracle.bbs.model.Reply;

public class ReplyDAO extends BaseDAO {

	/**
	 * 通过topicId获取总计录数
	 * 
	 * @param topicId
	 * @return
	 */
	public String findCountByTopicId(int topicId) {

		//
		String sql = "SELECT COUNT(*) FROM reply WHERE topicId=" + topicId;

		return this.getJdbc().executeScalar(sql);

	}

	/**
	 * 
	 * @param reply
	 * @return
	 */

	public int doAdd(Reply reply) {

		String sql = "insert into reply values(null,?,?,?,?,?,?)";

		return this.getJdbc().executeUpdate(sql,
				new String[] { reply.getTitle(), reply.getContent(), reply.getPublishtime().toString(),
						reply.getModifytime().toString(), reply.getTopicid() + "", reply.getUid() + "" });
	}

	/**
	 * 
	 * 
	 */
	public List<Reply> findAllByTopicId(int currentPage, String topicid) {
		List<Reply> list = new ArrayList<Reply>();

		String sql = "select * from reply where topicid = " + topicid + " order by publishtime desc limit "
				+ (currentPage - 1) * 3 + ", 3";
		ResultSet rs = this.getJdbc().executeQuery(sql, null);

		try {
			while (rs.next()) {
				Reply reply = new Reply();
				reply.setReplyid(rs.getInt(1));
				reply.setTitle(rs.getString(2));
				reply.setContent(rs.getString(3));
				reply.setPublishtime(rs.getTimestamp(4));
				reply.setModifytime(rs.getTimestamp(5));
				reply.setTopicid(rs.getInt(6));
				reply.setUid(rs.getInt(7));

				list.add(reply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}
		return list;
	}

	public int findCountByTopicId(String topicid) {
		String sql = "select count(*) from reply where topicid =" + topicid;
		return Integer.parseInt(this.getJdbc().executeScalar(sql));
	}

	public int doDelete(String replyid) {

		String sql = "delete from reply where replyid = " + replyid;
		return this.getJdbc().executeUpdate(sql, null);

	}

	public Reply findById(String replyid) {

		Reply reply = new Reply();

		String sql = "select * from reply where replyid = " + replyid;

		ResultSet rs = this.getJdbc().executeQuery(sql, null);

		try {
			if (rs.next()) {
				reply.setReplyid(rs.getInt(1));
				reply.setTitle(rs.getString(2));
				reply.setContent(rs.getString(3));
				reply.setPublishtime(rs.getTimestamp(4));
				reply.setModifytime(rs.getTimestamp(5));
				reply.setTopicid(rs.getInt(6));
				reply.setUid(rs.getInt(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}
		return reply;
	}

	public int doUpdate(Reply reply) {

		String sql = "update reply set title = ?, content = ?, modifytime = ? where replyid = ?";

		return this.getJdbc().executeUpdate(sql, new String[] { reply.getTitle(), reply.getContent(),
				reply.getModifytime().toString(), reply.getReplyid() + "" });
	}

}
