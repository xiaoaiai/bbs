package com.oracle.bbs_tra.DAO;

import com.oracle.bbs_tra.util.JDBCTemplate;

public class BaseDAO {
   private JDBCTemplate jdbc=new JDBCTemplate();

public JDBCTemplate getJdbc() {
	return jdbc;
}
   public void closeResource(){
	   jdbc.closeResource();
   }
}
