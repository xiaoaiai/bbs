package com.oracle.bbs_tra.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oracle.bbs_tra.model.Board;

public class BoardDAO extends BaseDAO {
	public List<Board> findAll(){
		
		List<Board> list=new ArrayList<Board>();
		//创建SQL语句
		String sql="select * from board ";
		
		//执行sql查询功能
		
		ResultSet rs=this.getJdbc().executeQuery(sql, null);
		
		//判断执行结果
		
		try {
			while(rs.next()){
				Board board=new Board();
				board.setBoardid(rs.getInt("boardid"));
				board.setBoardname(rs.getString("boardname"));
				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		
		
		
		
		return list;
		
	}

}
