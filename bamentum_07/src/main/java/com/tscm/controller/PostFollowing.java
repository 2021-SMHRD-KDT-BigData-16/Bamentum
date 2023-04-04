package com.tscm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtFollowDAO;
import com.tscm.model.BmtFollowDTO;
import com.tscm.model.BmtFwDetailDTO;
import com.tscm.model.BmtUserDTO;

public class PostFollowing implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(PostFollowing.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", getClass());
		
		String moveURL = null;
		try {
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			String u_email=(String)session.getAttribute("email");
			Long p_idx= Long.parseLong(request.getParameter("postid"));
			LOG.debug(" p_idx = {} , u_email = {} ", p_idx, u_email);
			
			BmtFollowDAO dao = new BmtFollowDAO();
			
			String strWriter = dao.select_post_writer(p_idx);
			LOG.debug(" {} writer, {} p_idx,  {} login", strWriter, p_idx, u_email);
			
			BmtFollowDTO dtoInsert = new BmtFollowDTO();
			
			dtoInsert.setFollower(u_email);
			dtoInsert.setFollowing(strWriter);
			
			dao.insert_follow(dtoInsert);
            moveURL = "01_post.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
            moveURL = "01_post.jsp";
		}
		return moveURL;
	}

}
