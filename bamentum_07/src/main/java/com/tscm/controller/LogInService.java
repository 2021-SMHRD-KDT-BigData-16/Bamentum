package com.tscm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtOnePostDTO;
import com.tscm.model.BmtPostDAO;
import com.tscm.model.BmtUserDAO;
import com.tscm.model.BmtUserDTO;

public class LogInService implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(LogInService.class); 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "LogInService");
		String moveURL = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");
			LOG.debug(" email : {}, pw : {}", email, pw);
			
			BmtUserDTO dtoUser = new BmtUserDTO();
			dtoUser.setU_email(email);
			dtoUser.setU_pw(pw);
			
			BmtUserDAO daoUser = new BmtUserDAO();
			
			// select * from web_member where email = ? and pw = ?
			BmtUserDTO retDto = daoUser.login(dtoUser);			
			
			if(retDto != null) {
				LOG.debug(" ***  log in Success email : {} ", retDto.getU_email());
				HttpSession session = request.getSession();
				//session에 이메일 저장하기
				session.setAttribute("user", retDto);
				session.setAttribute("email", email);
				
				moveURL = "01_post.jsp";

				int iPage = 0;
				//로그인 성공시 postlist들을 세션에 저장함
				session.setAttribute("post_page", iPage);
				
				iPage = (int)session.getAttribute("post_page");
				LOG.debug(" iPage : {}", iPage);
				
				
			}else {
				LOG.debug(" *** log in Fail retDto : {} ", retDto);
				moveURL = "00_login.jsp";
			}
			LOG.debug(" moveURL : {} ", moveURL);
			
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}
		
		return moveURL;
	}

}
