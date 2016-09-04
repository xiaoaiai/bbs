package com.oracle.bbs_tra.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.oracle.bbs_tra.model.Users;

public class UsersDAO extends BaseDAO{
	public Users findByUid(int uid){
		Users users=new Users();
		String sql="select * from users where uid = " + uid;
		
		ResultSet rs=this.getJdbc().executeQuery(sql);
		
		try {
			if(rs.next()){
				users.setUid(rs.getInt("uid"));
				users.setUname(rs.getString("uname"));
				users.setRegtime(rs.getTimestamp("regtime"));
				users.setGender(rs.getString("gender"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.getJdbc().closeResource();
		}
		
		
		
		
		return users;
		
	}
	public Users findexitBy(String uName,String uPass){
		Users users = null ;
		  
		String sql ="select * from users where uname = ? and upass= ? ";
		
		ResultSet rs = this.getJdbc().executeQuery(sql, new String[]{uName,uPass});
		
		try {
			if(rs.next()){
				users=new Users();
				users.setUid(rs.getInt("uid"));
				users.setUname(rs.getString("uname"));
				users.setRegtime(rs.getTimestamp("regtime"));
				users.setGender(rs.getString("gender"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.getJdbc().closeResource();
		}
		
		
		
		
		return users;
		
		
		
		
	}


}
