package com.tscm.model;

public class BmtLikeDTO {
	Long like_idx;
	Long p_idx;
	String u_email;
	String like_date;
	
	public BmtLikeDTO() {
		super();
		
	}

	public Long getLike_idx() {
		return like_idx;
	}

	public void setLike_idx(Long like_idx) {
		this.like_idx = like_idx;
	}

	public Long getP_idx() {
		return p_idx;
	}

	public void setP_idx(Long p_idx) {
		this.p_idx = p_idx;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getLike_date() {
		return like_date;
	}

	public void setLike_date(String like_date) {
		this.like_date = like_date;
	}
	
	
	
	

}
