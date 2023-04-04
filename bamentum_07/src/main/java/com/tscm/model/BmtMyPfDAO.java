package com.tscm.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.db.SqlSessionManager;

public class BmtMyPfDAO {
	private static final Logger LOG = LoggerFactory.getLogger(BmtMyPfDAO.class); 
	private SqlSessionFactory factory =  SqlSessionManager.getFactory();
	
	public int bic_insert(BmtBicDTO dto) {
		LOG.debug(" bic_insert {} ", dto);
		int cnt = 0;
		SqlSession session = factory.openSession(true);
		try {
			cnt = session.insert("bic_insert", dto);
			
		} finally {
			session.close();
		}
		
		return cnt;
	}

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

	public ArrayList<BmtBicDTO> select_bic_list(BmtUserDTO dto) {
		ArrayList<BmtBicDTO>  listDto = null;

		LOG.debug(" select_bic_list email: {} ", dto.getU_email());
		
		SqlSession session = factory.openSession(true);
		try {
			
			listDto = (ArrayList)session.selectList("bmt_select_bic_list", dto);
			if (listDto != null) {
				for(int i=0; i< listDto.size(); i++)
				{
					LOG.debug("select_bic_list - {} : {} - {} ", 
							i, listDto.get(i).getU_email(), listDto.get(i).getB_num() );
				}
			} else {
				LOG.debug("{} Fail ", "select_bic_list" );
			}
			
		} finally {
			session.close();
		}
		
		return listDto;
	}	

	
	public ArrayList<BmtPostDTO> select_my_post(BmtUserDTO dto) {
		ArrayList<BmtPostDTO>  listDto = null;

		LOG.debug(" select_my_post email: {} ", dto.getU_email());
		
		SqlSession session = factory.openSession(true);
		try {
			
			listDto = (ArrayList)session.selectList("bmt_select_my_post", dto);
			if (listDto != null) {
				for(int i=0; i< listDto.size(); i++)
				{
					LOG.debug("select_my_post - {} : {} - {} - {} ", 
							i, listDto.get(i).getU_email(), listDto.get(i).getP_title(), listDto.get(i).getP_content() );
				}
			} else {
				LOG.debug("{} Fail ", "select_my_post" );
			}
			
		} finally {
			session.close();
		}
		
		return listDto;
	}	

	
		
	public int count_follower(BmtUserDTO dto) {
		int iCount = 0;

		LOG.debug(" select_user email: {} ", dto.getU_email());
		
		SqlSession session = factory.openSession(true);
		try {
			iCount = session.selectOne("bmt_count_follower", dto);
			LOG.debug(" bmt_count_following : {} ", iCount);
			
		} finally {
			session.close();
		}
		
		return iCount;
	}	
	
	public int count_following(BmtUserDTO dto) {
		int iCount = 0;

		LOG.debug(" select_user email: {} ", dto.getU_email());
		
		SqlSession session = factory.openSession(true);
		try {
			iCount = session.selectOne("bmt_count_following", dto);
			LOG.debug(" bmt_count_following : {} ", iCount);
			
		} finally {
			session.close();
		}
		
		return iCount;
	}	

	
	
	

}
