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

	// ��̬�� ---�����ʱִ��
	static {
		// ��������
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
		// ��������

	}

	// ��ȡ����
	private void getConnection() {
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_bbs", "root", "root");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// ����ps����
	private void createPreparedStatement(String sql) {
		this.getConnection();

		try {
			ps = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * ִ�в�ѯ�ķ���
	 * 
	 * @param sql
	 *            �ɴ����ŵĲ�ѯsql���
	 * @param args
	 *            �����Ÿ�ֵ����
	 * @return rs����
	 */
	public ResultSet executeQuery(String sql, String[] args) {

		this.createPreparedStatement(sql);

		try {
			// �����Ÿ�ֵ
			for (int i = 0; args != null && i < args.length; i++) {
				ps.setString(i + 1, args[i]);
			}
			// ִ�в�ѯ����
			rs = ps.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;

	}

	/**
	 * ִ����ɾ�ĵķ���
	 * 
	 * @param sql
	 *            �ɴ����ŵ���ɾ�ĵ�sql���
	 * @param args
	 *            �����Ÿ�ֵ����
	 * @return Ӱ�������
	 */
	public int executeUpdate(String sql, String[] args) {

		int rowCount = -1;

		this.createPreparedStatement(sql);

		try {
			// �����Ÿ�ֵ
			for (int i = 0; args != null && i < args.length; i++) {
				ps.setString(i + 1, args[i]);
			}
			// ִ�в�ѯ����
			rowCount = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}

		return rowCount;

	}

	/**
	 * ��ȡ�������е�ֵ
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
	 * �ر���Դ
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
