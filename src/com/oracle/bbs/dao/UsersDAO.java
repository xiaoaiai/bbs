package com.oracle.bbs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.oracle.bbs.model.Users;

public class UsersDAO extends BaseDAO {

	/**
	 * 根据用户id获取用户信息
	 * 
	 * @param uid
	 * @return
	 */
	public Users findByUid(int uid) {

		Users users = new Users();

		String sql = "select * from users where uid = " + uid;

		ResultSet rs = this.getJdbc().executeQuery(sql, null);

		try {
			if (rs.next()) {
				users.setUid(rs.getInt(1));
				users.setUname(rs.getString(2));
				users.setUpass(rs.getString(3));
				users.setUhead(rs.getString(4));
				users.setRegtime(rs.getTimestamp(5));
				users.setGender(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}
		return users;
	}
	
	/**
	 * 
	 * @param uName
	 * @param uPass
	 * @return
	 */
	public Users checkLogin(String uName, String uPass){
		
		Users users = null;
		
		String sql = "select * from users where uName = ? and uPass = ?";
		
		ResultSet rs = this.getJdbc().executeQuery(sql, new String[]{uName, uPass});
		
		try {
			if (rs.next()) {
				users = new Users();
				users.setUid(rs.getInt(1));
				users.setUname(rs.getString(2));
				users.setUpass(rs.getString(3));
				users.setUhead(rs.getString(4));
				users.setRegtime(rs.getTimestamp(5));
				users.setGender(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}
		return users;
	}
	
	 

}
