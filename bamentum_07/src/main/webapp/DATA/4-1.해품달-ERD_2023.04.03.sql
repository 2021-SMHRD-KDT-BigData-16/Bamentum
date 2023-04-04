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
insert into bmt_user values ('Ho_won0806@bamentum.com',     'aaa', '��ȣ��', './DATA/ImgProfil/pf001.jpg', '���ȿ��� �Ǵٸ� ���̴��� �־�� ���� ������̵� ������ּ���',               ' ' , TO_DATE('2023/03/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('Kwon_Min1102@bamentum.com',   'aaa', '��ǹ�', './DATA/ImgProfil/pf002.jpg', '�����򱤿��� ������Ÿ�� ��ƹ����Դϴ�',                              ' ' , TO_DATE('2023/03/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Sohyun0519@bamentum.com',     'aaa', '������', './DATA/ImgProfil/pf003.jpg', '���ֿ��� ������Ÿ�� ����ߴ�ϴ�v',                                 ' ' , TO_DATE('2023/03/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('KIHYUN0928@bamentum.com',     'aaa', '�Ǳ���', './DATA/ImgProfil/pf004.jpg', '�Ǳ����� �����ŷ� ������ϴ� ���� �������Դϴ�',                         ' ' , TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Young_Min0531@bamentum.com',  'aaa', '�⿵��', './DATA/ImgProfil/pf005.png', 'û�㵿���� �����ŷ� ������ϴ� CEO ! ',                            ' ' , TO_DATE('2023/03/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Ha_Eun0103@bamentum.com',     'aaa', '������', './DATA/ImgProfil/pf006.jpg', '������ �̳� �����Դϴ�~ �ߺ�Ź�帳�ϴ�',                             ' ' , TO_DATE('2023/03/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Kyungsoo0723@bamentum.com',   'aaa', '�����', './DATA/ImgProfil/pf007.jpg', 'Ŭ���ְ̹� �����ŷ� �ڱ����!', ' ' , TO_DATE('2023/03/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Da-gyeong0711@bamentum.com',  'aaa', '��ٰ�', './DATA/ImgProfil/pf008.png', '������ �����������Դϴ�! �ߺ�Ź�帳�ϴ�!', ' ' , TO_DATE('2023/03/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Hyeong_sun0331@bamentum.com', 'aaa', '������', './DATA/ImgProfil/pf009.jpg', '���̽��Ͱ��� �����ŷ� ������ϴ� ���Դϴ�', ' ' , TO_DATE('2023/03/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Mi_yeon0602@bamentum.com',    'aaa', '�ȹ̿�', './DATA/ImgProfil/pf010.jpg', '�����ŷ� �ؿܿ���ٴϴ� ���̿��� ���������ؿ�!', ' ' , TO_DATE('2023/03/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Sangjae0604@bamentum.com',    'aaa', '������', './DATA/ImgProfil/pf011.jpg', '������ �����Ͼ� ������ �ϰ� �ִ� ���̴��Դϴ�!', ' ' , TO_DATE('2023/03/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Jung_Hyun0421@bamentum.com',  'aaa', '������', './DATA/ImgProfil/pf012.jpg', '��������ȴ�,�����ٴϱ�ȴ�,�����ϱ�ȴ�! �����ɼ��� ��������!', ' ' , TO_DATE('2023/03/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Semi1108@bamentum.com',       'aaa', '�̼���', './DATA/ImgProfil/pf013.jpg', '�����ŷ� �츮���� ���俩�����̿���~', ' ' , TO_DATE('2023/03/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('JiKang1010@bamentum.com',     'aaa', '������', './DATA/ImgProfil/pf014.png', '�����ŷ� ����Ž�����Դϴ� �ȳ�', ' ' , TO_DATE('2023/03/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ESOO0710@bamentum.com',       'aaa', '���̼�', './DATA/ImgProfil/pf015.jpg', '������ ������ ������ �� �ִµ�? ���� �ٸ�����', ' ' , TO_DATE('2023/03/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Young-rae0618@bamentum.com',  'aaa', '�ֿ���', './DATA/ImgProfil/pf016.jpg', '������ �����ű��� ��ô�Ѵ�! �����ű� �ڽ� ��õ�� ������', ' ' , TO_DATE('2023/03/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('JunYong0112@bamentum.com',    'aaa', '���ؿ�', './DATA/ImgProfil/pf017.jpg', '������ ȭ���� ���� �°����� ���Բ� ������ Ÿ�� �ֽ��ϴ�', ' ' , TO_DATE('2023/03/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('zipgalle1116@bamentum.com',   'aaa', '�ֱ�ȣ', './DATA/ImgProfil/pf018.jpg', '�ؿܿ��� �����ϴ� �߿� �����ŷ� ����ٴϴ� �̽��͸����Դϴ�', ' ' , TO_DATE('2023/03/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('SeongGyu0407@bamentum.com',   'aaa', '�Ѽ���', './DATA/ImgProfil/pf019.jpg', '������� ���̿� ȸ�� �ٴϰ� �ִ� �ѿ������Դϴ٤�����', ' ' , TO_DATE('2023/03/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Yeonwoo0806@bamentum.com',    'aaa', '�迬��', './DATA/ImgProfil/pf020.jpg', '����������,�Ѿ����,������,���������! ���� ������ ������ �������ŷ�! ', ' ' , TO_DATE('2023/03/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;

insert into bmt_user values ('aaa@aaa.aaa',    'aaa', '������', './DATA/ImgProfil/img058.jpg', '����������,�Ѿ����,������,���������! ���� ������ ������ �������ŷ�! ', ' ' , TO_DATE('2023/03/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('eee@eee.eee',    'eee', '������', './DATA/ImgProfil/img058.jpg', '����������,�Ѿ����,������,���������! ���� ������ ������ �������ŷ�! ', ' ' , TO_DATE('2023/03/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;

commit;


insert into bmt_post values (10001, 'f', '��õ�� ���� ���̵�',                   '?���� �߰� �ٹ��� ���� �� �������� �� ��õ�� ���ͺ�ġ�� ���̵� �ϰ� �Խ��� ��<br> <br> ���� �����̴� �� �ٳ������ ��??', './DATA/PostImage/img001.jpeg', TO_DATE('2023/03/29 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com', 11);
insert into bmt_post values (10002, 'f', 'XC�ϵ����Ϸ� ���� ����� �̱� ���̵� �ı�',   '�Թ����� 3�� �� �� ������<br> <br>�̱۶��̵� �ʹ� ��մ� �� �����ϴ�.', './DATA/PostImage/img002.jpg', TO_DATE('2023/03/27 08:12:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ho_won0806@bamentum.com', 12);
insert into bmt_post values (10003, 'f', '�����Ÿ� Ÿ�� �Ǵ� ����~~~~!!!',         ' �����Ÿ� Ÿ�� �Ǵ� ����~~~~~!!! <br><br>�� ȣ���ϴ� ǳ���� ��ٸ��ٴ�,,,,,,,,', './DATA/PostImage/img003.jpg', TO_DATE('2023/03/24 21:54:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kwon_Min1102@bamentum.com', 13);
insert into bmt_post values (10004, 'f', '÷���� ���� ������~',                  '������ �ʹ� ���׿�<br>������ ����.�ٸ�  �԰�Դµ� �� ���ƿ�~ <br> ���ɵ鵵 �� �̻Ѱ�@@ <br> 5�޸��� ſ���� 30k�Դµ��� ��.�� �ٶ����ϴٿ��� �ʱ�ȭ?����', './DATA/PostImage/img004.jpg', TO_DATE('2023/03/29 15:10:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com', 14);
insert into bmt_post values (10005, 'f', 'ģ�� �����ſ� ��������',                 '�б���忡�� �㿡 �۷���� �����Ÿ� �ѹ��� ������ ���� <br><br>�����ϴ°͵��� ���� ������ �����׿�!', './DATA/PostImage/img005.jpg', TO_DATE('2023/03/11 23:52:00', 'YYYY/MM/DD HH24:MI:SS'), 'KIHYUN0928@bamentum.com', 15);
insert into bmt_post values (10006, 'f', '���� �ظ��̴ٸ� ������',                 '���� ��ٱ� ���� <br><br>�� �� �� �� ���̿Ծ��^^', './DATA/PostImage/img006.jpg', TO_DATE('2023/03/14 18:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com', 16);
insert into bmt_post values (10007, 'f', '�ƶ� �κζ��̵� ���� ���̳׿�',            '?���������� ������ �������� ���̵� ���Դ���<br>���� �����ֳ׿�~ <br>û�󿡼� ������ �޸��� �Գ׿�~ <br>���������� �ܹ��� �ϳ� �԰�, �ƹ̳����Ż�� ������ �����ϴ� ���׿� ��', './DATA/PostImage/img007.jpg', TO_DATE('2023/03/04 14:56:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ha_Eun0103@bamentum.com', 17);
insert into bmt_post values (10008, 'f', '[����] ���޻� ���̵�',                 '��Ÿ�� ������ ���� ������ ������ �����մϴ� ���� ���� ��ȣ���� ��ġ�ִ� �����̿��� <br>������ Ǯ���� ����� �۵��� ���� �ö���� �ֳ׿�  <br>���ο�, ��濡 ���� ���̴����� ���������� <br>������ ����ϰ� �纸�ϸ鼭 ������ ����� ���̵��� �Ͻñ� �ٶ��ϴ� ', './DATA/PostImage/img008.jpeg', TO_DATE('2023/02/27 20:31:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kyungsoo0723@bamentum.com', 18);
insert into bmt_post values (10009, 'f', '������ ������ ��',                     '���� �ѹ��� ���鼭 <br>�������� �ٸ����� �ٴϴ� ��� <br>���� ����� �ӹ��� �ֽ��ϴ�', './DATA/PostImage/img009.jpg', TO_DATE('2023/02/21 16:41:00', 'YYYY/MM/DD HH24:MI:SS'), 'Da-gyeong0711@bamentum.com', 19);
insert into bmt_post values (10010, 'f', '������ ���̵� ����',                   '�λ���̵��� �ͼ� �λ��񿡼� �� ����ģ����� <br>�λ� ����� �������� �ѹ� ���ҽ��ϴ�.', './DATA/PostImage/img010.jpg', TO_DATE('2023/02/08 20:24:00', 'YYYY/MM/DD HH24:MI:SS'), 'Hyeong_sun0331@bamentum.com', 10);
insert into bmt_post values (10011, 'f', '[����] ��ǳ ���̵�',                   '�ٶ� ���п� ����� ���������� �ҽ��ϰ� �����Ű� ��û�� ������ ���� �Ҿ����ϴ� <br>��ǳ�� �հ� �������� �ڵ��� �� ������� ���� �η��� �������� �����߽��ϴ� <br>��Ż�� �ο���� ������ ȭ����! ���ĺ��ϴ� ', './DATA/PostImage/img011.jpeg', TO_DATE('2023/02/20 20:33:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com', 11);
insert into bmt_post values (10012, 'f', '[4�밭��]���갭 ���� �ı�(3/26~27)',     '�۳� ���������� ���� ���갭���ָ� �ϰ� �Խ��ϴ�! <br>�������� Ȧ�� �ٳ�Դµ�, <br>���갭�� �����ű����ϰ� 4�ָ��� ���� �������԰� �Բ� ���� ������ 1��2�Ϸ� �ٳ�Ծ��. ', './DATA/PostImage/img012.jpg', TO_DATE('2023/03/29 14:28:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sangjae0604@bamentum.com', 12);
insert into bmt_post values (10013, 'f', '������ �Ѱ��ٳ�Ծ��.',                 '�������ִ� �ϰ� ������ �ѹ��� ���Ƽ� �� ������ �ȵǰ�  <br>�������� �غ��� ����ϰ� ���ݾ� ��õ���� �ڸ��Դϴ�. <br>ū �����԰� ����ġ��� ���������� �������������ͱ��� �ٳ�Խ��ϴ�. ', './DATA/PostImage/img013.jpg', TO_DATE('2023/03/25 20:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Jung_Hyun0421@bamentum.com', 13);
insert into bmt_post values (10014, 'f', 'Byplorer ����� 68ȸ',               '������ �����극�� 200�� �ٳ�Խ��ϴ�. <br>�극������ ������ ���� ȸ���е��� ������ �ϴ� �����̱⵵ �մϴ�. <br>������ �����̰� �ؾߵɰ��� ����Ե� �󱼵��� ���� <br>�׷��� ������ ������ �������� �������� ��°��� ���� ���̵����� �� �ູ���� �����ϴ�.^^', './DATA/PostImage/img014.jpg', TO_DATE('2023/03/01 20:19:00', 'YYYY/MM/DD HH24:MI:SS'), 'Semi1108@bamentum.com', 14);
insert into bmt_post values (10015, 'f', '�Խ������ı�',                        '�����ŷδ� ó�������� �Ϻ������̿��µ� <br>���� �����Ҿ ������ ����⿡ �Ǿ ������ <br>��ȹ���Դϴ�', './DATA/PostImage/img015.jpeg', TO_DATE('2023/03/15 21:26:00', 'YYYY/MM/DD HH24:MI:SS'), 'JiKang1010@bamentum.com', 15);
insert into bmt_post values (10016, 'f', '���� ���̵�',                        '���޶� ���ϴ� ���鵵 ���� ���� ������ �������� <br>������ ����� �������׿� <br>�� 10Ű�������� �浵 �����ϰ� <br>�ָ��� �ð� �������� ��κ� ����� �ɴϴ� ����', './DATA/PostImage/img016.jpeg', TO_DATE('2022/05/03 17:53:00', 'YYYY/MM/DD HH24:MI:SS'), 'ESOO0710@bamentum.com', 16);
insert into bmt_post values (10017, 'f', '���� �����ſ��� ',                     '���� ������ �ٸ� ǳ���� ��������. <br>���ϰ� ��� ������� ȣ���� ƴ���� ǳ�¹������ �ﵵ ���� ���´�. <br>�׸��� �ݴ��� ���¸������� �����ǰ��Ӽ� �����庮���� <br>������ ����� ��� ���θ��� �ִ�.', './DATA/PostImage/img017.jpg', TO_DATE('2022/07/31 15:19:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young-rae0618@bamentum.com', 17);
insert into bmt_post values (10018, 'f', '��������� �����ó��ѹ��� �ϰ� �Խ��ϴ�!',     '������ �����ŵ��ΰ� �ʹ� �ߵǾ��ְ� <br>��ȣ�� �����־ �����ϰ� Ÿ��ٴ� �� �־����!', './DATA/PostImage/img018.jpg', TO_DATE('2022/04/23 00:17:00', 'YYYY/MM/DD HH24:MI:SS'), 'JunYong0112@bamentum.com', 18);
insert into bmt_post values (10019, 'f', '������ ������ �������̱� �������̳׿�. ',      '���� ��� ������ ���ΰ� �ִٴ°� �� �η����ϴ�.', './DATA/PostImage/img019.png', TO_DATE('2022/04/09 23:03:00', 'YYYY/MM/DD HH24:MI:SS'), 'zipgalle1116@bamentum.com', 19);
insert into bmt_post values (10020, 'f', '�±� �ڴ����� ������ �Ұ��մϴ� -Ʈ����-',     '�̷��� ������� ��ŷ ��ŷ���ָ� ������ ���� ������...����Ʈ�� ����.. <br>�̷��� ������ �ٸ�(?)���� �����ϰ� �˴ϴ�. ', './DATA/PostImage/img020.jpg', TO_DATE('2022/01/16 14:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'SeongGyu0407@bamentum.com', 10);

insert into bmt_post values (10021, 'f', '���� ���ɶ��̵�', '���� 74�� �ǽ� ŷ��¯ ü���� �������̽� �ƹ����� ���� ���� �ö󰡴� <br>�濡 ���� ����� �ϻ��ϴ� �濡 ���� ���ý��ϴ� ��� ����ϼ��� ~', './DATA/PostImage/img021.jpg', TO_DATE('2023/03/31 02:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com', 10);
insert into bmt_post values (10022, 'f', '�븸�� �ӽ��ϴ�', '?���� ��ǳ������ �����ŵ� ���׿�(���ÿ�)<br>��Ư�ؼ� �����帮�� �;��<br>�븸���� �����ſ�ǰ ���簡�� �ҹ�����<br>��õ�� ��Ź�����', './DATA/PostImage/img022.jpg', TO_DATE('2023/03/30 22:58:00', 'YYYY/MM/DD HH24:MI:SS'), 'zipgalle1116@bamentum.com', 10);
insert into bmt_post values (10023, 'f', '��Ʈ�� Phu Quoc ��', '?��Ʈ�� ȣġ�ο� ��� �ִ� �����Դϴ�.   ^^<br>�ݿ��� ���� Phu Quoc ���� �����ؼ�, �Ͽ��Ͽ� ȣġ������ �����ϴ� �����̾����ϴ�. <br>����� ������ �����Ÿ� ���ȴµ�, �Ͽ��Ͽ� �����ż��� �������� �ʾƼ�... ����� ���� 5�ñ��� �ݳ��ؾ߸� �߳׿�. <br>�ᱹ �ð��� �Ѱܼ� ���� ���ݸ� �ѷ� ���ҽ��ϴ� ~ ', './DATA/PostImage/img023.jpg', TO_DATE('2023/03/22 09:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'Hyeong_sun0331@bamentum.com', 10);
insert into bmt_post values (10024, 'f', '[����]Grosse Scheidegg ���̵�', '���� �������� ������ ���� �¿��ϴ� ���̶��� �ٽ��ѹ� �������ϴ�. <br>������ ���������� �� �������ѵ� ȭâ�� ���� �������� ��뷡�� ���� ������ �׷� ���̳׿�.  ', './DATA/PostImage/img024.jpg', TO_DATE('2023/02/10 17:23:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com', 10);
insert into bmt_post values (10025, 'f', '��ȭ�� ������ ������ �����ű� ����', '�̹� ������ ������ ������ ������ �־��µ���.<br>�������� ���󰡸� #�����ȭ������ #�Ƹ��ٿ�� #��ȭ�Ӱ�ƴ��ѽð�ǳ�� ���� ��� ������ �� �ִ� �ູ�� �ð����̾����ϴ�.<br>�ٸ�, ������ �������� ���� �¹ٶ��� �ӵ��� ����� ������, �Ƹ��ٿ� ��ġ�� ���� ���� ���� �������.<br>������ ��û�� �ڿ��� ����� �������� ���� �;� ��۵� ���� �޷Ⱦ��...<br>��, ��, �ϴ�, ��, �ܿ��ῡ�� ��� ���� �����ϴ� ������, ���, ����...<br>��ΰ� �ʹ� �Ƹ���� �Ƹ��ٿ����..<br>', './DATA/PostImage/img025.jpg', TO_DATE('2023/03/19 18:43:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com',    10);
insert into bmt_post values (10026, 'f', '[������]���� �űݵ�', '���� �ڶ������ٳ�?<br>7���� �ϳ� �� ���̹� ���� ���ϴ�.<br>�̷� ���ǵ� ���� ������ ���ϴ�.', './DATA/PostImage/img026.jpg', TO_DATE('2023/03/11 20:31:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ho_won0806@bamentum.com',     10);
insert into bmt_post values (10027, 'f', 'ȣ���� �ٴٰ� �����°�... ȭ��ȣ �ѹ��� ��ȯ�ڽ�', '�� 54km 3�ð� 30�� �ɸ��� �ϳ׿�', './DATA/PostImage/img027.jpg', TO_DATE('2023/03/08 17:31:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kwon_Min1102@bamentum.com',   10);
insert into bmt_post values (10028, 'f', '�������� ������ �����մϴ�.', 'ģ���� �Բ� ���������� ���������� 633 ���� ���� ������ �Ͽ����ϴ�.<br>���������� ������ �̾����� �ڵ��� ���� ������׿�.<br>���ο����� ���� �ε������ſ� �����Ǿ �׷���,,,<br>�ڵ��� ���� ������ �Ƿε��� ���� ���̰� �����µ� ���� �������µ� �մϴ�.<br>������ ������ ������ ���� �����Ÿ� ��Ⱓ ���ϰ� �����Դ� �� �ڽ��� �ٽ����� �ٽ� ��ܺ��� �մϴ�.<br>����� ��� ȸ���Ե��� �ȶ� ����帳�ϴ�.<br>�����մϴ�.<br>', './DATA/PostImage/img028.jpg', TO_DATE('2023/03/10 21:36:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com',     10);
insert into bmt_post values (10029, 'f', '���ư� ������ Ÿ�� 2ź', '����� ���� �Ϸ� �ϰ��� 7�ú��� 4��<br>Ư�� �ݿ����� 7�ú��� 2�ÿ� �����ϴ�.<br>��ü �󸶳� ���������� ����.<br>�׸�ŭ �� �͵� ���� ����� ������ ��û������ Ư�� �㿡�� ���ƴٴϴ� ����� ���� ������<br>��κ� �Ϸ縦 ���� �����ϰ� ���︶ġ�׿�<br>�ָ��� �ó��� �ؾȵ��θ� ���ԵǸ� ��� �Ǵ� ������ Ÿ�� ������� ��û �����ϴ�.<br>Ư���� �����Ŵ� ���� ���� ���Ͻ� �Ǳ� ������ �ó��� ���ؼ��� <br>��ȸ�� �����ϰ� ������ ���뵵�ε� ������ ������ �ϰ� �ֽ��ϴ� <br>', './DATA/PostImage/img029.jpg', TO_DATE('2022/04/24 15:16:00', 'YYYY/MM/DD HH24:MI:SS'), 'KIHYUN0928@bamentum.com',     10);
insert into bmt_post values (10030, 'f', '��Ʈ�� / ���̳� -> ��¯', '��Ʈ���� �����ϴ� �����Դϴ�. ', './DATA/PostImage/img030.jpg', TO_DATE('2022/09/10 09:37:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com',  10);
insert into bmt_post values (10031, 'f', 'į����ƿ����� ������ ��Ȱ', 'į����� ��Ȱ���� ���� ��ȩ ���̳� �������ϴ�...ó�� mtb�� Ÿ�� ������ �ε�� �ٲ��� �� 5���� �ƽ��ϴ�. <br><br>�ָ��̸� �̰� ���� ���ƴٴϴ°� ���� ���� ū �ູ�Դϴ�. <br><br>�ֱ� į����Ƶ� ������ �α��� �����ϴ� �߼��� ���� �������� ���̵��� ���� ������� ���� ���̰� �մϴ�.<br><br>��ſ� �Ϸ� ��������^^<br>', './DATA/PostImage/img031.jpg', TO_DATE('2022/07/10 11:35:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ha_Eun0103@bamentum.com',     10);
insert into bmt_post values (10032, 'f', '���� ���̵�', '�Ϻ��� ���� ���� �Ⱓ���� ������� 10���� Ȥ�� 3���޸� ������ �ִ� �Ⱓ�Դϴ�<br>�Ŀ����͵� �ް� ù �ְ����̵��ٳ�Խ��ϵ�<br>', './DATA/PostImage/img032.jpeg', TO_DATE('2022/05/03 17:53:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kyungsoo0723@bamentum.com',   10);
insert into bmt_post values (10033, 'f', '������ ������ ����, Passo dello Stelvio 2�� ���', '�ָ��� ���ں�� ������ ���Ƽ� ���ں���� �ٽ� �ٳ�Խ��ϴ�. <br>���ں���� 11���̸� ���� �ݱ� ������ ������ �� �ѹ� �ٳ�;��� �����ߴµ�,<br> ���ڱ� ������ Ǯ���� �ٳ�Խ��ϴ� ����<br>', './DATA/PostImage/img033.jpg', TO_DATE('2021/10/26 20:32:00', 'YYYY/MM/DD HH24:MI:SS'), 'Da-gyeong0711@bamentum.com',  10);
insert into bmt_post values (10034, 'f', '�������� ���, ������� �����ŷ� ����ϴ�.', 'ù��° ���̵����� �߰��� ���� �߸���� ���ο��� ���ٸ� ������ ���� <br>�ܿ�ܿ� ����� ���� �ö󰬰�,<br>�ι�° ���̵����� �� ���� �ʰ� ���ٵ� ���� <br>(���� ��û���� ���� ���� �޽��� ���߽��ϴ�) ����� ������� �ö󰬳׿�. <br>���� ���� ģ���� �Ѹ��� ������ �����ڴٸ� ������ �� �ȳ���� ���� ������ ���Ƚ��ϴ�. <br>', './DATA/PostImage/img034.jpg', TO_DATE('2021/09/16 21:28:00', 'YYYY/MM/DD HH24:MI:SS'), 'Hyeong_sun0331@bamentum.com', 10);
insert into bmt_post values (10035, 'f', '������ �ɶ��� ��ȥ������̵�', '2���� ��ȥ������ ���������� �ε带 ì�ܰ��� �����ϰ�<br>�ڷγ��� ������ ���ε�� �Բ� �ؿܶ��̵��� ��ȹ�߿� �ֽ��ϴ�<br>', './DATA/PostImage/img035.jpg', TO_DATE('2021/08/16 19:57:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com',    10);
insert into bmt_post values (10036, 'f', '���Ǵ� ��� �强����-Ȳ�氭 �ҽ�', '÷��-��4�Ÿ�-�����-��꼭��-������-��ǰ�-<br>Ȳ��뱳-���汳-��������-Ǫ����cc-�ɼ�-��â  37km<br>��ٱ濡 �� ���ҽ��� �ø��ϴ�.<br>', './DATA/PostImage/img036.jpg', TO_DATE('2023/03/24 10:14:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sangjae0604@bamentum.com',    10);
insert into bmt_post values (10037, 'f', '���� ������غ� ������', '������ ���������־<br>���ݽ���� �غ� �������� ����..<br>�� ���ص� ��Ż�ϰ� �޷����� ��<br>', './DATA/PostImage/img037.jpeg', TO_DATE('2023/03/19 09:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'Jung_Hyun0421@bamentum.com',  10);
insert into bmt_post values (10038, 'f', '���갭 �ϱ��Ͽ��� �������� ���� ���̵�', '���� ó������ ¡�Ÿ� �����̰� ���ֱ��� ����� ó�� ���� �غó׿�.<br>���갭 �ϱ��Ͽ��� ������ �����븦 ���� �׻꺸�� ���̺��� ������<br>�͹̳ο� ġ�� �������� �������� ���� ��¡ �� 5�ð��� �Ѱ� ������ <br>���̵��߳׿�. �ѵ��ϳ׿�.<br>�������� ���� ���� �ѹ� ������ ������<br>', './DATA/PostImage/img038.jpg', TO_DATE('2023/03/11 18:10:00', 'YYYY/MM/DD HH24:MI:SS'), 'Semi1108@bamentum.com',       10);
insert into bmt_post values (10039, 'f', '�� Ǯ�� �迡 �������� ���ֱ��� ���̵��� ���ý��ϴ�', '���� ���µ� ���� �ش� �ٶ��� ���� ���� �ǳ׿�. <br>3�� �� ���� �����ؼ� ���� �����ϴ� 8�ð� �Ǵ�����. ������ �ذ� ���� ����ϴ�...', './DATA/PostImage/img039.jpg', TO_DATE('2023/03/01 18:46:00', 'YYYY/MM/DD HH24:MI:SS'), 'JiKang1010@bamentum.com',     10);
insert into bmt_post values (10040, 'f', '�强Ȳ�氭 �����ű� ���籸���ȳ�', '�强Ȳ�氭�����ű��� õ���·θ� ���� ������ �����߱⿡<br>���� ��縦 �����ϴ�. ������ û������ ������ �����̰�<br>�Ӱ�->���汳����  �������·η� �����ϸ� �����ϰ� �޸���<br>������ ���׿� �ٸ��� ���� �ϰ��ȵ��Ͽ� �� ����ɰ� �����ϴ�.<br>', './DATA/PostImage/img040.jpg', TO_DATE('2023/02/13 12:43:00', 'YYYY/MM/DD HH24:MI:SS'), 'ESOO0710@bamentum.com',       10);

insert into bmt_post values (10041, 'f', '������ ����������', '��ħ6�� ���̵��� ��׿�.', './DATA/PostImage/img041.jpg', TO_DATE('2023/02/09 11:42:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kwon_Min1102@bamentum.com',   10);
insert into bmt_post values (10042, 'f', '���Ѱ� �����ű� ������ ', '���� ���� 20 % �� ��׿� ..', './DATA/PostImage/img042.jpg', TO_DATE('2023/03/31 09:08:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com',     10);
insert into bmt_post values (10043, 'f', '����濡 �ʱ��� �þ���', '�ʱ��� �þ��� 3�� ���� ���� �߸����ǰ� �ߴµ�<br>������ �� ����ֳ׿�<br>���� Ű��� �����ǰ���?<br>������ ������ ���ͼ� �׷��� ��û �Ϳ�����<br>������ �־����� �ְ� ���� �����ο�^^<br>', './DATA/PostImage/img043.jpeg', TO_DATE('2023/03/29 22:36:00', 'YYYY/MM/DD HH24:MI:SS'), 'KIHYUN0928@bamentum.com',     10);
insert into bmt_post values (10044, 'f', '�������ֱ濡�� ��巯���� �� ����~', '���� �������ֱ� �������������Դϴ�,,,<br>��� �Դٰ��� ����,,, <br>���� ������, �߶󿡼� ���� ��ȣ���� �������Դϴ�^^<br>', './DATA/PostImage/img044.jpg', TO_DATE('2023/03/26 10:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com',  10);
insert into bmt_post values (10045, 'f', '���� ��õ ���ɸ���', '���̵��� ģ���鸸���� ��������������<br>������ Ȱ¦ ?? ??<br>������ ���� �ɸ��� �ö������<br>������ ���浵�ϰ� ���̵�, �ɳ��̱��� ���ϰ� ����', './DATA/PostImage/img045.jpg', TO_DATE('2023/03/26 17:56:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ha_Eun0103@bamentum.com',     10);
insert into bmt_post values (10046, 'f', '�뱸 �޼����������н��� ������ �����߳׿�', '�ȳ��ϼ��� �ֱ� �߰�� ������ �Թ��� �տ��ʺ��Դϴ�??<br>���� ȥ�� ���� �ٳ�°��� �ʹ� ��������~', './DATA/PostImage/img046.jpg', TO_DATE('2023/03/22 21:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kyungsoo0723@bamentum.com',   10);
insert into bmt_post values (10047, 'f', '������ ��� ��� �ٳ�Ծ��', '�̹��� ������ ��� ��� �ٳ�Ծ��  <br>���󿡼� ���� ǳ�� ���� �ְ�׿�  <br>���� ��� �ʺ����� õõ�� ��ȣ�� �ϸ鼭 �ö󰡴� ���ϱ� <br>�̸��� ��굵 �ٴϴ� ���� �ͽ��ϴ� <br>���ų������׷��� ���θ�� �ϱ淡 ����ķ ��а� �ִµ� �̷��� ��Գ׿�  <br>���� �����鼭 ���ƴٴϴµ� ȭ���� ��¥ �ְ��� <br>������ ��⵵ ���� ��鸲 ��� ���׿�  <br>����ǳ�� ���� ������ ���� �� �� ���ߺ��߰ڽ��ϴ�  <br>', './DATA/PostImage/img047.jpg', TO_DATE('2023/03/20 21:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'Da-gyeong0711@bamentum.com',  10);
insert into bmt_post values (10048, 'f', '���� �ظ��̴ٸ� ������', '���� ��ٱ� ����<br>�� �� �� �� ���̿Ծ��^^<br>', './DATA/PostImage/img048.jpg', TO_DATE('2023/03/14 14:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'Hyeong_sun0331@bamentum.com', 10);
insert into bmt_post values (10049, 'f', '������ ���ϴ뱳', '������ ���ϵ��θ� �մ� �뱳 ������<br><br>������ ������ ����� 2023 ����������<br><br>�������� ���� ��� ���� ����<br>', './DATA/PostImage/img049.jpg', TO_DATE('2023/03/13 09:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com',    10);
insert into bmt_post values (10050, 'f', 'ģ���� �պ�ġ ���̵�', '�պ�ġ �ױ� ������Ʈ�� �ö� ������ ���ó׿�<br>�ڴ��� õ���̶�� �̰����� <br>�� ���� ������ õ���� �����ƴϴ�.<br>���� �������� �ҽ����ϰڽ��ϴ�.<br>�׷� ������ �ȶ�, ����Ͻñ���~<br>', './DATA/PostImage/img050.jpg', TO_DATE('2023/02/26 16:46:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sangjae0604@bamentum.com',    10);
insert into bmt_post values (10051, 'f', '�ι��Ӹ�', '�Բ��� ������ ���ε��� ���׿�', './DATA/PostImage/img051.jpg', TO_DATE('2023/02/21 06:49:00', 'YYYY/MM/DD HH24:MI:SS'), 'Jung_Hyun0421@bamentum.com',  10);
insert into bmt_post values (10052, 'f', '���� ��~~~', '�������� ô�߰����ǰ� �ݳ⸸�� �߿ܶ��̵�~~ <br>10Ű�� �Ծ ������ ���̰� �ȵ��� ����԰� ���ƴٴϴµ� �����Ӱ� ���׿�<br>ü���� �����ʱ�ȭ�Ǽ� 20Ű�θ� Ÿ�� ����..<br>', './DATA/PostImage/img052.jpg', TO_DATE('2023/02/06 09:24:00', 'YYYY/MM/DD HH24:MI:SS'), 'Semi1108@bamentum.com',       10);
insert into bmt_post values (10053, 'f', '�����ī�� ������ Ÿ�� �ֽ��ϴ�', '������ �λ��׿��� ��Ʋȣ Ÿ�� �ǳʿԽ��ϴ� <br>�����ŷ� �ǳ� �����̴� �Ϻ��� �Ѵ޿� �ѹ��� �ö� ���� �ѹ��� �Ϸ��� <br>����ϱ⵵ �ϰ� ���� ������������ �ʹ� ��μ� �����ᳪ �װų� ����ؼ� <br>�ѹ� �ư�� �ôµ� ���׿� ����<br>', './DATA/PostImage/img053.jpg', TO_DATE('2023/02/16 08:39:00', 'YYYY/MM/DD HH24:MI:SS'), 'JiKang1010@bamentum.com',     10);
insert into bmt_post values (10054, 'f', '�Ϻ� �����ī�� �ϸ������� �ϸ���ȣ�� ����', '�Ϻ� 7��1���� �ϳ��� �ϸ���ġ��� �ϸ���ȣ���� ���� �ڽ��� �ٳ�Խ��ϴ�<br>���� ��ģ�� ����� ���� �ϴ��� �����ߴµ�<br>�ٶ���.... �ִ�ǳ�� 32ų��..������ ��ǳ��<br>������ ������ ���������̸� ����������<br>�����Ű� �䵿�� Ĩ�ϴ�<br>���ĸ� �������� �������µ� �����<br>��µ� ������� �����ϴ�<br>��ǳ�� �ο�� ������ ��ȯ�Ͽ� ��쳪���� �Ƿ�Ǯ��<br>�ܿ� ���� �Գ׿�...<br>�׳� ��ǳ�̶� ���������� ����������...<br><br>', './DATA/PostImage/img054.jpeg', TO_DATE('2021/05/02 18:38:00', 'YYYY/MM/DD HH24:MI:SS'), 'ESOO0710@bamentum.com',       10);
insert into bmt_post values (10055, 'f', '�ָ� ���� ������', '������ �ٶ� ���� ���� ������ ���� �����Ÿ� ��ܺ��ƿ�<br>Ķ�����Ͼ� ���׷��� ����....', './DATA/PostImage/img055.jpg', TO_DATE('2021/03/22 08:14:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young-rae0618@bamentum.com',  10);
insert into bmt_post values (10056, 'f', '�������� ������ �����ŵ�..', '���� �����ſ� ū ������ ����� �������µ�<br>���� �پ��� ������ �����ŵ��� �ִ��󱸿�<br>���� ���� ������ ������ �÷� ���ϴ� ^^;<br>', './DATA/PostImage/img056.jpg', TO_DATE('2023/03/24 20:08:00', 'YYYY/MM/DD HH24:MI:SS'), 'JunYong0112@bamentum.com',    10);
insert into bmt_post values (10057, 'f', '�ĸ� ������ ����', '���� ������ ���� �� ���� ������ �� ���� ��� �ֳ׿�. <br>���� ���� �Ϸ��� �������� �ؾ� �ϴ� �� �ƴѰ� �ؼ� ���� ��� �÷� ���ϴ�.<br> �����ſ� �������� ���� �ٴϴµ� ������ ����� ������ ���ϳ׿�.<br>', './DATA/PostImage/img057.jpg', TO_DATE('2023/03/22 18:06:00', 'YYYY/MM/DD HH24:MI:SS'), 'zipgalle1116@bamentum.com',   10);
insert into bmt_post values (10058, 'f', '������ ������ ����', '���ҵ��� �� üũ�ƿ��ϰ�, ������ ���� �����Ͽ� �ڵ����� �ư� ������ ���ι潺 �������� �̵��� �����ߴ�.<br>���� ���̵����ϰ� ����Tours �� �̵��ϴµ� ������ ���� �������� �ƽ��� ������...��Ǯ�� ���̵� �ѹ� �� �����Ѵ�.<br>�޽��� ��-�������� ������� �������� �� ��-�÷��� �αٱ��� �׳� �������� �ÿ��ϰ� ��Ҵ�. ��Ÿ�� ���� ...������ �� �������� �ִ� �� ������������<br>', './DATA/PostImage/img058.jpg', TO_DATE('2023/03/11 17:25:00', 'YYYY/MM/DD HH24:MI:SS'), 'SeongGyu0407@bamentum.com',   10);
insert into bmt_post values (10059, 'f', '���� ���̵�', '���� �޹��� ģ���� <br>���� ���̵�...<br>�ڽ��� ���ʱ������� �����ķ�������..<br>', './DATA/PostImage/img059.jpg', TO_DATE('2023/03/30 09:27:00', 'YYYY/MM/DD HH24:MI:SS'), 'Yeonwoo0806@bamentum.com',    10);
insert into bmt_post values (10060, 'f', '����� ����ϱ��?', '����� �Ѱ����� �Դϴ�', './DATA/PostImage/img060.jpg', TO_DATE('2023/03/30 15:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com',    10);



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

insert into bmt_bic values ('WSBC021015577T',        'Mi_yeon0602@bamentum.com',       './DATA/bic_num_img/bic_num/1-1.png',   '����ȶ������',  '����ȶ������ Ÿ�� SL6');
insert into bmt_bic values ('WTU189C0817T',          'Young_Min0531@bamentum.com',     './DATA/bic_num_img/bic_num/2-1.jpeg',  'Ʈ��',  'Ʈ�� ����7');
insert into bmt_bic values ('WTU190C7684T',          'Kyungsoo0723@bamentum.com',      './DATA/bic_num_img/bic_num/3-1.jpg',   'Ʈ��',  'Ʈ�� ���� 7');
insert into bmt_bic values ('WSBC001002294R',        'Sangjae0604@bamentum.com',       './DATA/bic_num_img/bic_num/4-1.jpg',   '�˷�',  '�˷� ������Ʈ 2019 ���ͻ簣 ����� ��');
insert into bmt_bic values ('STR23D25221070081T',    'Yeonwoo0806@bamentum.com',       './DATA/bic_num_img/bic_num/5-1.jpg',   '��ı',  '��ı ����Ʈ rc 30');
insert into bmt_bic values ('wto017ct0074m0207',     'Gyu_nam1211@bamentum.com',       './DATA/bic_num_img/bic_num/6-1.jpg',   'Ʈ��',  'Ʈ�� ����� sl6 18���');
insert into bmt_bic values ('JG22120672',            'SeongGyu0407@bamentum.com',      './DATA/bic_num_img/bic_num/7-2.jpg',   '�ܽ�źƾ',  '�ܽ�źƾ ������');
insert into bmt_bic values ('JMH220404156',          'Kwon_Min1102@bamentum.com',      './DATA/bic_num_img/bic_num/8-2.jpg',   'ƼƼīī',  'ƼƼīī �ö���Ʈ p8 v');
insert into bmt_bic values ('236325221900481',       'Sohyun0519@bamentum.com',        './DATA/bic_num_img/bic_num/9-1.jpeg',  '���ͺ���',  '���ͺ��� TX8 PRO');
insert into bmt_bic values ('B1A114504S WBK946971S', 'KIHYUN0928@bamentum.com',        './DATA/bic_num_img/bic_num/10-1.jpg',  '���Ű',  '���Ű �Ƹ��� ��ũ');
insert into bmt_bic values ('XD2112APOO31C',         'Ha_Eun0103@bamentum.com',        './DATA/bic_num_img/bic_num/11-1.jpg',  '���ĸ�',  '���ĸ� ���̽�6100');
insert into bmt_bic values ('AAAAA',                 'Da-gyeong0711@bamentum.com',     './DATA/bic_num_img/bic_num/12-1.jpg',  '��ı',  '��ı ������ 20');
insert into bmt_bic values ('WTU256XC0146T',         'Hyeong_sun0331@bamentum.com',    './DATA/bic_num_img/bic_num/13-1.jpg',  '�������3',  '�������3 5����');
insert into bmt_bic values ('IBDFSD17KA1732',        'Jung_Hyun0421@bamentum.com',     './DATA/bic_num_img/bic_num/14-1.jpg',  '����',  '���� 105 Ǯī�� �� �ε�');
insert into bmt_bic values ('BM22100830',            'Semi1108@bamentum.com',          './DATA/bic_num_img/bic_num/15-1.jpg',  '����',  '2023 ���� RCT ����24');
insert into bmt_bic values ('JMH201203868',          'JiKang1010@bamentum.com',        './DATA/bic_num_img/bic_num/16-1.jpg',  '����',  '���� ���彺�� 2.5D');
insert into bmt_bic values ('LK210330577',           'ESOO0710@bamentum.com',          './DATA/bic_num_img/bic_num/17-1.jpeg', '��Ÿī��',  '��Ÿī�� ���� MK5 (STACATO VENNUE MK5) 20��ġ');
insert into bmt_bic values ('AH20M 165918',          'Young-rae0618@bamentum.com',     './DATA/bic_num_img/bic_num/18-1.jpg',  '��Ÿī��',  '��Ÿī�� ���۳�� 650B');
insert into bmt_bic values ('Y5C05217',              'JunYong0112@bamentum.com',       './DATA/bic_num_img/bic_num/19-1.jpg',  '����Ʈ',  '����Ʈ �Ź� H27');
insert into bmt_bic values ('P19CE9110084',          'zipgalle1116@bamentum.com',      './DATA/bic_num_img/bic_num/20-1.jpg',  '����Ʈ��',  '����Ʈ�� 100 ��ũ');

commit;


insert into bmt_post values (10501, 'f', '��õ�� ���� ���̵�', '���� �߰� �ٹ��� ���� �� �������� �� ��õ�� ���ͺ�ġ�� ���̵� �ϰ� �Խ��� �� ���� �����̴� �� �ٳ������ ��??', './DATA/PostImage/img001.jpeg', TO_DATE('2023/03/29 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'aaa@aaa.aaa', 11);
insert into bmt_post values (10502, 'f', '[����] ��ǳ ���̵�', '�ٶ� ���п� ����� ���������� �ҽ��ϰ� �����Ű� ��û�� ������ ���� �Ҿ����ϴ� ', './DATA/PostImage/img002.jpg', TO_DATE('2023/03/29 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'aaa@aaa.aaa', 11);
insert into bmt_post values (10510, 'f', ' Ȥ�� XX��ó�� ������ �ΰ��ź�?? ', ' ���� �Ѱ� ��å ���ٰ� ���� Ÿ�� �����Ŷ� �Ȱ��� �����Ű� �ֱ淡 ������ ���� �־��µ���<br> ���� ���ָӴϲ��� ��ĥ���� ������ ������ �� ��Ÿ���ٰ� �Ͻô��󱸿�!! <br> Ȥ�� �ٸ��ҿ� �����ȣ ����Ͻź��̶�� �� �� ���� �����ֽ� �� ���Ƽ� �� �÷�����!! ', './DATA/PostImage/bamen003.jpg', TO_DATE('2023/04/02 15:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com',    10);
commit;

-- insert into bmt_follow values (bmt_fw_seq.NEXTVAL, 'ddd@ddd.ddd', 'ccc@ccc.ccc', TO_DATE('2023/03/05 11:05:00', 'YYYY/MM/DD HH24:MI:SS'));
/*
select u.u_email, u.u_nick, u.u_profile, u.u_info, u.u_joindate, b.b_num, b.b_img, b.b_brand, b.b_model 
from bmt_user u, bmt_bic b 
where u.u_email = b.u_email ;

*/







insert into bmt_user values ('bbb@bamentum.com', 'aaa', 'ȫ�Ƹ�', './DATA/ImgProfil/pf000.jpg', '�ȳ��ϼ��� �Ƹ��ٿ� �Ƹ��Դϴ�', ' ' , TO_DATE('2023/03/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ccc@bamentum.com', 'aaa', '���̽�', './DATA/ImgProfil/pf001.jpg', '�����Ÿ� ����� �� �ȵƾ��',               ' ' , TO_DATE('2023/03/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('ddd@bamentum.com', 'aaa', '���̷�', './DATA/ImgProfil/pf002.jpg', '�����ŷɷ� 4���� �����Դϴ�',                              ' ' , TO_DATE('2023/03/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('zzz@bamentum.com', 'aaa', '�ȼ���', './DATA/ImgProfil/pf003.jpg', '�����ŷ� ���̾�Ʈ ȿ���� �� �� �������?',                                 ' ' , TO_DATE('2023/03/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('fff@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf004.jpg', '���� ��õ�ڽ��� ���ֵ� �ѷ����Դϴ�.',                         ' ' , TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ggg@bamentum.com', 'aaa', '�ճ���', './DATA/ImgProfil/pf005.jpg', '������ �븮���� ��ϴ� CEO�Դϴ�',                            ' ' , TO_DATE('2023/03/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('hhh@bamentum.com', 'aaa', '�ڻ��', './DATA/ImgProfil/pf006.jpg', '�ڻ���Դϴ� ',                             ' ' , TO_DATE('2023/03/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('iii@bamentum.com', 'aaa', 'ŹǪ��', './DATA/ImgProfil/pf007.jpg', 'ŹǪ���Դϴ�!', ' ' , TO_DATE('2023/02/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('jjj@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf008.jpg', '�����Դϴ�!', ' ' , TO_DATE('2023/02/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('kkk@bamentum.com', 'aaa', '���Ϸ�', './DATA/ImgProfil/pf009.jpg', '���Ϸ��Դϴ�', ' ' , TO_DATE('2023/02/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('lll@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf010.jpg', '�����Դϴ�', ' ' , TO_DATE('2023/02/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('mmm@bamentum.com', 'aaa', '��ȣ', './DATA/ImgProfil/pf011.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('nnn@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf012.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ooo@bamentum.com', 'aaa', '��ö', './DATA/ImgProfil/pf013.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ppp@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf014.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('qqq@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf015.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('rrr@bamentum.com', 'aaa', '��ȣ', './DATA/ImgProfil/pf016.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('sss@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf017.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ttt@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf018.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('uuu@bamentum.com', 'aaa', '�븮', './DATA/ImgProfil/pf019.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('vvv@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf020.jpg', '�Դϴ� ', ' ' , TO_DATE('2023/02/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('www@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf000.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('xxx@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf001.jpg', '�Դϴ�',               ' ' , TO_DATE('2023/02/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('yyy@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf002.jpg', '�Դϴ�',                              ' ' , TO_DATE('2023/02/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('111@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf003.jpg', '�Դϴ�',                                 ' ' , TO_DATE('2023/02/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('222@bamentum.com', 'aaa', '����', './DATA/ImgProfil/pf004.jpg', '�Դϴ�',                         ' ' , TO_DATE('2023/02/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('333@bamentum.com', 'aaa', '������', './DATA/ImgProfil/pf005.jpg', '�Դϴ�',                            ' ' , TO_DATE('2023/02/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('444@bamentum.com',     'aaa', '���̸�', './DATA/ImgProfil/pf006.jpg', '�Դϴ�',                             ' ' , TO_DATE('2023/02/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('555@bamentum.com',   'aaa', '���ϴ�', './DATA/ImgProfil/pf007.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('666@bamentum.com',  'aaa',' ���ϴ�', './DATA/ImgProfil/pf008.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('777@bamentum.com', 'aaa', 'ǥ�޺�', './DATA/ImgProfil/pf009.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('888@bamentum.com',    'aaa', '������', './DATA/ImgProfil/pf010.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;


insert into bmt_user values ('999@bamentum.com',    'aaa', '�����', './DATA/ImgProfil/pf011.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('000@bamentum.com',  'aaa', '���ѽ�', './DATA/ImgProfil/pf012.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('1212@bamentum.com',       'aaa', '���̽�', './DATA/ImgProfil/pf013.jpg', '�Դϴ�~', ' ' , TO_DATE('2023/02/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('2323@bamentum.com',     'aaa', '�輼��', './DATA/ImgProfil/pf014.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('3434@bamentum.com',       'aaa', '�̼���', './DATA/ImgProfil/pf015.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('4545@bamentum.com',  'aaa', '�丶��', './DATA/ImgProfil/pf016.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('5656@bamentum.com',    'aaa', '�ӱ�', './DATA/ImgProfil/pf017.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('6767@bamentum.com',   'aaa', '�ٶ�', './DATA/ImgProfil/pf018.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('7878@bamentum.com',   'aaa', '����', './DATA/ImgProfil/pf019.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('8989@bamentum.com',    'aaa', '����', './DATA/ImgProfil/pf020.jpg', '�Դϴ� ', ' ' , TO_DATE('2023/02/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;




insert into bmt_user values ('b@bamentum.com',    'aaa', 'ȫ�Ƹ�', './DATA/ImgProfil/pf000.jpg', '�ȳ��ϼ��� �Ƹ��ٿ� �Ƹ��Դϴ�', ' ' , TO_DATE('2023/03/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('c@bamentum.com',     'aaa', '���̽�', './DATA/ImgProfil/pf001.jpg', '�����Ÿ� ����� �� �ȵƾ��',               ' ' , TO_DATE('2023/03/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('d@bamentum.com',   'aaa', '���̷�', './DATA/ImgProfil/pf002.jpg', '�����ŷɷ� 4���� �����Դϴ�',                              ' ' , TO_DATE('2023/03/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('z@bamentum.com',     'aaa', '�ȼ���', './DATA/ImgProfil/pf003.jpg', '�����ŷ� ���̾�Ʈ ȿ���� �� �� �������?',                                 ' ' , TO_DATE('2023/03/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('f@bamentum.com',     'aaa', '����', './DATA/ImgProfil/pf004.jpg', '���� ��õ�ڽ��� ���ֵ� �ѷ����Դϴ�.',                         ' ' , TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('g@bamentum.com',  'aaa', '�ճ���', './DATA/ImgProfil/pf005.jpg', '������ �븮���� ��ϴ� CEO�Դϴ�',                            ' ' , TO_DATE('2023/03/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('h@bamentum.com',     'aaa', '�ڻ��', './DATA/ImgProfil/pf006.jpg', '�ڻ���Դϴ� ',                             ' ' , TO_DATE('2023/03/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('i@bamentum.com',   'aaa', 'ŹǪ��', './DATA/ImgProfil/pf007.jpg', 'ŹǪ���Դϴ�!', ' ' , TO_DATE('2023/02/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('j@bamentum.com',  'aaa', '����', './DATA/ImgProfil/pf008.jpg', '�����Դϴ�!', ' ' , TO_DATE('2023/02/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('k@bamentum.com', 'aaa', '���Ϸ�', './DATA/ImgProfil/pf009.jpg', '���Ϸ��Դϴ�', ' ' , TO_DATE('2023/02/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('l@bamentum.com',    'aaa', '����', './DATA/ImgProfil/pf010.jpg', '�����Դϴ�', ' ' , TO_DATE('2023/02/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('m@bamentum.com',    'aaa', '��ȣ', './DATA/ImgProfil/pf011.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('n@bamentum.com',  'aaa', '����', './DATA/ImgProfil/pf012.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('o@bamentum.com',       'aaa', '��ö', './DATA/ImgProfil/pf013.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('p@bamentum.com',     'aaa', '����', './DATA/ImgProfil/pf014.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('q@bamentum.com',       'aaa', '����', './DATA/ImgProfil/pf015.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('r@bamentum.com',  'aaa', '��ȣ', './DATA/ImgProfil/pf016.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('s@bamentum.com',    'aaa', '����', './DATA/ImgProfil/pf017.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('t@bamentum.com',   'aaa', '����', './DATA/ImgProfil/pf018.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('u@bamentum.com',   'aaa', '�븮', './DATA/ImgProfil/pf019.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('v@bamentum.com',    'aaa', '����', './DATA/ImgProfil/pf020.jpg', '�Դϴ� ', ' ' , TO_DATE('2023/02/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('w@bamentum.com',    'aaa', '����', './DATA/ImgProfil/pf000.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('x@bamentum.com',     'aaa', '����', './DATA/ImgProfil/pf001.jpg', '�Դϴ�',               ' ' , TO_DATE('2023/02/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('y@bamentum.com',   'aaa', '����', './DATA/ImgProfil/pf002.jpg', '�Դϴ�',                              ' ' , TO_DATE('2023/02/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('1@bamentum.com',     'aaa', '����', './DATA/ImgProfil/pf003.jpg', '�Դϴ�',                                 ' ' , TO_DATE('2023/02/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('2@bamentum.com',     'aaa', '����', './DATA/ImgProfil/pf004.jpg', '�Դϴ�',                         ' ' , TO_DATE('2023/02/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('3@bamentum.com',  'aaa', '������', './DATA/ImgProfil/pf005.jpg', '�Դϴ�',                            ' ' , TO_DATE('2023/02/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('4@bamentum.com',     'aaa', '���̸�', './DATA/ImgProfil/pf006.jpg', '�Դϴ�',                             ' ' , TO_DATE('2023/02/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('5@bamentum.com',   'aaa', '���ϴ�', './DATA/ImgProfil/pf007.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('6@bamentum.com',  'aaa',' ���ϴ�', './DATA/ImgProfil/pf008.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('7@bamentum.com', 'aaa', 'ǥ�޺�', './DATA/ImgProfil/pf009.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('8@bamentum.com',    'aaa', '������', './DATA/ImgProfil/pf010.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('9@bamentum.com',    'aaa', '�����', './DATA/ImgProfil/pf011.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('0@bamentum.com',  'aaa', '���ѽ�', './DATA/ImgProfil/pf012.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('12@bamentum.com',       'aaa', '���̽�', './DATA/ImgProfil/pf013.jpg', '�Դϴ�~', ' ' , TO_DATE('2023/02/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('23@bamentum.com',     'aaa', '�輼��', './DATA/ImgProfil/pf014.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('34@bamentum.com',       'aaa', '�̼���', './DATA/ImgProfil/pf015.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('45@bamentum.com',  'aaa', '�丶��', './DATA/ImgProfil/pf016.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('56@bamentum.com',    'aaa', '�ӱ�', './DATA/ImgProfil/pf017.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('67@bamentum.com',   'aaa', '�ٶ�', './DATA/ImgProfil/pf018.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('78@bamentum.com',   'aaa', '����', './DATA/ImgProfil/pf019.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('89@bamentum.com',    'aaa', '����', './DATA/ImgProfil/pf020.jpg', '�Դϴ� ', ' ' , TO_DATE('2023/02/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;



insert into bmt_user values ('bb@bamentum.com',    'aaa', 'ȫ�Ƹ�', './DATA/ImgProfil/pf000.jpg', '�ȳ��ϼ��� �Ƹ��ٿ� �Ƹ��Դϴ�', ' ' , TO_DATE('2023/03/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('cc@bamentum.com',     'aaa', '���̽�', './DATA/ImgProfil/pf001.jpg', '�����Ÿ� ����� �� �ȵƾ��',               ' ' , TO_DATE('2023/03/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('dd@bamentum.com',   'aaa', '���̷�', './DATA/ImgProfil/pf002.jpg', '�����ŷɷ� 4���� �����Դϴ�',                              ' ' , TO_DATE('2023/03/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('zz@bamentum.com',     'aaa', '�ȼ���', './DATA/ImgProfil/pf003.jpg', '�����ŷ� ���̾�Ʈ ȿ���� �� �� �������?',                                 ' ' , TO_DATE('2023/03/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ff@bamentum.com',     'aaa', '����', './DATA/ImgProfil/pf004.jpg', '���� ��õ�ڽ��� ���ֵ� �ѷ����Դϴ�.',                         ' ' , TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('gg@bamentum.com',  'aaa', '�ճ���', './DATA/ImgProfil/pf005.jpg', '������ �븮���� ��ϴ� CEO�Դϴ�',                            ' ' , TO_DATE('2023/03/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('hh@bamentum.com',     'aaa', '�ڻ��', './DATA/ImgProfil/pf006.jpg', '�ڻ���Դϴ� ',                             ' ' , TO_DATE('2023/03/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ii@bamentum.com',   'aaa', 'ŹǪ��', './DATA/ImgProfil/pf007.jpg', 'ŹǪ���Դϴ�!', ' ' , TO_DATE('2023/02/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('jj@bamentum.com',  'aaa', '����', './DATA/ImgProfil/pf008.jpg', '�����Դϴ�!', ' ' , TO_DATE('2023/02/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('kk@bamentum.com', 'aaa', '���Ϸ�', './DATA/ImgProfil/pf009.jpg', '���Ϸ��Դϴ�', ' ' , TO_DATE('2023/02/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ll@bamentum.com',    'aaa', '����', './DATA/ImgProfil/pf010.jpg', '�����Դϴ�', ' ' , TO_DATE('2023/02/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('mm@bamentum.com',    'aaa', '��ȣ', './DATA/ImgProfil/pf011.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('nn@bamentum.com',  'aaa', '����', './DATA/ImgProfil/pf012.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('oo@bamentum.com',       'aaa', '��ö', './DATA/ImgProfil/pf013.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('pp@bamentum.com',     'aaa', '����', './DATA/ImgProfil/pf014.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('qq@bamentum.com',       'aaa', '����', './DATA/ImgProfil/pf015.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('rr@bamentum.com',  'aaa', '��ȣ', './DATA/ImgProfil/pf016.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ss@bamentum.com',    'aaa', '����', './DATA/ImgProfil/pf017.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('tt@bamentum.com',   'aaa', '����', './DATA/ImgProfil/pf018.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('uu@bamentum.com',   'aaa', '�븮', './DATA/ImgProfil/pf019.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('vv@bamentum.com',    'aaa', '����', './DATA/ImgProfil/pf020.jpg', '�Դϴ� ', ' ' , TO_DATE('2023/02/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ww@bamentum.com',    'aaa', '����', './DATA/ImgProfil/pf000.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('xx@bamentum.com',     'aaa', '����', './DATA/ImgProfil/pf001.jpg', '�Դϴ�',               ' ' , TO_DATE('2023/02/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('yy@bamentum.com',   'aaa', '����', './DATA/ImgProfil/pf002.jpg', '�Դϴ�',                              ' ' , TO_DATE('2023/02/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('11@bamentum.com',     'aaa', '����', './DATA/ImgProfil/pf003.jpg', '�Դϴ�',                                 ' ' , TO_DATE('2023/02/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('22@bamentum.com',     'aaa', '����', './DATA/ImgProfil/pf004.jpg', '�Դϴ�',                         ' ' , TO_DATE('2023/02/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('33@bamentum.com',  'aaa', '������', './DATA/ImgProfil/pf005.jpg', '�Դϴ�',                            ' ' , TO_DATE('2023/02/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('44@bamentum.com',     'aaa', '���̸�', './DATA/ImgProfil/pf006.jpg', '�Դϴ�',                             ' ' , TO_DATE('2023/02/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('55@bamentum.com',   'aaa', '���ϴ�', './DATA/ImgProfil/pf007.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('66@bamentum.com',  'aaa',' ���ϴ�', './DATA/ImgProfil/pf008.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('77@bamentum.com', 'aaa', 'ǥ�޺�', './DATA/ImgProfil/pf009.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('88@bamentum.com',    'aaa', '������', './DATA/ImgProfil/pf010.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('99@bamentum.com',    'aaa', '�����', './DATA/ImgProfil/pf011.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('00@bamentum.com',  'aaa', '���ѽ�', './DATA/ImgProfil/pf012.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('122@bamentum.com',       'aaa', '���̽�', './DATA/ImgProfil/pf013.jpg', '�Դϴ�~', ' ' , TO_DATE('2023/02/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('233@bamentum.com',     'aaa', '�輼��', './DATA/ImgProfil/pf014.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('344@bamentum.com',       'aaa', '�̼���', './DATA/ImgProfil/pf015.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('455@bamentum.com',  'aaa', '�丶��', './DATA/ImgProfil/pf016.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('566@bamentum.com',    'aaa', '�ӱ�', './DATA/ImgProfil/pf017.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('677@bamentum.com',   'aaa', '�ٶ�', './DATA/ImgProfil/pf018.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('788@bamentum.com',   'aaa', '����', './DATA/ImgProfil/pf019.jpg', '�Դϴ�', ' ' , TO_DATE('2023/02/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('899@bamentum.com',    'aaa', '����', './DATA/ImgProfil/pf020.jpg', '�Դϴ� ', ' ' , TO_DATE('2023/02/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;




insert into bmt_post values (10505, 'f', ' Ȥ�� XX��ó�� ������ �ΰ��ź�?? ',  ' ���� �Ѱ� ��å ���ٰ� ���� Ÿ�� �����Ŷ� �Ȱ��� �����Ű� �ֱ淡 ������ ���� �־��µ���<br> ���� ���ָӴϲ��� ��ĥ���� ������ ������ �� ��Ÿ���ٰ� �Ͻô��󱸿�!! <br> Ȥ�� �ٸ��ҿ� �����ȣ ����Ͻź��̶�� �� �� ���� �����ֽ� �� ���Ƽ� �� �÷�����!! ', './DATA/PostImage/bamen1.JPG', TO_DATE('2023/04/01 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com', 11);



insert into bmt_post values (10509, 'f', '����� ����ϱ��?', '����� �Ѱ����� �Դϴ�', './DATA/PostImage/img060.jpg', TO_DATE('2023/03/30 15:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com',    10);
insert into bmt_post values (10060, 'f', '����� ����ϱ��?', '����� �Ѱ����� �Դϴ�', './DATA/PostImage/img060.jpg', TO_DATE('2023/03/30 15:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com',    10);



insert into bmt_post values (10060, 'f', '����� ����ϱ��?', '����� �Ѱ����� �Դϴ�', './DATA/PostImage/img060.jpg', TO_DATE('2023/03/30 15:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com',    10);


insert into bmt_post values (10007, 'f', '�ƶ� �κζ��̵� ���� ���̳׿�',            '?���������� ������ �������� ���̵� ���Դ���<br>���� �����ֳ׿�~ <br>û�󿡼� ������ �޸��� �Գ׿�~ <br>���������� �ܹ��� �ϳ� �԰�, �ƹ̳����Ż�� ������ �����ϴ� ���׿� ��', './DATA/PostImage/img007.jpg', TO_DATE('2023/03/04 14:56:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ha_Eun0103@bamentum.com', 17);

commit;




insert into bmt_post values (10040, 'f', '�强Ȳ�氭 �����ű� ���籸���ȳ�', '�强Ȳ�氭�����ű��� õ���·θ� ���� ������ �����߱⿡<br>���� ��縦 �����ϴ�. ������ û������ ������ �����̰�<br>�Ӱ�->���汳����  �������·η� �����ϸ� �����ϰ� �޸���<br>������ ���׿� �ٸ��� ���� �ϰ��ȵ��Ͽ� �� ����ɰ� �����ϴ�.<br>', './DATA/PostImage/img040.jpg', TO_DATE('2023/02/13 12:43:00', 'YYYY/MM/DD HH24:MI:SS'), 'ESOO0710@bamentum.com',       10);



insert into bmt_post values (10020, 'f', '�±� �ڴ����� ������ �Ұ��մϴ� -Ʈ����-',     '�̷��� ������� ��ŷ ��ŷ���ָ� ������ ���� ������...����Ʈ�� ����.. <br>�̷��� ������ �ٸ�(?)���� �����ϰ� �˴ϴ�. ', './DATA/PostImage/img020.jpg', TO_DATE('2022/01/16 14:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'SeongGyu0407@bamentum.com', 10);

*/
