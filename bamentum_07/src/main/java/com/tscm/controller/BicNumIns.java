package com.tscm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtMyPfDAO;
import com.tscm.model.BmtBicDTO;

public class BicNumIns implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(BicNumIns.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		try {

			request.setCharacterEncoding("UTF-8");
			
			HttpSession session = request.getSession();
			
			String u_email = (String)session.getAttribute("email");
			String b_brand = (String)session.getAttribute("b_brand");
			String b_model = (String)session.getAttribute("b_model");
			String b_num = (String)session.getAttribute("b_num");
			String b_img = (String)session.getAttribute("b_img");
			
			LOG.debug("b_brand : {}, b_model : {}, b_num : {} b_img {} u_email {}", 
					b_brand, b_model, b_num, b_img, u_email);
			
			
			BmtBicDTO dto = new BmtBicDTO();
			dto.setB_brand(b_brand);
			dto.setB_num(b_num);
			dto.setU_email(u_email);
			dto.setB_model(b_model);
			dto.setB_img(b_img);
			
			checkNull(dto);
			
			
			
			LOG.debug("*** b_img {}", dto.getB_img());
			
			BmtMyPfDAO dao = new BmtMyPfDAO();
			int cnt = dao.bic_insert(dto);
			

			LOG.debug(" bic_num ins return cnt : {} ", cnt);
			if (cnt > 0) {
				request.setAttribute("u_email", u_email);
				moveURL = "01_post.jsp";

			} else {
				moveURL = "04_bic_num.jsp";
			}

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
