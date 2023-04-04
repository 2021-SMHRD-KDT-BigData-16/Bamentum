package com.tscm.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.controller.BicNumIns;

public class BmtBicDTO {
	private static final Logger LOG = LoggerFactory.getLogger(BicNumIns.class);
	
	private String b_num;
	private String u_email;
	private String b_img;
	private String b_brand;
	private String b_model;
	
	
	public BmtBicDTO() {
	}


	public String getB_num() {
		return b_num;
	}


	public void setB_num(String b_num) {
		this.b_num = b_num;
	}


	public String getU_email() {
		return u_email;
	}


	public void setU_email(String u_email) {
		this.u_email = u_email;
	}


	public String getB_img() {
		return b_img;
	}


	public void setB_img(String b_img) {
		this.b_img = b_img;
	}


	public String getB_brand() {
		return b_brand;
	}


	public void setB_brand(String b_brand) {
		this.b_brand = b_brand;
	}


	public String getB_model() {
		return b_model;
	}


	public void setB_model(String b_model) {
		this.b_model = b_model;
	}

	
}
