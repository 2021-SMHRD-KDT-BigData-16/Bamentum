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

public class UnFollow implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(UnFollow.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", getClass());
		
		String moveURL = null;
		try {
			request.setCharacterEncoding("UTF-8");
			String follower = request.getParameter("follower");
			String following = request.getParameter("following");
			
			BmtFollowDAO dao = new BmtFollowDAO();
			BmtFollowDTO dtoDelete = new BmtFollowDTO();
			
			dtoDelete.setFollower(follower);
			dtoDelete.setFollowing(following);
			
			dao.delete_follow(dtoDelete);
//////////////////////////////////////////////////////////////////////////////////////			
			
			HttpSession session = request.getSession();
			String u_email=(String)session.getAttribute("email");
			BmtUserDTO dtoLogin = new BmtUserDTO();
			dtoLogin.setU_email(u_email);
			BmtUserDTO dtoULogin =  dao.select_user(dtoLogin);
			LOG.debug("u_email : {}, u_nick : {}, u_joindate : {} ", 
					dtoULogin.getU_email(), dtoULogin.getU_nick(), dtoULogin.getU_joindate());
			
			ArrayList<BmtFwDetailDTO> listFwDetail = dao.select_follow(dtoULogin);

			session.setAttribute("fw_user", dtoLogin);
			session.setAttribute("fw_detail_list", listFwDetail);
			
			moveURL = "06_follow.jsp";
			

		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}
		return moveURL;
		
		
		
	}

}
