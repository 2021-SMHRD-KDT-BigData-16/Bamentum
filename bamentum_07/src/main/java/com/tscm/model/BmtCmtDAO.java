package com.tscm.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.tscm.db.SqlSessionManager;

public class BmtCmtDAO {
	private SqlSessionFactory factory =  SqlSessionManager.getFactory();

	public int cmtInsert(BmtCmtDTO dto) {
		int cnt=0;		
		SqlSession session = factory.openSession(true);
		try {
			cnt= session.insert("cmt_insert",dto);
		}finally {
			session.close();
		}
		return cnt;
	}
	
	public int cmtUpdate(BmtCmtDTO dto) {
		int cnt=0;		
		SqlSession session = factory.openSession(true);
		try {
			cnt= session.update("cmt_update",dto);
		}finally {
			session.close();
		}
		return cnt;
		
	}
	
	public int cmtDelete(BmtCmtDTO dto) {
		int cnt=0;		
		SqlSession session = factory.openSession(true);
		try {
			cnt= session.update("cmt_delete",dto);
		}finally {
			session.close();
		}
		return cnt;
		
	}
}
