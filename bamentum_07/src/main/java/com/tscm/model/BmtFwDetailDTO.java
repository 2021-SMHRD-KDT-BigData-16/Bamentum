package com.tscm.model;

import java.util.Date;

public class BmtFwDetailDTO {
	
	private long f_idx;
	private String follower;
	private String following;
	private String u_nick;
	private String u_info;
	private String u_profile;
	private Date f_date;
	
	
	public BmtFwDetailDTO() {
		super();
	}
	
	public long getF_idx() {
		return f_idx;
	}
	public void setF_idx(long f_idx) {
		this.f_idx = f_idx;
	}
	public String getFollower() {
		return follower;
	}
	public void setFollower(String follower) {
		this.follower = follower;
	}
	public String getFollowing() {
		return following;
	}
	public void setFollowing(String following) {
		this.following = following;
	}
	public String getU_nick() {
		return u_nick;
	}
	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}
	public String getU_info() {
		return u_info;
	}
	public void setU_info(String u_info) {
		this.u_info = u_info;
	}
	public String getU_profile() {
		return u_profile;
	}
	public void setU_profile(String u_profile) {
		this.u_profile = u_profile;
	}
	public Date getF_date() {
		return f_date;
	}
	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}
	
}
