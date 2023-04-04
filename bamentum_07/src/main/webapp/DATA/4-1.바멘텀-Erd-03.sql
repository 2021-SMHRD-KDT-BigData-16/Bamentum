
drop table bmt_connect;
drop table bm_pt_like;
drop table bmt_follow;
drop table bmt_reply;
drop table bmt_cid;
drop table bmt_post;
drop table bmt_board;
drop table bmt_user;




CREATE TABLE bmt_user (
	email	VarChar2(50)		PRIMARY KEY,
	pw	    VARCHAR2(20)		NOT NULL,
	nick	VarChar2(50)		NULL,
	pf_img	VARCHAR2(500)		NULL,
	pf_text	VARCHAR2(2000)		NULL,
	course	VARCHAR2(500)		NULL
);

CREATE TABLE bmt_board (
	brd_id	    NUMBER(10)		PRIMARY KEY,
	brd_type	VARCHAR2(20)	NULL
);

CREATE TABLE bmt_post (
	post_id	    NUMBER(20)		PRIMARY KEY,
	brd_id	    NUMBER(10)		NOT NULL,
	email	    VarChar2(50)	NOT NULL,
	cr_date	    DATE		    NULL,
	title	    VarChar2(100)	NULL,
	pt_text	    VARCHAR2(2000)	NULL,
	img_path	VarChar2(500)	NULL,
	like_cnt	NUMBER(10)		NULL
    
   ,foreign key (email) references bmt_user(email)
   ,foreign key (brd_id) references bmt_board(brd_id)
    
);

CREATE TABLE bmt_cid (
	cid_num	VarChar2(20)		PRIMARY KEY,
	email	VarChar2(50)		NOT NULL,
	cid_img	VARCHAR2(500)		NULL
    
   ,foreign key (email) references bmt_user(email)
);


CREATE TABLE bmt_reply (
	reply_id	Number(10)		PRIMARY KEY,
	post_id	    NUMBER(10)		NOT NULL,
	email	    VarChar2(50)	NOT NULL,
	cr_date	    DATE		    NULL,
	Reply	    VarChar2(500)	NULL
    
   ,foreign key (email) references bmt_user(email)
   ,foreign key (post_id) references bmt_post(post_id)
    
);


CREATE TABLE bmt_follow (
	follow_id	NUMBER(20)		PRIMARY KEY,
	my_email	VarChar2(50)	NOT NULL,
	fw_email	VarChar2(50)	NOT NULL
    
   ,foreign key (my_email) references bmt_user(email)
   ,foreign key (fw_email) references bmt_user(email)
    
);

CREATE TABLE bm_pt_like (
	pt_likeid	NUMBER(20)		PRIMARY KEY,
	post_id	    NUMBER(20)		NOT NULL,
	email	    VarChar2(50)	NOT NULL
    
   ,foreign key (email) references bmt_user(email)
   ,foreign key (post_id) references bmt_post(post_id)
    
);

CREATE TABLE bmt_connect (
	connect_id	NUMBER(20)		PRIMARY KEY,
	email	    VarChar2(50)	NOT NULL,
	last_date	DATE		    NULL
    
   ,foreign key (email) references bmt_user(email)
    
);

