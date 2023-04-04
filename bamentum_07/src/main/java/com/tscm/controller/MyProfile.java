package com.tscm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtBicDTO;
import com.tscm.model.BmtMyPfDAO;
import com.tscm.model.BmtOnePostDTO;
import com.tscm.model.BmtPostDAO;
import com.tscm.model.BmtPostDTO;
import com.tscm.model.BmtUserDTO;

public class MyProfile implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(MyProfile.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		try {
			LOG.debug(" {} Class Start ", "MyProfile");

			request.setCharacterEncoding("UTF-8");
			
			HttpSession session = request.getSession();
			String u_email=(String)session.getAttribute("email");
			
			LOG.debug(" {} u_email {} ", "MyProfile", u_email);
			
			BmtMyPfDAO dao = new BmtMyPfDAO();
			
			BmtUserDTO dtoLogin = new BmtUserDTO();
			
			dtoLogin.setU_email(u_email);
			
			BmtUserDTO dtoUserMy =  dao.select_user(dtoLogin);
			
			LOG.debug(" MyProfile select User : email {} nick {} info {} ", 
					dtoUserMy.getU_email(), dtoUserMy.getU_nick(), dtoUserMy.getU_info());
			
			int iFollowing =  dao.count_following(dtoLogin);
			int iFollower =  dao.count_follower(dtoLogin);
			
			ArrayList<BmtBicDTO> listBic = dao.select_bic_list(dtoLogin);
			
			LOG.debug(" MyProfile listBic size {}  ", listBic.size());
			
			ArrayList<BmtPostDTO> listPost = dao.select_my_post(dtoLogin);

			LOG.debug(" MyProfile listPost size {}  ", listPost.size());
			
			session.setAttribute("mp_follower", iFollower);
			session.setAttribute("mp_following", iFollowing);
			session.setAttribute("mp_user", dtoUserMy);
			session.setAttribute("mp_bic_list", listBic);
			session.setAttribute("mp_post_list", listPost);
			
			moveURL = "05_myprofile.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}
		return moveURL;
	}
	
	private void checkNull(BmtBicDTO dto) {
		
		
		if(dto.getB_brand() == null)
		{
			dto.setB_brand("a");
		}
		else
		{
			if(dto.getB_brand().length() <= 0) {
				dto.setB_brand("a");
			}
		}

		if(dto.getB_num() == null)
		{
			dto.setB_num("a");
		}
		else
		{
			if(dto.getB_num().length() <= 0) {
				dto.setB_num("a");
			}
		}

		if(dto.getB_img() == null)
		{
			dto.setB_img("a");
		}
		else
		{
			if(dto.getB_img().length() <= 0) {
				dto.setB_img("a");
			}
		}

		if(dto.getB_model() == null)
		{
			dto.setB_model("a");
		}
		else
		{
			if(dto.getB_model().length() <= 0) {
				dto.setB_model("a");
			}
		}
		
		return;
	}
	
	

}
