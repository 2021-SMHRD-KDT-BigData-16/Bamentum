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


-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- bmt_user Table Create SQL
-- 테이블 생성 SQL - bmt_user


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
-- 테이블 생성 SQL - bmt_connection
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


insert into bmt_user values ('Gyu_nam1211@bamentum.com',    'aaa', '강규남', './DATA/ImgProfil/pf000.jpg', '광주동구에서 스마트인재개발원까지 자전거로 출퇴근하고 있습니다 잘부탁드립니다ㅇㅂㅇ', ' ' , TO_DATE('2023/03/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Ho_won0806@bamentum.com',     'aaa', '김호원', './DATA/ImgProfil/pf001.jpg', '제안에는 또다른 라이더가 있어요 저의 내면아이도 사랑해주세요', ' ' , TO_DATE('2023/03/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('Kwon_Min1102@bamentum.com',   'aaa', '김권민', './DATA/ImgProfil/pf002.jpg', '목포평광에서 자전거타는 김아무개입니다', ' ' , TO_DATE('2023/03/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Sohyun0519@bamentum.com',     'aaa', '구소현', './DATA/ImgProfil/pf003.jpg', '나주에서 자전거타고 상경했답니당v', ' ' , TO_DATE('2023/03/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('KIHYUN0928@bamentum.com',     'aaa', '권기현', './DATA/ImgProfil/pf004.jpg', '판교까지 자전거로 출퇴근하는 샌즈 개발자입니다', ' ' , TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Young_Min0531@bamentum.com',  'aaa', '기영민', './DATA/ImgProfil/pf005.jpg', '청담동에서 자전거로 출퇴근하는 CEO ', ' ' , TO_DATE('2023/03/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Ha_Eun0103@bamentum.com',     'aaa', '남하은', './DATA/ImgProfil/pf006.jpg', '초절정 미녀 신입입니다~ 잘부탁드립니다', ' ' , TO_DATE('2023/03/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Kyungsoo0723@bamentum.com',   'aaa', '문경수', './DATA/ImgProfil/pf007.jpg', '클라이밍과 자전거로 자기관리!', ' ' , TO_DATE('2023/03/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Da-gyeong0711@bamentum.com',  'aaa', '배다경', './DATA/ImgProfil/pf008.jpg', '자전거 디자인팀장입니다! 잘부탁드립니다!', ' ' , TO_DATE('2023/03/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Hyeong_sun0331@bamentum.com', 'aaa', '심형선', './DATA/ImgProfil/pf009.jpg', '마이스터고에서 자전거로 출퇴근하는 중입니다', ' ' , TO_DATE('2023/03/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Mi_yeon0602@bamentum.com',    'aaa', '안미연', './DATA/ImgProfil/pf010.jpg', '자전거로 해외여행다니는 중이에요 정보공유해요!', ' ' , TO_DATE('2023/03/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Sangjae0604@bamentum.com',    'aaa', '윤상재', './DATA/ImgProfil/pf011.jpg', '자전거 엔지니어 현업을 하고 있는 라이더입니다!', ' ' , TO_DATE('2023/03/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Jung_Hyun0421@bamentum.com',  'aaa', '윤정현', './DATA/ImgProfil/pf012.jpg', '뒤쳐지기싫다,끌려다니기싫다,포기하기싫다! 내가능성을 보여주자!', ' ' , TO_DATE('2023/03/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Semi1108@bamentum.com',       'aaa', '이세미', './DATA/ImgProfil/pf013.jpg', '자전거로 우리나라 국토여행중이에요~', ' ' , TO_DATE('2023/03/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('JiKang1010@bamentum.com',     'aaa', '왕지강', './DATA/ImgProfil/pf014.jpg', '자전거로 맛집탐방중입니다 냠냠', ' ' , TO_DATE('2023/03/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ESOO0710@bamentum.com',       'aaa', '장이수', './DATA/ImgProfil/pf015.jpg', '자전거 어디까지 예뻐질 수 있는데? 내가 꾸며주지', ' ' , TO_DATE('2023/03/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Young-rae0618@bamentum.com',  'aaa', '주영래', './DATA/ImgProfil/pf016.jpg', '나만의 자전거길을 개척한다! 자전거길 코스 추천은 나에게', ' ' , TO_DATE('2023/03/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('JunYong0112@bamentum.com',    'aaa', '조준용', './DATA/ImgProfil/pf017.jpg', '가정의 화목을 위해 온가족이 다함께 자전거 타고 있습니다', ' ' , TO_DATE('2023/03/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('zipgalle1116@bamentum.com',   'aaa', '최근호', './DATA/ImgProfil/pf018.jpg', '해외에서 유학하는 중에 자전거로 여행다니는 미스터리최입니다', ' ' , TO_DATE('2023/03/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('SeongGyu0407@bamentum.com',   'aaa', '한성규', './DATA/ImgProfil/pf019.jpg', '생명공학 바이오 회사 다니고 있는 한연구원입니다ㅇㅅㅇ', ' ' , TO_DATE('2023/03/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Yeonwoo0806@bamentum.com',    'aaa', '김연우', './DATA/ImgProfil/pf020.jpg', '앞질러보자,넘어서보자,가볍게,우월해지자! 나의 가오는 나만의 내자전거로! ', ' ' , TO_DATE('2023/03/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;

insert into bmt_user values ('aaa@aaa.aaa',    'aaa', '관리자', './DATA/ImgProfil/img021.jpg', '앞질러보자,넘어서보자,가볍게,우월해지자! 나의 가오는 나만의 내자전거로! ', ' ' , TO_DATE('2023/03/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('eee@eee.eee',    'eee', '관리자', './DATA/ImgProfil/img021.jpg', '앞질러보자,넘어서보자,가볍게,우월해지자! 나의 가오는 나만의 내자전거로! ', ' ' , TO_DATE('2023/03/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;

commit;


insert into bmt_post values (10001, 'f', '남천동 벚꽃 라이딩', '오늘 야간 근무라 벚꽃 다 떨어지기 전 남천동 삼익비치쪽 라이딩 하고 왔슴다 ㅎ 지금 절정이니 함 다녀오세유 ㅎ??', './DATA/PostImage/img001.jpeg', TO_DATE('2023/03/29 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com', 11);
insert into bmt_post values (10002, 'f', 'XC하드테일로 오산 마등산 싱글 라이딩 후기', '입문한지 3주 된 것 같은데 싱글라이딩 너무 재밌는 것 같습니다.', './DATA/PostImage/img002.jpg', TO_DATE('2023/03/27 08:12:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ho_won0806@bamentum.com', 12);
insert into bmt_post values (10003, 'f', '자전거를 타게 되는 이유~~~~!!!', '자전거를 타게 되는 이유~~~~~!!! 눈 호강하는 풍경이 기다린다는,,,,,,,,', './DATA/PostImage/img003.jpg', TO_DATE('2023/03/24 21:54:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kwon_Min1102@bamentum.com', 13);
insert into bmt_post values (10004, 'f', '첨으로 평일 나들이~', '날씨가 너무 좋네요 빕숏에 반팔.바막  입고왔는데 넘 좋아요~ 벗꽃들도 넘 이뿌고@@ 5달만에 탓더니 30k왔는데도 손.발 다떨립니다완전 초기화?어요ㅠ', './DATA/PostImage/img004.jpg', TO_DATE('2023/03/29 15:10:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com', 14);
insert into bmt_post values (10005, 'f', '친구 자전거와 찍은사진', '학교운동장에서 밤에 글러브와 자전거를 한번에 찍었어요 ㅋㅋ 좋아하는것들이 같이 있으니 멋지네요!', './DATA/PostImage/img005.jpg', TO_DATE('2023/03/11 23:52:00', 'YYYY/MM/DD HH24:MI:SS'), 'KIHYUN0928@bamentum.com', 15);
insert into bmt_post values (10006, 'f', '동촌 해맞이다리 개나리', '오늘 퇴근길 한컷 봄 봄 봄 봄 봄이왔어요^^', './DATA/PostImage/img006.jpg', TO_DATE('2023/03/14 18:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com', 16);
insert into bmt_post values (10007, 'f', '아라 부부라이딩 날씨 죽이네요', '피드 내용 :?신차구매후 참으로 오랜만에 라이딩 나왔더니 날씨 끝내주네요~ 청라에서 계양까지 달리고 왔네요~ 정서진에서 햄버거 하나 먹고, 아미노바이탈로 에너지 충전하니 좋네요 ㅎ', './DATA/PostImage/img007.jpg', TO_DATE('2023/03/04 14:56:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ha_Eun0103@bamentum.com', 17);
insert into bmt_post values (10008, 'f', '[제주] 봄햇살 라이딩', '낙타등 구간을 지나 유수암 마을에 도착합니다 나이 많은 보호수가 운치있는 마을이에요 날씨가 풀려서 시즌온 글들이 많이 올라오고 있네요  도로에, 산길에 점점 라이더들이 많아지겠죠 상대방을 배려하고 양보하면서 안전한 시즌온 라이딩이 하시길 바랍니다 ', './DATA/PostImage/img008.jpeg', TO_DATE('2023/02/27 20:31:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kyungsoo0723@bamentum.com', 18);
insert into bmt_post values (10009, 'f', '석양이 저무는 곳', '동네 한바퀴 돌면서 여느때와 다름없이 다니던 길목에 멋진 기억이 머물고 있습니다', './DATA/PostImage/img009.jpg', TO_DATE('2023/02/21 16:41:00', 'YYYY/MM/DD HH24:MI:SS'), 'Da-gyeong0711@bamentum.com', 19);
insert into bmt_post values (10010, 'f', '오늘의 라이딩 사진', '부산라이딩에 와서 부산골목에서 본 냥이친구들과 부산 골목골목 사진들을 한번 찍어보았습니다.', './DATA/PostImage/img010.jpg', TO_DATE('2023/02/08 20:24:00', 'YYYY/MM/DD HH24:MI:SS'), 'Hyeong_sun0331@bamentum.com', 10);
insert into bmt_post values (10011, 'f', '[제주] 강풍 라이딩', '바람 덕분에 공기는 깨끗했지만 쌀쌀하고 자전거가 휘청일 정도로 세게 불어댔습니다 역풍을 뚫고 지나가는 자동차 속 사람들이 마냥 부럽게 느껴지기 시작했습니다 멘탈을 부여잡고 속으로 화이팅! 외쳐봅니다 ', './DATA/PostImage/img011.jpeg', TO_DATE('2023/02/20 20:33:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com', 11);
insert into bmt_post values (10012, 'f', '[4대강길]영산강 종주 후기(3/26~27)', '작년 섬진강종주 이후 영산강종주를 하고 왔습니다! 섬진강은 홀로 다녀왔는데, 영산강은 저전거구매하고 4주만에 가는 와이프님과 함께 가서 느긋이 1박2일로 다녀왔어요. ', './DATA/PostImage/img012.jpg', TO_DATE('2023/03/29 14:28:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sangjae0604@bamentum.com', 12);
insert into bmt_post values (10013, 'f', '정서진 한강다녀왔어요.', '국토종주는 하고 싶으나 한번에 몰아서 할 여건은 안되고  나눠서라도 해보자 결심하고 조금씩 실천중인 자린입니다. 큰 마음먹고 당일치기로 정서진부터 광나루인증센터까지 다녀왔습니다. ', './DATA/PostImage/img013.jpg', TO_DATE('2023/03/25 20:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Jung_Hyun0421@bamentum.com', 13);
insert into bmt_post values (10014, 'f', 'Byplorer 여행기 68회', '오늘은 대전브레베 200을 다녀왔습니다. 브레베때는 랜도너 많은 회원분들이 참가를 하는 축제이기도 합니다. 저같이 랜린이가 해야될것은 선배님들 얼굴도장 ㅋㅋ 그래서 오늘은 제야의 고수들과의 인증샷을 얻는것을 오늘 라이딩보다 더 행복함을 느낍니다.^^', './DATA/PostImage/img014.jpg', TO_DATE('2023/03/01 20:19:00', 'YYYY/MM/DD HH24:MI:SS'), 'Semi1108@bamentum.com', 14);
insert into bmt_post values (10015, 'f', '규슈여행후기', '자전거로는 처음가보는 일본여행이였는데 정말 괜찮았어서 다음엔 비행기에 실어서 가볼까 계획중입니다', './DATA/PostImage/img015.jpeg', TO_DATE('2023/03/15 21:26:00', 'YYYY/MM/DD HH24:MI:SS'), 'JiKang1010@bamentum.com', 15);
insert into bmt_post values (10016, 'f', '연휴 라이딩', '연휴라 일하는 차들도 없고 원래 차없는 곳이지만 오늘은 더욱더 없어좋네요 편도 10키로정도라 길도 깨끗하고 멀리갈 시간 없을때는 대부분 여기로 옵니다 ㅎㅎ', './DATA/PostImage/img016.jpeg', TO_DATE('2022/05/03 17:53:00', 'YYYY/MM/DD HH24:MI:SS'), 'ESOO0710@bamentum.com', 16);
insert into bmt_post values (10017, 'f', '유럽 자전거여행 ', '정상에 오르니 다른 풍경이 펼쳐진다. 빙하가 녹아 만들어진 호수들 틈으로 풍력발전기와 댐도 눈에 들어온다. 그리고 반대편 이태리쪽으론 왕좌의게임속 얼음장벽마냥 웅장한 산맥이 우뚝 가로막고 있다.', './DATA/PostImage/img017.jpg', TO_DATE('2022/07/31 15:19:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young-rae0618@bamentum.com', 17);
insert into bmt_post values (10018, 'f', '브롬톤으로 영국시내한바퀴 하고 왔습니다!', '영국의 자전거도로가 너무 잘되어있고 신호도 따로있어서 안전하게 타고다닐 수 있었어요!', './DATA/PostImage/img018.jpg', TO_DATE('2022/04/23 00:17:00', 'YYYY/MM/DD HH24:MI:SS'), 'JunYong0112@bamentum.com', 18);
insert into bmt_post values (10019, 'f', '유럽이 자전거 선진국이긴 선진국이네요. ', '도로 가운데 자전거 도로가 있다는게 참 부럽습니다.', './DATA/PostImage/img019.png', TO_DATE('2022/04/09 23:03:00', 'YYYY/MM/DD HH24:MI:SS'), 'zipgalle1116@bamentum.com', 19);
insert into bmt_post values (10020, 'f', '태국 자덕들의 성지를 소개합니다 -트렉편-', '이렇게 전자팔찌를 태킹 태킹해주면 마법의 문이 열리며...게이트를 지나.. 이렇게 만남의 다리(?)에서 집결하게 됩니다. ', './DATA/PostImage/img020.jpg', TO_DATE('2022/01/16 14:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'SeongGyu0407@bamentum.com', 10);



commit;


--delete from bmt_comment;

insert into bmt_comment values (20001, 10001, ' 지루했지루했  ', TO_DATE('2023/03/29 12:31:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com');
insert into bmt_comment values (20002, 10001, ' 그래픽그래픽  ', TO_DATE('2023/03/29 12:32:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ho_won0806@bamentum.com');
insert into bmt_comment values (20003, 10001, ' 이미친이미친  ', TO_DATE('2023/03/29 12:33:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com');
insert into bmt_comment values (20004, 10001, ' 러닝타러닝타  ', TO_DATE('2023/03/29 12:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kwon_Min1102@bamentum.com');
insert into bmt_comment values (20005, 10001, ' 아바타아바타  ', TO_DATE('2023/03/29 12:35:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com');
insert into bmt_comment values (20006, 10001, ' 상상속상상속  ', TO_DATE('2023/03/29 12:36:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com');
insert into bmt_comment values (20007, 10001, ' 그냥보그냥보  ', TO_DATE('2023/03/29 12:37:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com');
insert into bmt_comment values (20008, 10001, ' 아누가아누가  ', TO_DATE('2023/03/29 12:38:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com');
insert into bmt_comment values (20009, 10001, ' 진짜시진짜시  ', TO_DATE('2023/03/29 12:39:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kyungsoo0723@bamentum.com');
insert into bmt_comment values (20010, 10001, ' 꼭영화꼭영화  ', TO_DATE('2023/03/29 12:30:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com');
insert into bmt_comment values (20011, 10011, ' 표값하표값하  ', TO_DATE('2023/03/29 12:31:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ho_won0806@bamentum.com');
insert into bmt_comment values (20012, 10011, ' 이게어이게어  ', TO_DATE('2023/03/29 12:32:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com');
insert into bmt_comment values (20013, 10011, ' 년만에년만에  ', TO_DATE('2023/03/29 12:33:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kyungsoo0723@bamentum.com');
insert into bmt_comment values (20014, 10011, ' 영화보영화보  ', TO_DATE('2023/03/29 12:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com');
insert into bmt_comment values (20015, 10011, ' 완벽한완벽한  ', TO_DATE('2023/03/29 12:35:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ho_won0806@bamentum.com');
insert into bmt_comment values (20016, 10011, ' 평점낮평점낮  ', TO_DATE('2023/03/29 12:36:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com');
insert into bmt_comment values (20017, 10011, ' 심야영심야영  ', TO_DATE('2023/03/29 12:37:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ha_Eun0103@bamentum.com');
insert into bmt_comment values (20018, 10011, ' 분간억분간억  ', TO_DATE('2023/03/29 12:38:00', 'YYYY/MM/DD HH24:MI:SS'), 'KIHYUN0928@bamentum.com');
insert into bmt_comment values (20019, 10011, ' 지루하지루하  ', TO_DATE('2023/03/29 12:39:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com');
insert into bmt_comment values (20020, 10011, ' 진짜세진짜세  ', TO_DATE('2023/03/29 12:30:00', 'YYYY/MM/DD HH24:MI:SS'), 'KIHYUN0928@bamentum.com');





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


insert into bmt_post values (10031, 'f', '남천동 벚꽃 라이딩', '오늘 야간 근무라 벚꽃 다 떨어지기 전 남천동 삼익비치쪽 라이딩 하고 왔슴다 ㅎ 지금 절정이니 함 다녀오세유 ㅎ??', './DATA/PostImage/img001.jpeg', TO_DATE('2023/03/29 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'aaa@aaa.aaa', 11);
insert into bmt_post values (10032, 'f', '[제주] 강풍 라이딩', '바람 덕분에 공기는 깨끗했지만 쌀쌀하고 자전거가 휘청일 정도로 세게 불어댔습니다 ', './DATA/PostImage/img002.jpeg', TO_DATE('2023/03/29 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'aaa@aaa.aaa', 11);
commit;

-- insert into bmt_follow values (bmt_fw_seq.NEXTVAL, 'ddd@ddd.ddd', 'ccc@ccc.ccc', TO_DATE('2023/03/05 11:05:00', 'YYYY/MM/DD HH24:MI:SS'));
/*
select u.u_email, u.u_nick, u.u_profile, u.u_info, u.u_joindate, b.b_num, b.b_img, b.b_brand, b.b_model 
from bmt_user u, bmt_bic b 
where u.u_email = b.u_email ;

*/