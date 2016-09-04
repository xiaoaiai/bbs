package com.oracle.bbs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oracle.bbs.model.SubBoard;

public class SubBoardDAO extends BaseDAO {

	/**
	 * 根据板块id获取子版块信息
	 * 
	 * @param subBoardid
	 * @return
	 */
	public List<SubBoard> findByBoardId(int boardid) {

		List<SubBoard> list = new ArrayList<SubBoard>();

		String sql = "select * from subboard where boardid = " + boardid;

		ResultSet rs = this.getJdbc().executeQuery(sql, null);

		try {
			while (rs.next()) {
				SubBoard subBoard = new SubBoard();
				subBoard.setSub_boardid(rs.getInt(1));
				subBoard.setSub_boardname(rs.getString(2));
				subBoard.setBoardid(rs.getInt(3));

				list.add(subBoard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}

		return list;
	}

	/**
	 * 根据id查询subboard对象
	 * 
	 * @param sub_boardid
	 * @return
	 */
	public SubBoard findById(String sub_boardid) {
		String sql = "select * from subboard where sub_boardid= " + sub_boardid + " ";
		ResultSet rs = this.getJdbc().executeQuery(sql, null);
		SubBoard subBoard = new SubBoard();
		try {
			if (rs.next()) {
				subBoard.setSub_boardid(rs.getInt(1));
				subBoard.setSub_boardname(rs.getString(2));
				subBoard.setBoardid(rs.getInt(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeResource();
		}
		return subBoard;
	}
}
