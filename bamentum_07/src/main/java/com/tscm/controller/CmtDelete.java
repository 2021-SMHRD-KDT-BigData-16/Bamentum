package com.tscm.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.google.gson.Gson;
import com.tscm.model.BmtCmtDAO;
import com.tscm.model.BmtCmtDTO;

public class CmtDelete implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {		
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = null;
		
		try {			
			out =response.getWriter();
			
			HttpSession session = request.getSession();
//			long p_idx=(Long)session.getAttribute("p_idx");			
//			String u_email=(String) session.getAttribute("email");
//			String post_comment= request.getParameter("post_comment");
			String temp=request.getParameter("c_idx");
			long c_idx = Long.parseLong(temp); 
			System.out.println(c_idx);

			BmtCmtDTO dtoCmt = new BmtCmtDTO();			
			dtoCmt.setC_idx(c_idx);				
			BmtCmtDAO daoCmt= new BmtCmtDAO();
			daoCmt.cmtDelete(dtoCmt);	
			
			System.out.println("DB에 삭제할 index: "+dtoCmt.getC_idx());
			
			out.print("{\"resCode\":1}");
			
			
		}catch (Exception e) {
			e.printStackTrace();
	
			out.print("{\"resCode\":0}");
		}
		return null;
		
				
	}


}
