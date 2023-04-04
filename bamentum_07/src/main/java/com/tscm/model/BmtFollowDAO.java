package com.tscm.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.db.SqlSessionManager;


public class BmtFollowDAO{
	private static final Logger LOG = LoggerFactory.getLogger(BmtFollowDAO.class); 
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public BmtUserDTO select_user(BmtUserDTO dto) {
		BmtUserDTO retDto = null;

		LOG.debug(" select_user email: {} ", dto.getU_email());
		
		SqlSession session = factory.openSession(true);
		try {
			retDto = session.selectOne("bmt_select_user", dto);
			if (retDto == null) {
				LOG.debug(" login fail : {} ", retDto);
			} else {
				LOG.debug(" login success email : {} : {} : {} ", 
						retDto.getU_email(), retDto.getU_nick(), retDto.getU_profile());
			}
			
		} finally {
			session.close();
		}
		
		return retDto;
	}	

	public String select_post_writer(long post_idx) {
		String strWriter = "";

		LOG.debug(" select_post_writer post_idx: {} ", post_idx);
		
		SqlSession session = factory.openSession(true);
		try {
			strWriter = session.selectOne("bmt_select_post_writer", post_idx);
			if (strWriter == null) {
				LOG.debug(" select_post_writer fail : {} ", strWriter);
			} else {
				LOG.debug(" select_post_writer success email : {}  ", 
						strWriter);
			}
			
		} finally {
			session.close();
		}
		
		return strWriter;
	}	

	public ArrayList<BmtFwDetailDTO> select_follow(BmtUserDTO dto) {
		ArrayList<BmtFwDetailDTO>  listDto = null;

		LOG.debug(" select_follow email: {} ", dto.getU_email());
		
		SqlSession session = factory.openSession(true);
		try {
			
			listDto = (ArrayList)session.selectList("bmt_select_fw_detail", dto);
			if (listDto != null) {
				for(int i=0; i< listDto.size(); i++)
				{
					LOG.debug("select_follow - {} : {} - {} , {} , {}", 
							listDto.get(i).getFollower(), listDto.get(i).getFollowing(), 
							listDto.get(i).getF_date(), listDto.get(i).getU_nick(), 
							listDto.get(i).getU_profile() );
				}
			} else {
				LOG.debug("{} Fail ", "select_follow" );
			}
			
		} finally {
			session.close();
		}
		
		return listDto;
	}	
	
	public int delete_follow(BmtFollowDTO dto) {
		LOG.debug(" delete_follow follower : {} , following : {} ", 
				dto.getFollower(), dto.getFollowing());
		
		int cnt = 0;
		SqlSession session = factory.openSession(true);
		try {
			cnt = session.insert("bmt_delete_follow", dto);
			
		} finally {
			session.close();
		}
		
		return cnt;
	}	

	public int insert_follow(BmtFollowDTO dto) {
		LOG.debug(" insert_follow follower : {} , following : {} ", 
				dto.getFollower(), dto.getFollowing());
		int cnt = 0;
		SqlSession session = factory.openSession(true);
		try {

			
			cnt = session.insert("bmt_insert_follow", dto);
			
		} finally {
			session.close();
			
		}
		return cnt;
	}
	
	
}
