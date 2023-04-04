package com.tscm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtUserDAO;
import com.tscm.model.BmtUserDTO;

public class JoinService implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(JoinService.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "JoinService");

		String moveURL = null;
		try {
			request.setCharacterEncoding("UTF-8");
			String u_email = request.getParameter("u_email");
			String u_pw = request.getParameter("u_pw");
			String u_nick = request.getParameter("u_nick");
			LOG.debug("u_email : {}, u_pw : {}, u_nick : {}", u_email, u_pw, u_nick);

			BmtUserDTO dto = new BmtUserDTO();
			dto.setU_email(u_email);
			dto.setU_pw(u_pw);
			dto.setU_nick(u_nick);
			dto.setU_profile(" ");
			dto.setU_info(" ");
			dto.setU_course(" ");
			dto.setU_type(" ");

			BmtUserDAO dao = new BmtUserDAO();
			int cnt = dao.join(dto);

			LOG.debug("join return cnt : {} ", cnt);
			if (cnt > 0) {
				request.setAttribute("u_email", u_email);
				moveURL = "00_login.jsp";

			} else {
				moveURL = "00_login.jsp";
			}

		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}

		return moveURL;
	}

}
