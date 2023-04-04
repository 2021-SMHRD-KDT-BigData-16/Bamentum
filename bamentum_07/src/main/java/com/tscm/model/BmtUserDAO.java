package com.tscm.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.db.SqlSessionManager;

public class BmtUserDAO {
	
	private static final Logger LOG = LoggerFactory.getLogger(BmtUserDAO.class); 
	
	private SqlSessionFactory factory =  SqlSessionManager.getFactory();

	public int join(BmtUserDTO dto) {
		LOG.debug(" join {} ", dto);
		int cnt = 0;
		SqlSession session = factory.openSession(true);
		try {
			cnt = session.insert("bmt_join", dto);
			
		} finally {
			session.close();
		}
		
		return cnt;
	}

	
	
	public BmtUserDTO login(BmtUserDTO dto) {
		BmtUserDTO retDto = null;

		LOG.debug(" login email: {}, pw:{} ", dto.getU_email(), dto.getU_pw());
		
		SqlSession session = factory.openSession(true);
		try {
			retDto = session.selectOne("bmt_login", dto);
			if (retDto == null) {
				LOG.debug(" login fail : {} ", retDto);
			} else {
				LOG.debug(" login success email : {} ", retDto.getU_email());
			}
			
		} finally {
			session.close();
		}
		
		return retDto;
	}	

	public BmtOnePostDTO selectOnePost(BmtOnePostDTO dtoget) {
		BmtOnePostDTO dto =null;
		LOG.debug("selectOnePost start {}", dtoget.getP_idx());
		SqlSession session = factory.openSession(true);
		LOG.debug("selectOnePost start1 {}", dtoget.getP_idx());
		try {
			LOG.debug("selectOnePost start2 {}", dtoget.getP_idx());
			
			dto=session.selectOne("bmt_selectOnePost", dtoget);
			LOG.debug("selectOnePost start3 {}", dtoget.getP_idx());
			
			if(dto!=null) {
				LOG.debug("selectOnePost - {} ", dto.getP_idx());
				
			}else {
				LOG.debug("selectOnePost fail");
			}
			
			LOG.debug("selectOnePost start4 {}", dtoget.getP_idx());
			
			session.selectList("bmt_selectComment",dtoget);
			LOG.debug("selectOnePost start5 {}", dtoget.getP_idx());
			
		}finally {
			session.close();
		}
		return dto;
	}
	
	public ArrayList<BmtCmtDtDTO> selectComment(BmtOnePostDTO dtoget){
		LOG.debug("selectOnePost start6 {}", dtoget.getP_idx());
		ArrayList<BmtCmtDtDTO> listDto = null;
		SqlSession session = factory.openSession(true);
		try {
			listDto=(ArrayList)session.selectList("bmt_selectComment",dtoget);
			LOG.debug("selectOnePost start7 {}", listDto.size());

			if (listDto != null) {
				for(int i=0; i< listDto.size(); i++)
				{
					LOG.debug("selectMyPage - {} : {} ", 
							i, listDto.get(i).getC_content());
				}
			} else {
				LOG.debug("selectMyPage fail");
			}		
			
		}finally {
			
			session.close();
		}
		LOG.debug("selectOnePost start8 {}", dtoget.getP_idx());
		return listDto;
	}

}
