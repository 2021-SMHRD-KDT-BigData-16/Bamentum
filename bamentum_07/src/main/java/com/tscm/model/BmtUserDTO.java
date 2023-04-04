package com.tscm.model;

import java.util.Date;

public class BmtUserDTO {
	private String u_email;
	private String u_pw;
	private String u_nick;
	private String u_profile;
	private String u_info;
	private String u_course;
	private Date u_joindate;
	private String u_type;
	
	
	public BmtUserDTO() {
		
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_nick() {
		return u_nick;
	}

	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}

	public String getU_profile() {
		return u_profile;
	}

	public void setU_profile(String u_profile) {
		this.u_profile = u_profile;
	}

	public String getU_info() {
		return u_info;
	}

	public void setU_info(String u_info) {
		this.u_info = u_info;
	}

	public String getU_course() {
		return u_course;
	}

	public void setU_course(String u_course) {
		this.u_course = u_course;
	}

	public Date getU_joindate() {
		return u_joindate;
	}

	public void setU_joindate(Date u_joindate) {
		this.u_joindate = u_joindate;
	}

	public String getU_type() {
		return u_type;
	}

	public void setU_type(String u_type) {
		this.u_type = u_type;
	}
	
	
}
