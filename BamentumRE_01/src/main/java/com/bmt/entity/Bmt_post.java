package com.bmt.entity;

import java.util.Date;

import lombok.Data;

@Data
public class Bmt_post {

	private int idx;
	private String title;
	private Date pdate;
	private String file;
	private int view;
	private String content;
	private String email;
	private String nick;
	
}


