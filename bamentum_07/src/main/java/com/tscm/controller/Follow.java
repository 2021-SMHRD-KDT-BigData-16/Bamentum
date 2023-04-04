package com.tscm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtBicDTO;
import com.tscm.model.BmtFollowDAO;
import com.tscm.model.BmtFollowDTO;
import com.tscm.model.BmtFwDetailDTO;
import com.tscm.model.BmtMyPfDAO;
import com.tscm.model.BmtUserDTO;

public class Follow implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(Follow.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "Follow");
		
		String moveURL = null;
		try {
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			String u_email=(String)session.getAttribute("email");
			
			BmtFollowDAO dao = new BmtFollowDAO();
			
			BmtUserDTO dtoLogin = new BmtUserDTO();
			dtoLogin.setU_email(u_email);
			
			BmtUserDTO dtoSelUsr =  dao.select_user(dtoLogin);
			LOG.debug("u_email : {}, u_nick : {}, u_joindate : {} ", 
					dtoSelUsr.getU_email(), dtoSelUsr.getU_nick(), dtoSelUsr.getU_joindate());
			
			ArrayList<BmtFwDetailDTO> listFwDetail = dao.select_follow(dtoSelUsr);

			session.setAttribute("fw_user", dtoSelUsr);
			session.setAttribute("fw_detail_list", listFwDetail);
			
			moveURL = "06_follow.jsp";
			

		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}
		return moveURL;
	}

}
