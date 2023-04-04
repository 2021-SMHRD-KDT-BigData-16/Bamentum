package com.tscm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogoutService implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(LogoutService.class); 

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "LogOutService");
		String moveURL = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" Exception {}  ", e);
		}
		moveURL =  "main.jsp"; 
		return moveURL;
	}

}
