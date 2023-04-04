drop table BMT_BIC;
drop table BMT_CID;
drop table BMT_COMMENT ;
drop table BMT_CONNECTION ;
drop table BMT_FOLLOW ;
drop table BMT_POST ;
drop table BMT_POST_LIKES ;
drop table BMT_USER ;

commit;

-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

-- bmt_user Table Create SQL
-- ���̺� ���� SQL - bmt_user


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
   ,foreign key (u_email) references bmt_user(u_email)
     
);



CREATE TABLE bmt_comment
(
    c_idx        NUMBER(18, 0)     NOT NULL, 
    p_idx        NUMBER(18, 0)     NOT NULL, 
    c_content    VARCHAR2(4000)    NOT NULL, 
    c_date       DATE              DEFAULT SYSDATE NOT NULL, 
    u_email      VARCHAR2(40)      NOT NULL, 
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


CREATE TABLE bmt_bic
(
    b_num      VARCHAR2(40)     NOT NULL, 
    u_email    VARCHAR2(40)     NOT NULL, 
    b_img      VARCHAR2(600)    NOT NULL, 
     PRIMARY KEY (b_num)
     
   ,foreign key (u_email) references bmt_user(u_email)
     
);


insert into bmt_user values ('aaa@aaa.aaa', 'aaa', 'aaa�����', './DATA/PostImage/img001.jpg', '����������� ��� �Ẹ��', '�����ϴ� �ڽ�aaa' , TO_DATE('2023/03/01 11:00:00', 'YYYY/MM/DD HH:MI:SS'), 'u' ) ;
insert into bmt_user values ('bbb@bbb.bbb', 'aaa', 'bbb�⿵��', './DATA/PostImage/img002.jpg', '����������� ��� �Ẹ��', '�����ϴ� �ڽ�bbb' , TO_DATE('2023/03/02 11:00:00', 'YYYY/MM/DD HH:MI:SS'), 'u' ) ;
insert into bmt_user values ('ccc@ccc.ccc', 'aaa', 'ccc�ȹ̿�', './DATA/PostImage/img003.jpg', '����������� ��� �Ẹ��', '�����ϴ� �ڽ�ccc' , TO_DATE('2023/03/03 11:00:00', 'YYYY/MM/DD HH:MI:SS'), 'u' ) ;
insert into bmt_user values ('ddd@ddd.ddd', 'aaa', 'ddd������', './DATA/PostImage/img004.jpg', '����������� ��� �Ẹ��', '�����ϴ� �ڽ�ddd' , TO_DATE('2023/03/04 11:00:00', 'YYYY/MM/DD HH:MI:SS'), 'u' ) ;
insert into bmt_user values ('eee@eee.eee', 'aaa', 'eee�迬��', './DATA/PostImage/img005.jpg', '����������� ��� �Ẹ��', '�����ϴ� �ڽ�eee' , TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH:MI:SS'), 'u' ) ;

commit;


insert into bmt_post values (10001, 'f', '���̾ȵǳ� ��', '��ڴ�ڴ�� ���� �������������������߷� ����ſ� ��ȭ��', './DATA/PostImage/img021.jpg', TO_DATE('2023/03/06 12:01:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 11);
insert into bmt_post values (10002, 'f', '�̷����� ��ȭ', '����ũ���������� �� �׷��ȱ׷��ȱ׷��� ���̰ſ� ��ȭ��', './DATA/PostImage/img022.jpg', TO_DATE('2023/03/06 12:02:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 12);
insert into bmt_post values (10003, 'f', '���ϱñ��ߴ���', '�ʹ��� �� �������� �̹�ģ�̹�ģ�̹�ģ���  ��ſ� ��ȭ', './DATA/PostImage/img023.jpg', TO_DATE('2023/03/06 12:03:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 13);
insert into bmt_post values (10004, 'f', '�ϰ��� �ƹ�', 'CG����� �ú�����  ����Ÿ  ����Ÿ  ����Ÿ  ���� ��ſ� ��ȭ ', './DATA/PostImage/img024.jpg', TO_DATE('2023/03/06 12:04:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 14);
insert into bmt_post values (10005, 'f', '��¥ ���� ��', ' OTT�ô뿡 ������ ���ƹ�Ÿ�ƹ�Ÿ�ƹ�Ÿ�� ����ſ� ��ȭ', './DATA/PostImage/img025.jpg', TO_DATE('2023/03/06 12:05:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 15);
insert into bmt_post values (10006, 'f', '������3ź ��', ' ���丮��� ������ �����ӻ��ӻ��ӷ� ����ſ� ��ȭ', './DATA/PostImage/img026.jpg', TO_DATE('2023/03/06 12:06:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 16);
insert into bmt_post values (10007, 'f', 'ī�޷� ������', ' �츮�� ����ؼ���  �׳ɺ��׳ɺ��׳ɺ����  ��ſ� ��ȭ', './DATA/PostImage/img027.jpg', TO_DATE('2023/03/06 12:07:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 17);
insert into bmt_post values (10008, 'f', '����� �ϳ���', '���Դ� �� ������ ��  �ƴ����ƴ����ƴ������� �� ��ȭ��', './DATA/PostImage/img028.jpg', TO_DATE('2023/03/06 12:08:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 18);
insert into bmt_post values (10009, 'f', '�̿�ȭ ���ƴ�', '������ ����3���� �� ��¥����¥����¥�� ���̰ſ� ��ȭ��', './DATA/PostImage/img029.jpg', TO_DATE('2023/03/06 12:09:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 19);
insert into bmt_post values (10010, 'f', '2������ �ܰ�', ' ��븦 �ʹ� ������ ������ȭ����ȭ����ȭ�� ����ſ� ��', './DATA/PostImage/img030.jpg', TO_DATE('2023/03/06 12:10:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 10);
insert into bmt_post values (10011, 'f', '���� ���ǳ���', '��¥ ��򰡿� ���� ��ǥ����ǥ����ǥ���Ϸ� ����ſ� ��ȭ', './DATA/PostImage/img031.jpg', TO_DATE('2023/03/06 12:11:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 11);
insert into bmt_post values (10012, 'f', '��ȭ���ٰ� ��', '�ð� ������ �𼼿� ���̰Ծ��̰Ծ��̰Ծ�� ����ſ� ��ȭ', './DATA/PostImage/img032.jpg', TO_DATE('2023/03/06 12:12:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 12);
insert into bmt_post values (10013, 'f', '�� �ڲ� cg��', '3D�� �ôµ� �ÿ� �� �⸸���⸸���⸸�� ���̰ſ� ��ȭ', './DATA/PostImage/img033.jpg', TO_DATE('2023/03/06 12:13:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 13);
insert into bmt_post values (10014, 'f', '����� �ϳ���', '�����̾� �󿵼��� ����ȭ����ȭ����ȭ���� ����ſ� ��ȭ��', './DATA/PostImage/img034.jpg', TO_DATE('2023/03/06 12:14:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 14);
insert into bmt_post values (10015, 'f', '���丮�� ����', '�� �λ� �ְ��ǿ� ��  �Ϻ��ѿϺ��ѿϺ��Ѵ��� �� ��ȭ', './DATA/PostImage/img035.jpg', TO_DATE('2023/03/06 12:15:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 15);
insert into bmt_post values (10016, 'f', 'CG���ƴ� �ٴ�',  '����� ���������� ������  ������  ������ �� ���� ��ſ� ��', './DATA/PostImage/img036.jpg', TO_DATE('2023/03/06 12:16:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 16);
insert into bmt_post values (10017, 'f', '�ڽĵ��� �� ', ' �������� �������� �� �ɾ߿��ɾ߿��ɾ߿� ���̰ſ� ��ȭ', './DATA/PostImage/img037.jpg', TO_DATE('2023/03/06 12:17:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 17);
insert into bmt_post values (10018, 'f', '3D �Ȱ� ����', '���� ���� �ʿ似�� ���а���а���а���� ����ſ� ��ȭ', './DATA/PostImage/img038.jpg', TO_DATE('2023/03/06 12:18:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 18);
insert into bmt_post values (10019, 'f', '��ȭ���� ����', '���̷Ӵ� ,�̻ڼ��� �������������������Ϸ� ����ſ� ��ȭ', './DATA/PostImage/img039.jpg', TO_DATE('2023/03/06 12:19:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 19);
insert into bmt_post values (10020, 'f', '���� Ÿ�뽺��', '��û���ϴ� �ּ��� ����¥����¥����¥���� ����ſ� ��ȭ��', './DATA/PostImage/img040.jpg', TO_DATE('2023/03/06 12:20:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 10);


insert into bmt_post values (10021, 'f', '������������  ��', '��ڴ�ڴ�� �ٿ���� �Ͽ���� ����̰� ���丮ȭ��', './DATA/PostImage/img041.jpg', TO_DATE('2023/03/07 12:01:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 11);
insert into bmt_post values (10022, 'f', '�̵� ���� ���ο�ȭ', '����ũ������ ������� �ϱ���Ѵ�γ׿�. �ߺý�ȭ��', './DATA/PostImage/img042.jpg', TO_DATE('2023/03/07 12:02:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 12);
insert into bmt_post values (10023, 'f', '���ʹ� ������ߴ���', '�ʹ��� �� ���翡����� ���� �̰� �ּ��ΰ���?  ��ȭ', './DATA/PostImage/img043.jpg', TO_DATE('2023/03/07 12:03:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 13);
insert into bmt_post values (10024, 'f', '��3�ð��� �� �ƹ�', 'CG����� �ñ��ؿ����  �����Դϴ٤Ф� ���̻� ȭ ', './DATA/PostImage/img044.jpg', TO_DATE('2023/03/07 12:04:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 14);
insert into bmt_post values (10025, 'f', '���׳� �׷��� ��', ' OTT�ô뿡 ��ȭ �����   3�ð� 10�е��� ��ȭ�� ȭ', './DATA/PostImage/img045.jpg', TO_DATE('2023/03/07 12:05:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 15);
insert into bmt_post values (10026, 'f', '���̰� ��ȭ�� ��', ' ���丮��� ���� ����� �Ͻ��丮 ����� ���ϳ� ȭ', './DATA/PostImage/img046.jpg', TO_DATE('2023/03/07 12:06:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 16);
insert into bmt_post values (10027, 'f', 'ī���丮 ���ϰ���', ' �츮�� ����ؼ� �����   ������ �������� �ٲ�  ȭ', './DATA/PostImage/img047.jpg', TO_DATE('2023/03/07 12:07:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 17);
insert into bmt_post values (10028, 'f', '����������̳���', '���Դ� �� �����������   �������� ���� �ʹ� ��ȭ��', './DATA/PostImage/img048.jpg', TO_DATE('2023/03/07 12:08:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 18);
insert into bmt_post values (10029, 'f', '�̿���̰� ���ƴ�', '������ ����3D ����� �Ͽ��ó� ���Ҿ��^^ ��ȭ��', './DATA/PostImage/img049.jpg', TO_DATE('2023/03/07 12:09:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 19);
insert into bmt_post values (10030, 'f', '2 ���鼭 �� ���ܰ�', ' ��븦 �ʹ� ���� �����  ����̸� �����ϰ�� �� ', './DATA/PostImage/img050.jpg', TO_DATE('2023/03/07 12:10:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 10);
insert into bmt_post values (10031, 'f', '��CG��� ������', '��¥ ��򰡿� �ֿ���� ������ �����Ҳ� ���� ��ȭ', './DATA/PostImage/img051.jpg', TO_DATE('2023/03/07 12:11:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 11);
insert into bmt_post values (10032, 'f', '��1���� �ʹ� �� ��', '�ð� ������ �𸣿���� �ϱ��̿� ������ ����ϵ�ȭ', './DATA/PostImage/img052.jpg', TO_DATE('2023/03/07 12:12:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 12);
insert into bmt_post values (10033, 'f', '�ֽ��丮�� ��g��', '3D�� �ôµ� �ÿ���� ��2009���̶� ũ�� �ٸ� ', './DATA/PostImage/img053.jpg', TO_DATE('2023/03/07 12:13:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 13);
insert into bmt_post values (10034, 'f', '��3�ð� ���� ����', '�����̾� �󿵰������ �Ͻ��丮�� ���� ��ȭ�� ȭ��', './DATA/PostImage/img054.jpg', TO_DATE('2023/03/07 12:14:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 14);
insert into bmt_post values (10035, 'f', '������ �ΰ�������', '�� �λ� �ְ��� ����� �� 3�ð��� 30���� �Ǵ� ��ȭ', './DATA/PostImage/img055.jpg', TO_DATE('2023/03/07 12:15:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 15);
insert into bmt_post values (10036, 'f', 'C�׳� ǳ�� �� �ٴ�',  '����� �������� ����̷���Ÿ���� �� ���� �濵', './DATA/PostImage/img056.jpg', TO_DATE('2023/03/07 12:16:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 16);
insert into bmt_post values (10037, 'f', '��70�� �ƺ����� ', ' �������� ������ ����� �Ͽ������� ���� Ÿ��Ÿ��ȭ', './DATA/PostImage/img057.jpg', TO_DATE('2023/03/07 12:17:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 17);
insert into bmt_post values (10038, 'f', '3 �ʴ� 2�� 6õ����', '���� ���� �ʿ��ҿ���� �Ϲ�� �ôµ� �Ǹ��߾��ȭ', './DATA/PostImage/img058.jpg', TO_DATE('2023/03/07 12:18:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 18);
insert into bmt_post values (10039, 'f', '������� ��������', '���̷Ӵ� ,�̻ڴٿ����   ���! �������̰� 3�ð�ȭ', './DATA/PostImage/img059.jpg', TO_DATE('2023/03/07 12:19:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 19);
insert into bmt_post values (10040, 'f', '������̰� �Ž���', '��û���ϴ� �ְ���� ���� ��ȭ�� 10�� ���ָ� ��', './DATA/PostImage/img060.jpg', TO_DATE('2023/03/07 12:20:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 10);

commit;

insert into bmt_post values (10041, 'f', '������', '¥ ������ ��ȭ 1��1���� �ξ� ���Ϻ��� �������� ����ü', './DATA/PostImage/img061.jpg', TO_DATE('2023/03/08 12:01:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 11);
insert into bmt_post values (10042, 'f', '�׷���', '�丮�� �� �ƽ���..������ ��ȭ��(���̸ƽ�, ����, �÷�����) ', './DATA/PostImage/img062.jpg', TO_DATE('2023/03/08 12:02:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 12);
insert into bmt_post values (10043, 'f', '�̹�ģ', 'ȭ�� ���鼭 ��û ��뺸�� ���γ׿�. 4d�� ���� �׳��� ����', './DATA/PostImage/img063.jpg', TO_DATE('2023/03/08 12:03:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 13);
insert into bmt_post values (10044, 'f', '����Ÿ', '�ս��ϴ�. ��¿��佺�丮�� ���� 3�ð� ���� ȲȦ�ϰ� ����...', './DATA/PostImage/img064.jpg', TO_DATE('2023/03/08 12:04:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 14);
insert into bmt_post values (10045, 'f', '�ƹ�Ÿ', '3�� ��ٷ� �� �ƹٰ��̷ο� CG. ������ CG�� �����ֱ� ��', './DATA/PostImage/img065.jpg', TO_DATE('2023/03/08 12:05:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 15);
insert into bmt_post values (10046, 'f', '����', 'g ���� �� �ֽ��ϴپƺ�Ÿ ���� ������ ������ �������� ����', './DATA/PostImage/img066.jpg', TO_DATE('2023/03/08 12:06:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 16);
insert into bmt_post values (10047, 'f', '�׳ɺ�', 'G�� �Ǹ��մϴ�!�Ƹ��ٿ� ��ȭ~~��¥ �� ��ȭ~~���� ��ȭ~~', './DATA/PostImage/img067.jpg', TO_DATE('2023/03/08 12:07:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 17);
insert into bmt_post values (10048, 'f', '�ƴ���', '���� ����, �̹� 1Ÿ��Ÿ���� ���ö���. ��¥ ���������� ��ȭ', './DATA/PostImage/img068.jpg', TO_DATE('2023/03/08 12:08:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 18);
insert into bmt_post values (10049, 'f', '��¥��', '��̴� ��¥ �����ֺ���� ����� ���� ���丮 �� ��Ÿ ��� ��', './DATA/PostImage/img069.jpg', TO_DATE('2023/03/08 12:09:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 19);
insert into bmt_post values (10050, 'f', '����ȭ', '�� �� �̻�...ȲȦ�߾ƹ�Ÿ1�̳ʹ�����־ �ʹ� ����ߴ���', './DATA/PostImage/img070.jpg', TO_DATE('2023/03/08 12:10:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 10);
insert into bmt_post values (10051, 'f', 'ǥ����', '�丮�� ������ ������������ ���丮�� ���� ������ ���������� ', './DATA/PostImage/img071.jpg', TO_DATE('2023/03/08 12:11:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 11);
insert into bmt_post values (10052, 'f', '�̰Ծ�', '��Ÿ�� ��¡�� �����̰� ���̸ƽ��� �̹����� �Ⱥ��� ��� ��ȸ', './DATA/PostImage/img072.jpg', TO_DATE('2023/03/08 12:12:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 12);
insert into bmt_post values (10053, 'f', '�⸸��', '��̴� ��¥ ���ƴ������� ��ġ���� ���ϳ�, �β������� ���� ��', './DATA/PostImage/img073.jpg', TO_DATE('2023/03/08 12:13:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 13);
insert into bmt_post values (10054, 'f', '��ȭ��', '���ϰ� ������ ���������x3. �̷� ȣ�縦 ������ �� 5���� �� ', './DATA/PostImage/img074.jpg', TO_DATE('2023/03/08 12:14:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 14);
insert into bmt_post values (10055, 'f', '�Ϻ���', '��Ÿ 1���� ó���ñ����ϴ� �谨�̾� ���� ���� ���ٸ�, ��ȭ��', './DATA/PostImage/img075.jpg', TO_DATE('2023/03/08 12:15:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 15);
insert into bmt_post values (10056, 'f', '������', '��� ���� �ƹ��͵������̶� �̾���.. ���밳������.�� ��������', './DATA/PostImage/img076.jpg', TO_DATE('2023/03/08 12:16:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 16);
insert into bmt_post values (10057, 'f', '�ɾ߿�', '��� ���ٴ� ���� 1���� 10���̶�� 2���� 7���̻��� �� ����', './DATA/PostImage/img077.jpg', TO_DATE('2023/03/08 12:17:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 17);
insert into bmt_post values (10058, 'f', '�а���', '���༺���� ���� �׽��丮�� ��ġ�ϰ� ����̴� ����. �ٴٸ� ��', './DATA/PostImage/img078.jpg', TO_DATE('2023/03/08 12:18:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 18);
insert into bmt_post values (10059, 'f', '������', '�޷� �����ε� ����3�ð��� 1�ð�ó�� �������� ����. �ƹ�Ÿ3', './DATA/PostImage/img079.jpg', TO_DATE('2023/03/08 12:19:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 19);
insert into bmt_post values (10060, 'f', '��¥��', '���ٴ� ���ζ�淡 �����³�ȭ�� ���� �Ұ����ڴ� ���丮�� ����', './DATA/PostImage/img080.jpg', TO_DATE('2023/03/08 12:20:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 10);

commit;


delete from bmt_comment;

insert into bmt_comment values (20001, 10001, ' ������������  ', TO_DATE('2023/03/09 12:31:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb');
insert into bmt_comment values (20002, 10001, ' �׷��ȱ׷���  ', TO_DATE('2023/03/09 12:32:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc');
insert into bmt_comment values (20003, 10001, ' �̹�ģ�̹�ģ  ', TO_DATE('2023/03/09 12:33:00', 'YYYY/MM/DD HH:MI:SS'), 'ddd@ddd.ddd');
insert into bmt_comment values (20004, 10001, ' ����Ÿ����Ÿ  ', TO_DATE('2023/03/09 12:34:00', 'YYYY/MM/DD HH:MI:SS'), 'eee@eee.eee');
insert into bmt_comment values (20005, 10001, ' �ƹ�Ÿ�ƹ�Ÿ  ', TO_DATE('2023/03/09 12:35:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb');
insert into bmt_comment values (20006, 10001, ' ���ӻ���  ', TO_DATE('2023/03/09 12:36:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc');
insert into bmt_comment values (20007, 10001, ' �׳ɺ��׳ɺ�  ', TO_DATE('2023/03/09 12:37:00', 'YYYY/MM/DD HH:MI:SS'), 'ddd@ddd.ddd');
insert into bmt_comment values (20008, 10001, ' �ƴ����ƴ���  ', TO_DATE('2023/03/09 12:38:00', 'YYYY/MM/DD HH:MI:SS'), 'eee@eee.eee');
insert into bmt_comment values (20009, 10001, ' ��¥����¥��  ', TO_DATE('2023/03/09 12:39:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb');
insert into bmt_comment values (20010, 10001, ' ����ȭ����ȭ  ', TO_DATE('2023/03/09 12:30:00', 'YYYY/MM/DD HH:MI:SS'), 'ddd@ddd.ddd');
insert into bmt_comment values (20011, 10021, ' ǥ����ǥ����  ', TO_DATE('2023/03/09 12:31:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb');
insert into bmt_comment values (20012, 10021, ' �̰Ծ��̰Ծ�  ', TO_DATE('2023/03/09 12:32:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc');
insert into bmt_comment values (20013, 10021, ' �⸸���⸸��  ', TO_DATE('2023/03/09 12:33:00', 'YYYY/MM/DD HH:MI:SS'), 'ddd@ddd.ddd');
insert into bmt_comment values (20014, 10021, ' ��ȭ����ȭ��  ', TO_DATE('2023/03/09 12:34:00', 'YYYY/MM/DD HH:MI:SS'), 'eee@eee.eee');
insert into bmt_comment values (20015, 10021, ' �Ϻ��ѿϺ���  ', TO_DATE('2023/03/09 12:35:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb');
insert into bmt_comment values (20016, 10021, ' ������������  ', TO_DATE('2023/03/09 12:36:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc');
insert into bmt_comment values (20017, 10021, ' �ɾ߿��ɾ߿�  ', TO_DATE('2023/03/09 12:37:00', 'YYYY/MM/DD HH:MI:SS'), 'ddd@ddd.ddd');
insert into bmt_comment values (20018, 10021, ' �а���а���  ', TO_DATE('2023/03/09 12:38:00', 'YYYY/MM/DD HH:MI:SS'), 'eee@eee.eee');
insert into bmt_comment values (20019, 10021, ' ������������  ', TO_DATE('2023/03/09 12:39:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb');
insert into bmt_comment values (20020, 10021, ' ��¥����¥��  ', TO_DATE('2023/03/09 12:30:00', 'YYYY/MM/DD HH:MI:SS'), 'ddd@ddd.ddd');

commit;

insert into bmt_follow values (30001, 'aaa@aaa.aaa', 'bbb@bbb.bbb', TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH:MI:SS'));
insert into bmt_follow values (30002, 'aaa@aaa.aaa', 'ccc@ccc.ccc', TO_DATE('2023/03/05 11:01:00', 'YYYY/MM/DD HH:MI:SS'));
insert into bmt_follow values (30003, 'aaa@aaa.aaa', 'ddd@ddd.ddd', TO_DATE('2023/03/05 11:02:00', 'YYYY/MM/DD HH:MI:SS'));
insert into bmt_follow values (30004, 'bbb@bbb.bbb', 'aaa@aaa.aaa', TO_DATE('2023/03/05 11:03:00', 'YYYY/MM/DD HH:MI:SS'));
insert into bmt_follow values (30005, 'ccc@ccc.ccc', 'aaa@aaa.aaa', TO_DATE('2023/03/05 11:04:00', 'YYYY/MM/DD HH:MI:SS'));
insert into bmt_follow values (30006, 'ddd@ddd.ddd', 'aaa@aaa.aaa', TO_DATE('2023/03/05 11:05:00', 'YYYY/MM/DD HH:MI:SS'));
insert into bmt_follow values (30007, 'bbb@bbb.bbb', 'ccc@ccc.ccc', TO_DATE('2023/03/05 11:05:00', 'YYYY/MM/DD HH:MI:SS'));
insert into bmt_follow values (30008, 'ddd@ddd.ddd', 'bbb@bbb.bbb', TO_DATE('2023/03/05 11:05:00', 'YYYY/MM/DD HH:MI:SS'));
insert into bmt_follow values (30009, 'ddd@ddd.ddd', 'ccc@ccc.ccc', TO_DATE('2023/03/05 11:05:00', 'YYYY/MM/DD HH:MI:SS'));


commit;

/*
SELECT * 
    FROM (
        SELECT A.* , ROWNUM AS RN 
            FROM (
            
                select u.u_nick, p.p_title, p.p_content, p.p_file, p.p_date, p.p_view
                    from bmt_user u, bmt_post p
                where u.u_email = p.u_email
                    order by p.p_date desc

                ) A ) 
                
            WHERE RN BETWEEN 4 AND 6;
			
*/			