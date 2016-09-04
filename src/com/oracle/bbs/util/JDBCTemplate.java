package com.oracle.bbs.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCTemplate {

	private Connection conn = null;

	private PreparedStatement ps = null;

	private ResultSet rs = null;

	// 静态块 ---类加载时执行
	static {
		// 加载驱动
		try {
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public JDBCTemplate() {
		super();
		// 加载驱动

	}

	// 获取连接
	private void getConnection() {
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_bbs", "root", "root");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 创建ps对象
	private void createPreparedStatement(String sql) {
		this.getConnection();

		try {
			ps = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 执行查询的方法
	 * 
	 * @param sql
	 *            可带？号的查询sql语句
	 * @param args
	 *            给？号赋值数组
	 * @return rs对象
	 */
	public ResultSet executeQuery(String sql, String[] args) {

		this.createPreparedStatement(sql);

		try {
			// 给？号赋值
			for (int i = 0; args != null && i < args.length; i++) {
				ps.setString(i + 1, args[i]);
			}
			// 执行查询方法
			rs = ps.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;

	}

	/**
	 * 执行增删改的方法
	 * 
	 * @param sql
	 *            可带？号的增删改的sql语句
	 * @param args
	 *            给？号赋值数组
	 * @return 影响的行数
	 */
	public int executeUpdate(String sql, String[] args) {

		int rowCount = -1;

		this.createPreparedStatement(sql);

		try {
			// 给？号赋值
			for (int i = 0; args != null && i < args.length; i++) {
				ps.setString(i + 1, args[i]);
			}
			// 执行查询方法
			rowCount = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}

		return rowCount;

	}

	/**
	 * 获取首行首列的值
	 * 
	 * @param sql 
	 * @return
	 */
	public String executeScalar(String sql) {

		String res = "";
		this.createPreparedStatement(sql);

		try {
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				res = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}
		return res;
	}

	/**
	 * 关闭资源
	 */
	public void closeResource() {

		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (ps != null) {
				ps.close();
				ps = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
