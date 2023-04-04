package com.tscm.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.tscm.db.SqlSessionManager;

public class BmtLikeDAO {
	private SqlSessionFactory factory =  SqlSessionManager.getFactory();
	public int showLike(BmtLikeDTO dto) {
		int cnt=0;
		SqlSession session = factory.openSession(true);
		try {
			cnt=session.selectOne("show_like",dto);			
		} finally {
			session.close();
			
		}return cnt;
	} 
	
	public int likeInsert(BmtLikeDTO dto) {
		int cnt=0;		
		SqlSession session = factory.openSession(true);
		try {
			cnt= session.insert("like_insert",dto);
		}finally {
			session.close();
		}
		return cnt;
	}

}
