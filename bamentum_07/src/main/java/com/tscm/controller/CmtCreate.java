package com.tscm.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtCmtDAO;
import com.tscm.model.BmtCmtDTO;


public class CmtCreate implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(MorePageService.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "CmtCreate");
	
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = null;
		
		try {			
			out =response.getWriter();
			
			HttpSession session = request.getSession();
			long p_idx=(Long)session.getAttribute("p_idx");			
			String u_email=(String) session.getAttribute("email");
			String post_comment= request.getParameter("post_comment");
			
			LOG.debug(" **** MorePageService before - u_email {} ", u_email);
			LOG.debug(" **** MorePageService before - p_idx {} ", session.getAttribute("p_idx"));
			LOG.debug(" **** MorePageService before - p_idx {} ", p_idx);
			LOG.debug(" **** MorePageService before - post_comment {} ", post_comment);

			BmtCmtDTO dtoCmt = new BmtCmtDTO();
			dtoCmt.setC_content(post_comment);	
			dtoCmt.setP_idx(p_idx);
			dtoCmt.setU_email(u_email);
			
			System.out.println("DB에 저장할 내용: "+dtoCmt);
			
			BmtCmtDAO daoCmt= new BmtCmtDAO();
			daoCmt.cmtInsert(dtoCmt);			
			out.print("{\"resCode\":1}");
			
			
		}catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ",e);
			out.print("{\"resCode\":0}");
		}
		return null;
	}
}