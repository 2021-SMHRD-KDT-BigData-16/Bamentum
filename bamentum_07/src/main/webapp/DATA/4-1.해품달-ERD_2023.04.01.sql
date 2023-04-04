drop sequence bmt_fw_seq;

drop sequence BMT_COMMENT_SEQ;
drop sequence BMT_CONNECTION_SEQ;
drop sequence BMT_FOLLOW_SEQ;
drop sequence BMT_POST_LIKES_SEQ;
drop sequence BMT_POST_SEQ;



drop table BMT_POST_LIKES ;
drop table BMT_BIC;
drop table BMT_CID;
drop table BMT_COMMENT ;
drop table BMT_CONNECTION ;
drop table BMT_FOLLOW ;
drop table BMT_POST ;
drop table BMT_USER ;

commit;

create sequence BMT_COMMENT_SEQ;
create sequence BMT_CONNECTION_SEQ;
create sequence BMT_FOLLOW_SEQ;
create sequence BMT_POST_LIKES_SEQ;
create sequence BMT_POST_SEQ;


--  create sequence bmt_fw_seq;


-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

-- bmt_user Table Create SQL
-- ���̺� ���� SQL - bmt_user


CREATE TABLE bmt_user
(
    u_email       VARCHAR2(80)      NOT NULL, 
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
    u_email      VARCHAR2(80)      NOT NULL, 
    p_view       NUMBER(18, 0)     NOT NULL, 
     PRIMARY KEY (p_idx)
   ,foreign key (u_email) references bmt_user(u_email)
     
);


CREATE TABLE bmt_comment
(
    c_idx        NUMBER(18, 0)     NOT NULL, 
    p_idx        NUMBER(18, 0)     NOT NULL, 
    c_content    VARCHAR2(4000)    NOT NULL, 
    c_date       DATE              DEFAULT SYSDATE NOT NULL, 
    u_email      VARCHAR2(80)      NOT NULL, 
     PRIMARY KEY (c_idx)
   ,foreign key (u_email) references bmt_user(u_email)
   ,foreign key (p_idx) references bmt_post(p_idx)
     
);



CREATE TABLE bmt_follow
(
    f_idx        NUMBER(18, 0)    NOT NULL, 
    follower     VARCHAR2(40)     NOT NULL, 
    following    VARCHAR2(40)     NOT NULL, 
    f_date       DATE             DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (f_idx)
   ,foreign key (follower) references bmt_user(u_email)
   ,foreign key (following) references bmt_user(u_email)
     
);

ALTER TABLE bmt_follow ADD UNIQUE (follower, following);
/*
CREATE TABLE bmt_bic
(
    b_num      VARCHAR2(40)     NOT NULL, 
    u_email    VARCHAR2(80)     NOT NULL, 
    b_img      VARCHAR2(600)    NOT NULL, 
     PRIMARY KEY (b_num)
     
   ,foreign key (u_email) references bmt_user(u_email)
     
);
*/


CREATE TABLE bmt_bic
(
    b_num      VARCHAR2(40)     NOT NULL, 
    u_email    VARCHAR2(80)     NOT NULL, 
    b_img      VARCHAR2(600)    NOT NULL, 
    b_brand    VARCHAR2(80)    NOT NULL, 
    b_model    VARCHAR2(80)    NOT NULL, 
     PRIMARY KEY (b_num)
     
   ,foreign key (u_email) references bmt_user(u_email)
     
);


CREATE TABLE bmt_post_likes
(
    likes_idx    NUMBER(18, 0)    NOT NULL, 
    p_idx        NUMBER(18, 0)    NOT NULL, 
    u_email      VARCHAR2(80)     NOT NULL, 
    likes_dt     DATE             DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (likes_idx)
     
   ,foreign key (p_idx) references bmt_post(p_idx)
   ,foreign key (u_email) references bmt_user(u_email)
     
);

ALTER TABLE bmt_post_likes ADD UNIQUE (p_idx, u_email);



-- bmt_connection Table Create SQL
-- ���̺� ���� SQL - bmt_connection
CREATE TABLE bmt_connection
(
    conn_idx     NUMBER(18, 0)    NOT NULL, 
    conn_type    CHAR(1)          NOT NULL, 
    conn_dt      DATE             DEFAULT SYSDATE NOT NULL, 
    u_email      VARCHAR2(80)     NOT NULL, 
     PRIMARY KEY (conn_idx)
   ,foreign key (u_email) references bmt_user(u_email)
);

commit;


insert into bmt_user values ('Gyu_nam1211@bamentum.com',    'aaa', '���Գ�', './DATA/ImgProfil/pf000.jpg', '���ֵ������� ����Ʈ���簳�߿����� �����ŷ� ������ϰ� �ֽ��ϴ� �ߺ�Ź�帳�ϴ٤�����', ' ' , TO_DATE('2023/03/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Ho_won0806@bamentum.com',     'aaa', '��ȣ��', './DATA/ImgProfil/pf001.jpg', '���ȿ��� �Ǵٸ� ���̴��� �־�� ���� ������̵� ������ּ���', ' ' , TO_DATE('2023/03/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('Kwon_Min1102@bamentum.com',   'aaa', '��ǹ�', './DATA/ImgProfil/pf002.jpg', '�����򱤿��� ������Ÿ�� ��ƹ����Դϴ�', ' ' , TO_DATE('2023/03/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Sohyun0519@bamentum.com',     'aaa', '������', './DATA/ImgProfil/pf003.jpg', '���ֿ��� ������Ÿ�� ����ߴ�ϴ�v', ' ' , TO_DATE('2023/03/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('KIHYUN0928@bamentum.com',     'aaa', '�Ǳ���', './DATA/ImgProfil/pf004.jpg', '�Ǳ����� �����ŷ� ������ϴ� ���� �������Դϴ�', ' ' , TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Young_Min0531@bamentum.com',  'aaa', '�⿵��', './DATA/ImgProfil/pf005.jpg', 'û�㵿���� �����ŷ� ������ϴ� CEO ', ' ' , TO_DATE('2023/03/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Ha_Eun0103@bamentum.com',     'aaa', '������', './DATA/ImgProfil/pf006.jpg', '������ �̳� �����Դϴ�~ �ߺ�Ź�帳�ϴ�', ' ' , TO_DATE('2023/03/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Kyungsoo0723@bamentum.com',   'aaa', '�����', './DATA/ImgProfil/pf007.jpg', 'Ŭ���ְ̹� �����ŷ� �ڱ����!', ' ' , TO_DATE('2023/03/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Da-gyeong0711@bamentum.com',  'aaa', '��ٰ�', './DATA/ImgProfil/pf008.jpg', '������ �����������Դϴ�! �ߺ�Ź�帳�ϴ�!', ' ' , TO_DATE('2023/03/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Hyeong_sun0331@bamentum.com', 'aaa', '������', './DATA/ImgProfil/pf009.jpg', '���̽��Ͱ��� �����ŷ� ������ϴ� ���Դϴ�', ' ' , TO_DATE('2023/03/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Mi_yeon0602@bamentum.com',    'aaa', '�ȹ̿�', './DATA/ImgProfil/pf010.jpg', '�����ŷ� �ؿܿ���ٴϴ� ���̿��� ���������ؿ�!', ' ' , TO_DATE('2023/03/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Sangjae0604@bamentum.com',    'aaa', '������', './DATA/ImgProfil/pf011.jpg', '������ �����Ͼ� ������ �ϰ� �ִ� ���̴��Դϴ�!', ' ' , TO_DATE('2023/03/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Jung_Hyun0421@bamentum.com',  'aaa', '������', './DATA/ImgProfil/pf012.jpg', '��������ȴ�,�����ٴϱ�ȴ�,�����ϱ�ȴ�! �����ɼ��� ��������!', ' ' , TO_DATE('2023/03/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Semi1108@bamentum.com',       'aaa', '�̼���', './DATA/ImgProfil/pf013.jpg', '�����ŷ� �츮���� ���俩�����̿���~', ' ' , TO_DATE('2023/03/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('JiKang1010@bamentum.com',     'aaa', '������', './DATA/ImgProfil/pf014.jpg', '�����ŷ� ����Ž�����Դϴ� �ȳ�', ' ' , TO_DATE('2023/03/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ESOO0710@bamentum.com',       'aaa', '���̼�', './DATA/ImgProfil/pf015.jpg', '������ ������ ������ �� �ִµ�? ���� �ٸ�����', ' ' , TO_DATE('2023/03/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Young-rae0618@bamentum.com',  'aaa', '�ֿ���', './DATA/ImgProfil/pf016.jpg', '������ �����ű��� ��ô�Ѵ�! �����ű� �ڽ� ��õ�� ������', ' ' , TO_DATE('2023/03/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('JunYong0112@bamentum.com',    'aaa', '���ؿ�', './DATA/ImgProfil/pf017.jpg', '������ ȭ���� ���� �°����� ���Բ� ������ Ÿ�� �ֽ��ϴ�', ' ' , TO_DATE('2023/03/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('zipgalle1116@bamentum.com',   'aaa', '�ֱ�ȣ', './DATA/ImgProfil/pf018.jpg', '�ؿܿ��� �����ϴ� �߿� �����ŷ� ����ٴϴ� �̽��͸����Դϴ�', ' ' , TO_DATE('2023/03/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('SeongGyu0407@bamentum.com',   'aaa', '�Ѽ���', './DATA/ImgProfil/pf019.jpg', '������� ���̿� ȸ�� �ٴϰ� �ִ� �ѿ������Դϴ٤�����', ' ' , TO_DATE('2023/03/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Yeonwoo0806@bamentum.com',    'aaa', '�迬��', './DATA/ImgProfil/pf020.jpg', '����������,�Ѿ����,������,���������! ���� ������ ������ �������ŷ�! ', ' ' , TO_DATE('2023/03/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;

insert into bmt_user values ('aaa@aaa.aaa',    'aaa', '������', './DATA/ImgProfil/img021.jpg', '����������,�Ѿ����,������,���������! ���� ������ ������ �������ŷ�! ', ' ' , TO_DATE('2023/03/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('eee@eee.eee',    'eee', '������', './DATA/ImgProfil/img021.jpg', '����������,�Ѿ����,������,���������! ���� ������ ������ �������ŷ�! ', ' ' , TO_DATE('2023/03/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;

commit;


insert into bmt_post values (10001, 'f', '��õ�� ���� ���̵�', '���� �߰� �ٹ��� ���� �� �������� �� ��õ�� ���ͺ�ġ�� ���̵� �ϰ� �Խ��� �� ���� �����̴� �� �ٳ������ ��??', './DATA/PostImage/img001.jpeg', TO_DATE('2023/03/29 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com', 11);
insert into bmt_post values (10002, 'f', 'XC�ϵ����Ϸ� ���� ����� �̱� ���̵� �ı�', '�Թ����� 3�� �� �� ������ �̱۶��̵� �ʹ� ��մ� �� �����ϴ�.', './DATA/PostImage/img002.jpg', TO_DATE('2023/03/27 08:12:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ho_won0806@bamentum.com', 12);
insert into bmt_post values (10003, 'f', '�����Ÿ� Ÿ�� �Ǵ� ����~~~~!!!', '�����Ÿ� Ÿ�� �Ǵ� ����~~~~~!!! �� ȣ���ϴ� ǳ���� ��ٸ��ٴ�,,,,,,,,', './DATA/PostImage/img003.jpg', TO_DATE('2023/03/24 21:54:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kwon_Min1102@bamentum.com', 13);
insert into bmt_post values (10004, 'f', '÷���� ���� ������~', '������ �ʹ� ���׿� ������ ����.�ٸ�  �԰�Դµ� �� ���ƿ�~ ���ɵ鵵 �� �̻Ѱ�@@ 5�޸��� ſ���� 30k�Դµ��� ��.�� �ٶ����ϴٿ��� �ʱ�ȭ?����', './DATA/PostImage/img004.jpg', TO_DATE('2023/03/29 15:10:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com', 14);
insert into bmt_post values (10005, 'f', 'ģ�� �����ſ� ��������', '�б���忡�� �㿡 �۷���� �����Ÿ� �ѹ��� ������ ���� �����ϴ°͵��� ���� ������ �����׿�!', './DATA/PostImage/img005.jpg', TO_DATE('2023/03/11 23:52:00', 'YYYY/MM/DD HH24:MI:SS'), 'KIHYUN0928@bamentum.com', 15);
insert into bmt_post values (10006, 'f', '���� �ظ��̴ٸ� ������', '���� ��ٱ� ���� �� �� �� �� ���̿Ծ��^^', './DATA/PostImage/img006.jpg', TO_DATE('2023/03/14 18:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com', 16);
insert into bmt_post values (10007, 'f', '�ƶ� �κζ��̵� ���� ���̳׿�', '�ǵ� ���� :?���������� ������ �������� ���̵� ���Դ��� ���� �����ֳ׿�~ û�󿡼� ������ �޸��� �Գ׿�~ ���������� �ܹ��� �ϳ� �԰�, �ƹ̳����Ż�� ������ �����ϴ� ���׿� ��', './DATA/PostImage/img007.jpg', TO_DATE('2023/03/04 14:56:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ha_Eun0103@bamentum.com', 17);
insert into bmt_post values (10008, 'f', '[����] ���޻� ���̵�', '��Ÿ�� ������ ���� ������ ������ �����մϴ� ���� ���� ��ȣ���� ��ġ�ִ� �����̿��� ������ Ǯ���� ����� �۵��� ���� �ö���� �ֳ׿�  ���ο�, ��濡 ���� ���̴����� ���������� ������ ����ϰ� �纸�ϸ鼭 ������ ����� ���̵��� �Ͻñ� �ٶ��ϴ� ', './DATA/PostImage/img008.jpeg', TO_DATE('2023/02/27 20:31:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kyungsoo0723@bamentum.com', 18);
insert into bmt_post values (10009, 'f', '������ ������ ��', '���� �ѹ��� ���鼭 �������� �ٸ����� �ٴϴ� ��� ���� ����� �ӹ��� �ֽ��ϴ�', './DATA/PostImage/img009.jpg', TO_DATE('2023/02/21 16:41:00', 'YYYY/MM/DD HH24:MI:SS'), 'Da-gyeong0711@bamentum.com', 19);
insert into bmt_post values (10010, 'f', '������ ���̵� ����', '�λ���̵��� �ͼ� �λ��񿡼� �� ����ģ����� �λ� ����� �������� �ѹ� ���ҽ��ϴ�.', './DATA/PostImage/img010.jpg', TO_DATE('2023/02/08 20:24:00', 'YYYY/MM/DD HH24:MI:SS'), 'Hyeong_sun0331@bamentum.com', 10);
insert into bmt_post values (10011, 'f', '[����] ��ǳ ���̵�', '�ٶ� ���п� ����� ���������� �ҽ��ϰ� �����Ű� ��û�� ������ ���� �Ҿ����ϴ� ��ǳ�� �հ� �������� �ڵ��� �� ������� ���� �η��� �������� �����߽��ϴ� ��Ż�� �ο���� ������ ȭ����! ���ĺ��ϴ� ', './DATA/PostImage/img011.jpeg', TO_DATE('2023/02/20 20:33:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com', 11);
insert into bmt_post values (10012, 'f', '[4�밭��]���갭 ���� �ı�(3/26~27)', '�۳� ���������� ���� ���갭���ָ� �ϰ� �Խ��ϴ�! �������� Ȧ�� �ٳ�Դµ�, ���갭�� �����ű����ϰ� 4�ָ��� ���� �������԰� �Բ� ���� ������ 1��2�Ϸ� �ٳ�Ծ��. ', './DATA/PostImage/img012.jpg', TO_DATE('2023/03/29 14:28:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sangjae0604@bamentum.com', 12);
insert into bmt_post values (10013, 'f', '������ �Ѱ��ٳ�Ծ��.', '�������ִ� �ϰ� ������ �ѹ��� ���Ƽ� �� ������ �ȵǰ�  �������� �غ��� ����ϰ� ���ݾ� ��õ���� �ڸ��Դϴ�. ū �����԰� ����ġ��� ���������� �������������ͱ��� �ٳ�Խ��ϴ�. ', './DATA/PostImage/img013.jpg', TO_DATE('2023/03/25 20:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Jung_Hyun0421@bamentum.com', 13);
insert into bmt_post values (10014, 'f', 'Byplorer ����� 68ȸ', '������ �����극�� 200�� �ٳ�Խ��ϴ�. �극������ ������ ���� ȸ���е��� ������ �ϴ� �����̱⵵ �մϴ�. ������ �����̰� �ؾߵɰ��� ����Ե� �󱼵��� ���� �׷��� ������ ������ �������� �������� ��°��� ���� ���̵����� �� �ູ���� �����ϴ�.^^', './DATA/PostImage/img014.jpg', TO_DATE('2023/03/01 20:19:00', 'YYYY/MM/DD HH24:MI:SS'), 'Semi1108@bamentum.com', 14);
insert into bmt_post values (10015, 'f', '�Խ������ı�', '�����ŷδ� ó�������� �Ϻ������̿��µ� ���� �����Ҿ ������ ����⿡ �Ǿ ������ ��ȹ���Դϴ�', './DATA/PostImage/img015.jpeg', TO_DATE('2023/03/15 21:26:00', 'YYYY/MM/DD HH24:MI:SS'), 'JiKang1010@bamentum.com', 15);
insert into bmt_post values (10016, 'f', '���� ���̵�', '���޶� ���ϴ� ���鵵 ���� ���� ������ �������� ������ ����� �������׿� �� 10Ű�������� �浵 �����ϰ� �ָ��� �ð� �������� ��κ� ����� �ɴϴ� ����', './DATA/PostImage/img016.jpeg', TO_DATE('2022/05/03 17:53:00', 'YYYY/MM/DD HH24:MI:SS'), 'ESOO0710@bamentum.com', 16);
insert into bmt_post values (10017, 'f', '���� �����ſ��� ', '���� ������ �ٸ� ǳ���� ��������. ���ϰ� ��� ������� ȣ���� ƴ���� ǳ�¹������ �ﵵ ���� ���´�. �׸��� �ݴ��� ���¸������� �����ǰ��Ӽ� �����庮���� ������ ����� ��� ���θ��� �ִ�.', './DATA/PostImage/img017.jpg', TO_DATE('2022/07/31 15:19:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young-rae0618@bamentum.com', 17);
insert into bmt_post values (10018, 'f', '��������� �����ó��ѹ��� �ϰ� �Խ��ϴ�!', '������ �����ŵ��ΰ� �ʹ� �ߵǾ��ְ� ��ȣ�� �����־ �����ϰ� Ÿ��ٴ� �� �־����!', './DATA/PostImage/img018.jpg', TO_DATE('2022/04/23 00:17:00', 'YYYY/MM/DD HH24:MI:SS'), 'JunYong0112@bamentum.com', 18);
insert into bmt_post values (10019, 'f', '������ ������ �������̱� �������̳׿�. ', '���� ��� ������ ���ΰ� �ִٴ°� �� �η����ϴ�.', './DATA/PostImage/img019.png', TO_DATE('2022/04/09 23:03:00', 'YYYY/MM/DD HH24:MI:SS'), 'zipgalle1116@bamentum.com', 19);
insert into bmt_post values (10020, 'f', '�±� �ڴ����� ������ �Ұ��մϴ� -Ʈ����-', '�̷��� ������� ��ŷ ��ŷ���ָ� ������ ���� ������...����Ʈ�� ����.. �̷��� ������ �ٸ�(?)���� �����ϰ� �˴ϴ�. ', './DATA/PostImage/img020.jpg', TO_DATE('2022/01/16 14:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'SeongGyu0407@bamentum.com', 10);



commit;


--delete from bmt_comment;

insert into bmt_comment values (20001, 10001, ' ������������  ', TO_DATE('2023/03/29 12:31:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com');
insert into bmt_comment values (20002, 10001, ' �׷��ȱ׷���  ', TO_DATE('2023/03/29 12:32:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ho_won0806@bamentum.com');
insert into bmt_comment values (20003, 10001, ' �̹�ģ�̹�ģ  ', TO_DATE('2023/03/29 12:33:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com');
insert into bmt_comment values (20004, 10001, ' ����Ÿ����Ÿ  ', TO_DATE('2023/03/29 12:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kwon_Min1102@bamentum.com');
insert into bmt_comment values (20005, 10001, ' �ƹ�Ÿ�ƹ�Ÿ  ', TO_DATE('2023/03/29 12:35:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com');
insert into bmt_comment values (20006, 10001, ' ���ӻ���  ', TO_DATE('2023/03/29 12:36:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com');
insert into bmt_comment values (20007, 10001, ' �׳ɺ��׳ɺ�  ', TO_DATE('2023/03/29 12:37:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com');
insert into bmt_comment values (20008, 10001, ' �ƴ����ƴ���  ', TO_DATE('2023/03/29 12:38:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com');
insert into bmt_comment values (20009, 10001, ' ��¥����¥��  ', TO_DATE('2023/03/29 12:39:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kyungsoo0723@bamentum.com');
insert into bmt_comment values (20010, 10001, ' ����ȭ����ȭ  ', TO_DATE('2023/03/29 12:30:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com');
insert into bmt_comment values (20011, 10011, ' ǥ����ǥ����  ', TO_DATE('2023/03/29 12:31:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ho_won0806@bamentum.com');
insert into bmt_comment values (20012, 10011, ' �̰Ծ��̰Ծ�  ', TO_DATE('2023/03/29 12:32:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com');
insert into bmt_comment values (20013, 10011, ' �⸸���⸸��  ', TO_DATE('2023/03/29 12:33:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kyungsoo0723@bamentum.com');
insert into bmt_comment values (20014, 10011, ' ��ȭ����ȭ��  ', TO_DATE('2023/03/29 12:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com');
insert into bmt_comment values (20015, 10011, ' �Ϻ��ѿϺ���  ', TO_DATE('2023/03/29 12:35:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ho_won0806@bamentum.com');
insert into bmt_comment values (20016, 10011, ' ������������  ', TO_DATE('2023/03/29 12:36:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com');
insert into bmt_comment values (20017, 10011, ' �ɾ߿��ɾ߿�  ', TO_DATE('2023/03/29 12:37:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ha_Eun0103@bamentum.com');
insert into bmt_comment values (20018, 10011, ' �а���а���  ', TO_DATE('2023/03/29 12:38:00', 'YYYY/MM/DD HH24:MI:SS'), 'KIHYUN0928@bamentum.com');
insert into bmt_comment values (20019, 10011, ' ������������  ', TO_DATE('2023/03/29 12:39:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com');
insert into bmt_comment values (20020, 10011, ' ��¥����¥��  ', TO_DATE('2023/03/29 12:30:00', 'YYYY/MM/DD HH24:MI:SS'), 'KIHYUN0928@bamentum.com');





commit;

insert into bmt_follow values (30001, 'Mi_yeon0602@bamentum.com',   'Ho_won0806@bamentum.com',    TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into bmt_follow values (30002, 'Mi_yeon0602@bamentum.com',   'Sohyun0519@bamentum.com',    TO_DATE('2023/03/05 11:01:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into bmt_follow values (30003, 'Mi_yeon0602@bamentum.com',   'Young_Min0531@bamentum.com', TO_DATE('2023/03/05 11:02:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into bmt_follow values (30004, 'Young_Min0531@bamentum.com', 'Mi_yeon0602@bamentum.com',   TO_DATE('2023/03/05 11:03:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into bmt_follow values (30005, 'Kyungsoo0723@bamentum.com',  'Yeonwoo0806@bamentum.com',   TO_DATE('2023/03/05 11:04:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into bmt_follow values (30006, 'Kyungsoo0723@bamentum.com',  'Sangjae0604@bamentum.com',   TO_DATE('2023/03/05 11:05:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into bmt_follow values (30007, 'Sangjae0604@bamentum.com',   'Yeonwoo0806@bamentum.com',   TO_DATE('2023/03/05 11:05:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into bmt_follow values (30008, 'Yeonwoo0806@bamentum.com',   'Young_Min0531@bamentum.com', TO_DATE('2023/03/05 11:05:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into bmt_follow values (30009, 'Yeonwoo0806@bamentum.com',   'Mi_yeon0602@bamentum.com',   TO_DATE('2023/03/05 11:05:00', 'YYYY/MM/DD HH24:MI:SS'));


commit;


-- delete from bmt_bic;

insert into bmt_bic values ('WSBC021015577T',        'Mi_yeon0602@bamentum.com',       './DATA/bic_num_img/bic_num/1-1.png',   ' ',  ' ');
insert into bmt_bic values ('WTU189C0817T',          'Young_Min0531@bamentum.com',     './DATA/bic_num_img/bic_num/2-1.jpeg',  ' ',  ' ');
insert into bmt_bic values ('WTU190C7684T',          'Kyungsoo0723@bamentum.com',      './DATA/bic_num_img/bic_num/3-1.jpg',   ' ',  ' ');
insert into bmt_bic values ('WSBC001002294R',        'Sangjae0604@bamentum.com',       './DATA/bic_num_img/bic_num/4-1.jpg',   ' ',  ' ');
insert into bmt_bic values ('STR23D25221070081T',    'Yeonwoo0806@bamentum.com',       './DATA/bic_num_img/bic_num/5-1.jpg',   ' ',  ' ');
insert into bmt_bic values ('wto017ct0074m0207',     'Gyu_nam1211@bamentum.com',       './DATA/bic_num_img/bic_num/6-1.jpg',   ' ',  ' ');
insert into bmt_bic values ('JG22120672',            'SeongGyu0407@bamentum.com',      './DATA/bic_num_img/bic_num/7-2.jpg',   ' ',  ' ');
insert into bmt_bic values ('JMH220404156',          'Kwon_Min1102@bamentum.com',      './DATA/bic_num_img/bic_num/8-2.jpg',   ' ',  ' ');
insert into bmt_bic values ('236325221900481',       'Sohyun0519@bamentum.com',        './DATA/bic_num_img/bic_num/9-1.jpeg',  ' ',  ' ');
insert into bmt_bic values ('B1A114504S WBK946971S', 'KIHYUN0928@bamentum.com',        './DATA/bic_num_img/bic_num/10-1.jpg',  ' ',  ' ');
insert into bmt_bic values ('XD2112APOO31C',         'Ha_Eun0103@bamentum.com',        './DATA/bic_num_img/bic_num/11-1.jpg',  ' ',  ' ');
insert into bmt_bic values ('AAAAA',                 'Da-gyeong0711@bamentum.com',     './DATA/bic_num_img/bic_num/12-1.jpg',  ' ',  ' ');
insert into bmt_bic values ('WTU256XC0146T',         'Hyeong_sun0331@bamentum.com',    './DATA/bic_num_img/bic_num/13-1.jpg',  ' ',  ' ');
insert into bmt_bic values ('IBDFSD17KA1732',        'Jung_Hyun0421@bamentum.com',     './DATA/bic_num_img/bic_num/14-1.jpg',  ' ',  ' ');
insert into bmt_bic values ('BM22100830',            'Semi1108@bamentum.com',          './DATA/bic_num_img/bic_num/15-1.jpg',  ' ',  ' ');
insert into bmt_bic values ('JMH201203868',          'JiKang1010@bamentum.com',        './DATA/bic_num_img/bic_num/16-1.jpg',  ' ',  ' ');
insert into bmt_bic values ('LK210330577',           'ESOO0710@bamentum.com',          './DATA/bic_num_img/bic_num/17-1.jpeg', ' ',  ' ');
insert into bmt_bic values ('AH20M 165918',          'Young-rae0618@bamentum.com',     './DATA/bic_num_img/bic_num/18-1.jpg',  ' ',  ' ');
insert into bmt_bic values ('Y5C05217',              'JunYong0112@bamentum.com',       './DATA/bic_num_img/bic_num/19-1.jpg',  ' ',  ' ');
insert into bmt_bic values ('P19CE9110084',          'zipgalle1116@bamentum.com',      './DATA/bic_num_img/bic_num/20-1.jpg',  ' ',  ' ');

commit;


insert into bmt_post values (10031, 'f', '��õ�� ���� ���̵�', '���� �߰� �ٹ��� ���� �� �������� �� ��õ�� ���ͺ�ġ�� ���̵� �ϰ� �Խ��� �� ���� �����̴� �� �ٳ������ ��??', './DATA/PostImage/img001.jpeg', TO_DATE('2023/03/29 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'aaa@aaa.aaa', 11);
insert into bmt_post values (10032, 'f', '[����] ��ǳ ���̵�', '�ٶ� ���п� ����� ���������� �ҽ��ϰ� �����Ű� ��û�� ������ ���� �Ҿ����ϴ� ', './DATA/PostImage/img002.jpeg', TO_DATE('2023/03/29 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'aaa@aaa.aaa', 11);
commit;

-- insert into bmt_follow values (bmt_fw_seq.NEXTVAL, 'ddd@ddd.ddd', 'ccc@ccc.ccc', TO_DATE('2023/03/05 11:05:00', 'YYYY/MM/DD HH24:MI:SS'));
/*
select u.u_email, u.u_nick, u.u_profile, u.u_info, u.u_joindate, b.b_num, b.b_img, b.b_brand, b.b_model 
from bmt_user u, bmt_bic b 
where u.u_email = b.u_email ;

*/