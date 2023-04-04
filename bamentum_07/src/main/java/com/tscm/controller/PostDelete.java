package com.tscm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tscm.model.BmtPostCrDAO;
import com.tscm.model.BmtPostDTO;


public class PostDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		try {
			request.setCharacterEncoding("UTF-8");
			
			HttpSession session = request.getSession();	
			Long p_idx=(Long)session.getAttribute("p_idx");
			System.out.println("포스트인덱스 확인:"+p_idx);
		
			BmtPostDTO dtopost = new BmtPostDTO();
			dtopost.setP_idx(p_idx);
			
			BmtPostCrDAO daopost = new BmtPostCrDAO();
			daopost.postDelete(dtopost);
			
			System.out.println("DB에 삭제할 p_idx: "+dtopost.getP_idx());
			
			moveURL="01_post.jsp";
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}	
		
		
		
		
		return moveURL;
	}
	
	
  

}
