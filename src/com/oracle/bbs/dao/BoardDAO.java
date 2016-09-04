package com.oracle.bbs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oracle.bbs.model.Board;

public class BoardDAO extends BaseDAO {

	/**
	 * 查询主板块信息
	 * 
	 * @return
	 */
	public List<Board> findAll() {

		List<Board> list = new ArrayList<Board>();

		String sql = "select * from board";

		ResultSet rs = this.getJdbc().executeQuery(sql, null);

		try {
			while (rs.next()) {
				Board board = new Board();
				board.setBoardid(rs.getInt("boardid"));
				board.setBoardname(rs.getString("boardname"));
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}
		return list;
	}
}
