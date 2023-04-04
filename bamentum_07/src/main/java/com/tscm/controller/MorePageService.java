package com.tscm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tscm.model.BmtOnePostDTO;
import com.tscm.model.BmtPostDAO;


public class MorePageService implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(MorePageService.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "MorePageService");
		String moveURL = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			HttpSession session = request.getSession();
			
			String str_page = request.getParameter("page_cnt");
			LOG.debug(" **** MorePageService before - page_cnt {} ", str_page);
			
			int post_page = 0;
			
			if(Integer.parseInt(str_page) == 0)
			{
				LOG.debug(" On Reload Page - page_cnt {} ", Integer.parseInt(str_page));
				post_page = 0;
			} else {
				post_page = (int)session.getAttribute("post_page");
				LOG.debug(" MorePageService getSession post_page =  {} ", post_page);
			}
				
			BmtPostDAO daoPost = new BmtPostDAO();
			ArrayList<BmtOnePostDTO> listDto = daoPost.SelectPagePost(post_page);
			for(int i=0; i< listDto.size(); i++) {
				LOG.debug(" post {} rn {} - {} ", i, listDto.get(i).getRn(), listDto.get(i).getP_content());
			}
			
			post_page++;
			
			if(listDto.size() == 0)
				post_page -= 1;
			
			LOG.debug(" **** MorePageService after - post_page {} ", post_page);
			
			//json 타입으로 반환?
			
			Gson gsonFmt = new GsonBuilder().setDateFormat("yyyy/MM/dd HH:mm:ss").create();
			String gson = gsonFmt.toJson(listDto);
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("json");
			response.getWriter().write(gson);
			response.getWriter().close();
			
			LOG.debug(" {} req get gson {} ", "MorePageService", gson);
			
			session.setAttribute("post_page", post_page);
			session.setAttribute("postlist", listDto);
			
			post_page = (int)session.getAttribute("post_page");
			LOG.debug(" post_page last : {}", post_page);
			
			moveURL = "01_post.jsp";
			
			
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}
		
		return moveURL;
	} 

}
