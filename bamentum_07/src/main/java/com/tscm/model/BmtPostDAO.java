package com.tscm.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.db.SqlSessionManager;

public class BmtPostDAO {
	private static final Logger LOG = LoggerFactory.getLogger(BmtPostDAO.class); 
	private SqlSessionFactory factory =  SqlSessionManager.getFactory();
	
	public ArrayList<BmtOnePostDTO> SelectPagePost(int iPage) {
		ArrayList<BmtOnePostDTO> listDto = null;

		LOG.debug("{} start ", "SelectPagePost" );
		
		SqlSession session = factory.openSession(true);
		try {
			listDto = (ArrayList)session.selectList("bmt_selectPagePost", iPage);
			if (listDto != null) {
				for(int i=0; i< listDto.size(); i++)
				{
					LOG.debug("bmt_selectAllPost - {} : {} - {} ", 
							i, listDto.get(i).getU_nick(), listDto.get(i).getP_content() );
				}
			} else {
				LOG.debug("{} Fail ", "SelectPagePost" );
			}
			
		} finally {
			session.close();
		}
		
		return listDto;
	}
	
	
	public ArrayList<BmtOnePostDTO> SearchAll(BmtOnePostDTO dto){
		ArrayList<BmtOnePostDTO> result = null;
		SqlSession session = factory.openSession(true);
		try {
			result = (ArrayList)session.selectList("search", dto);
						
			
			if (result != null) {
				for(int i=0; i< result.size(); i++)
				{
					LOG.debug("bmt_*******search - {} : {} - {} ", 
							i, result.get(i).getU_nick(), result.get(i).getP_content() );
				}
			} else {
				LOG.debug("{} Fail ", "SelectPagePost" );
			}
			
		}finally {
			session.close();
		}
		return result;
		
	}
	
	
	
	
	

}
