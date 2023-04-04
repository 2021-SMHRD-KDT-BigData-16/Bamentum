package com.tscm.model;

import java.util.Date;

public class BmtFollowDTO {
	
	private long f_idx;
	private String follower;
	private String following;
	private Date f_date;

	public BmtFollowDTO() {
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
	public Date getF_date() {
		return f_date;
	}
	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}

}
