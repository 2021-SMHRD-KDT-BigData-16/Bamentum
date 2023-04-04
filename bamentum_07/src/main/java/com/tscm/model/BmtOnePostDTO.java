package com.tscm.model;

import java.util.Date;

public class BmtOnePostDTO {
	private String u_nick;
	private String p_title;
	private String p_content;
	private String p_file;
	private Date p_date;
	private long p_view;
	private long p_idx;
	private int rn;
	
	public BmtOnePostDTO() {
		
	}
	
	public String getU_nick() {
		return u_nick;
	}
	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_file() {
		return p_file;
	}
	public void setP_file(String p_file) {
		this.p_file = p_file;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public long getP_view() {
		return p_view;
	}
	public void setP_view(long p_view) {
		this.p_view = p_view;
	}
	public long getP_idx() {
		return p_idx;
	}
	public void setP_idx(long p_idx) {
		this.p_idx = p_idx;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
}
