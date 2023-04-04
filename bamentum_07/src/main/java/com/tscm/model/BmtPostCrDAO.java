package com.tscm.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.tscm.db.SqlSessionManager;

public class BmtPostCrDAO {
	private SqlSessionFactory factory =  SqlSessionManager.getFactory();
	
	public int postInsert(BmtPostDTO dto) {
		int cnt=0;
		SqlSession session = factory.openSession(true);
		try {
			cnt=session.insert("post_insert",dto);
			
		} finally {
			session.close();
		}return cnt;	
	}
	
	public int postUpdate(BmtPostDTO dto) {
		int cnt=0;
		SqlSession session = factory.openSession(true);
		try {
			cnt=session.update("post_update",dto);
		} finally {
			session.close();
		}return cnt;
	}
	
	public int postDelete(BmtPostDTO dto) {
		int cnt=0;
		SqlSession session = factory.openSession(true);
		try {
			cnt=session.update("post_delete",dto);
		}finally {
			session.close();
		}return cnt;
	}
	
	
	
	
}
