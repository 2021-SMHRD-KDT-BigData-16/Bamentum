package com.tscm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtPostCrDAO;
import com.tscm.model.BmtPostDAO;
import com.tscm.model.BmtPostDTO;


public class PostCreate implements Command  {
	private static final Logger LOG = LoggerFactory.getLogger(MorePageService.class);
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL =null;
		try {
			
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();			
			
			String u_email=(String)session.getAttribute("email");
			System.out.println("이메일 받아오기"+u_email);			
			
			String p_title=request.getParameter("p_title");
			String p_content= request.getParameter("p_content");
			System.out.println("글쓴내용가져오기"+p_title+p_content);
			
			BmtPostDTO dtopost = new BmtPostDTO();
			dtopost.setU_email(u_email);			
			dtopost.setP_title(p_title);
			dtopost.setP_content(p_content);
			dtopost.setP_file(p_content);
			dtopost.setP_type('f');
			dtopost.setP_view(10);			
			
			System.out.println("!!!!!확인하자!!!" + u_email + p_title + p_content);
			
			BmtPostCrDAO daopost= new BmtPostCrDAO();
			daopost.postInsert(dtopost);
			
			int iPage = 0;
			session.setAttribute("post_page", iPage);
			iPage = (int)session.getAttribute("post_page");
			LOG.debug(" iPage : {}", iPage);
			
			moveURL="01_post.jsp";
						
		} catch (Exception e) {
			e.printStackTrace();
		}
		return moveURL;
	}

}
