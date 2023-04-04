package com.tscm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtPostDTO;
import com.tscm.model.BmtCmtDtDTO;
import com.tscm.model.BmtLikeDAO;
import com.tscm.model.BmtLikeDTO;
import com.tscm.model.BmtOnePostDTO;
import com.tscm.model.BmtUserDAO;


public class SelectPostOne implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(SelectPostOne.class); 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", getClass());
		
		String moveURL=null;
	
		try {
			request.setCharacterEncoding("UTF-8");
			//01_post.jsp에서 받아온 postid
			long postid = Long.parseLong(request.getParameter("postid"));
			LOG.debug(" SelectPostOne postid {} ", postid);
			
			BmtOnePostDTO dto = new BmtOnePostDTO();
			dto.setP_idx(postid);
			BmtUserDAO dao = new BmtUserDAO();
			BmtOnePostDTO postDto = dao.selectOnePost(dto);
			
			BmtLikeDTO likeDto = new BmtLikeDTO();
			likeDto.setP_idx(postid);			
			
			BmtLikeDAO daoLike = new BmtLikeDAO();
			int cnt=daoLike.showLike(likeDto);
			
			//comment 
			LOG.debug("*********error1");
			ArrayList<BmtCmtDtDTO> clDto = dao.selectComment(dto);
			
					
			if(postDto != null && clDto != null) {
				HttpSession session = request.getSession();
				//커멘트리스트
				session.setAttribute("post", postDto);				
				session.setAttribute("cmtlist", clDto);
				//포스트 아이디 세션에서 저장하기
				session.setAttribute("p_idx", postid);
				session.setAttribute("likeNum", cnt);
				System.out.println("선택한 게시글 번호: "+postid);
				System.out.println("좋아요 수: "+cnt);
				moveURL="03_onePost.jsp";
			}
			
			
		}		
		
	catch(Exception e) {
		e.printStackTrace();
		
	}
	return moveURL;
		
}
}
