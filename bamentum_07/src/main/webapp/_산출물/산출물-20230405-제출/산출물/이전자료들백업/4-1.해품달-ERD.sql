drop table BMT_CID;
drop table BMT_COMMENT ;
drop table BMT_CONNECTION ;
drop table BMT_FOLLOW ;
drop table BMT_POST ;
drop table BMT_POST_LIKES ;
drop table BMT_USER ;

commit;

-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- bmt_user Table Create SQL
-- 테이블 생성 SQL - bmt_user


CREATE TABLE bmt_user
(
    u_email       VARCHAR2(40)      NOT NULL, 
    u_pw          VARCHAR2(20)      NOT NULL, 
    u_nick        VARCHAR2(20)      NOT NULL, 
    u_profile     VARCHAR2(600)     NOT NULL, 
    u_info        VARCHAR2(4000)    NOT NULL, 
    u_course      VARCHAR2(600)     NOT NULL, 
    u_joindate    DATE              DEFAULT SYSDATE NOT NULL, 
    u_type        CHAR(1)           NOT NULL, 
     PRIMARY KEY (u_email)
);


CREATE TABLE bmt_post
(
    p_idx        NUMBER(18, 0)     NOT NULL, 
    p_type       CHAR(1)           NOT NULL, 
    p_title      VARCHAR2(600)     NOT NULL, 
    p_content    VARCHAR2(4000)    NOT NULL, 
    p_file       VARCHAR2(600)     NOT NULL, 
    p_date       DATE              DEFAULT SYSDATE NOT NULL, 
    u_email      VARCHAR2(40)      NOT NULL, 
    p_view       NUMBER(18, 0)     NOT NULL, 
     PRIMARY KEY (p_idx)
);




ALTER TABLE bmt_post
    ADD CONSTRAINT FK_bmt_post_u_email_bmt_user_u_email FOREIGN KEY (u_email)
        REFERENCES bmt_user (u_email) ;


CREATE TABLE bmt_comment
(
    c_idx        NUMBER(18, 0)     NOT NULL, 
    p_idx        NUMBER(18, 0)     NOT NULL, 
    c_content    VARCHAR2(4000)    NOT NULL, 
    c_date       DATE              DEFAULT SYSDATE NOT NULL, 
    u_email      VARCHAR2(40)      NOT NULL, 
     PRIMARY KEY (c_idx)
);




ALTER TABLE bmt_comment
    ADD CONSTRAINT FK_bmt_comment_p_idx_bmt_post_p_idx FOREIGN KEY (p_idx)
        REFERENCES bmt_post (p_idx) ;

ALTER TABLE bmt_comment
    ADD CONSTRAINT FK_bmt_comment_u_email_bmt_user_u_email FOREIGN KEY (u_email)
        REFERENCES bmt_user (u_email) ;


CREATE TABLE bmt_follow
(
    f_idx        NUMBER(18, 0)    NOT NULL, 
    follower     VARCHAR2(40)     NOT NULL, 
    following    VARCHAR2(40)     NOT NULL, 
    f_date       DATE             DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (f_idx)
);



ALTER TABLE bmt_follow
    ADD CONSTRAINT FK_bmt_follow_follower_bmt_user_u_email FOREIGN KEY (follower)
        REFERENCES bmt_user (u_email) ;


CREATE TABLE bmt_bic
(
    b_num      VARCHAR2(40)     NOT NULL, 
    u_email    VARCHAR2(40)     NOT NULL, 
    b_img      VARCHAR2(600)    NOT NULL, 
     PRIMARY KEY (b_num)
);



ALTER TABLE bmt_bic
    ADD CONSTRAINT FK_bmt_bic_u_email_bmt_user_u_email FOREIGN KEY (u_email)
        REFERENCES bmt_user (u_email) ;



