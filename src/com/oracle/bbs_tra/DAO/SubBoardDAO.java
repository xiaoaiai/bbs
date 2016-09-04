package com.oracle.bbs_tra.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oracle.bbs_tra.model.SubBoard;

public class SubBoardDAO extends BaseDAO{
	public List<SubBoard> findAll(int boardid ){
		//¥¥Ω®SQL≤È—Ø”Ôæ‰
		List<SubBoard> list=new ArrayList<SubBoard>();
		String sql = " select * from subboard where boardid = " + boardid;
		ResultSet rs = this.getJdbc().executeQuery(sql);
		 try {
			while(rs.next()){
				 SubBoard subboard = new SubBoard();
				 subboard.setSub_boardid(rs.getInt("sub_boardid"));
				 subboard.setSub_boardname(rs.getString("sub_boardname"));
				 subboard.setBoardid(rs.getInt("boardid"));
				 list.add(subboard);	 
				 
			 }
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		
		
		
    return list;
	}
	public SubBoard findnameByid(String  sub_boardid){
		SubBoard subboard =new SubBoard();
		
		String sql = "select * from  subboard where sub_boardid = " +sub_boardid;
		
		ResultSet rs = this.getJdbc().executeQuery(sql);	
	try {			if(rs.next()){
								subboard.setSub_boardid(rs.getInt("sub_boardid"));
				subboard.setSub_boardname(rs.getString("sub_boardname"));				
				
			
			}
	} catch (SQLException e) {
		
			e.printStackTrace();
		}finally{
			this.getJdbc().closeResource();
		}
		
		
		return subboard;
		

		
	}
	

}
