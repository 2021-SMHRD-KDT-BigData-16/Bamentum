package com.tscm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tscm.model.BmtOnePostDTO;
import com.tscm.model.BmtPostCrDAO;
import com.tscm.model.BmtPostDAO;
import com.tscm.model.BmtPostDTO;


public class Search implements Command{
	

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		try {
			HttpSession session = request.getSession();
					
			request.setCharacterEncoding("UTF-8");
			String input_search = request.getParameter("input_search");
		
			BmtPostDAO dao = new BmtPostDAO();		
			BmtOnePostDTO dto = new BmtOnePostDTO();
			dto.setP_content(input_search);
			
					
			session.setAttribute("input_search",input_search);
			
			ArrayList<BmtOnePostDTO> result = dao.SearchAll(dto);	
			
			session.setAttribute("searchList", result);
			
			for(BmtOnePostDTO s:result) {
				System.out.println(s.getU_nick()+s.getP_content());	
			}		
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return moveURL;
	}

}
