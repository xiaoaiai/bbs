package com.oracle.bbs.dao;

import com.oracle.bbs.util.JDBCTemplate;

public class BaseDAO {

	private JDBCTemplate jdbc = new JDBCTemplate();

	public JDBCTemplate getJdbc() {
		return jdbc;
	}

	public void closeResource() {
		jdbc.closeResource();
	}

}
