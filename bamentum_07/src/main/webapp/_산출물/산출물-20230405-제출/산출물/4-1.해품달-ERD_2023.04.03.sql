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
insert into bmt_user values ('Ho_won0806@bamentum.com',     'aaa', '김호원', './DATA/ImgProfil/pf001.jpg', '제안에는 또다른 라이더가 있어요 저의 내면아이도 사랑해주세요',               ' ' , TO_DATE('2023/03/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('Kwon_Min1102@bamentum.com',   'aaa', '김권민', './DATA/ImgProfil/pf002.jpg', '목포평광에서 자전거타는 김아무개입니다',                              ' ' , TO_DATE('2023/03/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Sohyun0519@bamentum.com',     'aaa', '구소현', './DATA/ImgProfil/pf003.jpg', '나주에서 자전거타고 상경했답니당v',                                 ' ' , TO_DATE('2023/03/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('KIHYUN0928@bamentum.com',     'aaa', '권기현', './DATA/ImgProfil/pf004.jpg', '판교까지 자전거로 출퇴근하는 샌즈 개발자입니다',                         ' ' , TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Young_Min0531@bamentum.com',  'aaa', '기영민', './DATA/ImgProfil/pf005.png', '청담동에서 자전거로 출퇴근하는 CEO ! ',                            ' ' , TO_DATE('2023/03/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Ha_Eun0103@bamentum.com',     'aaa', '남하은', './DATA/ImgProfil/pf006.jpg', '초절정 미녀 신입입니다~ 잘부탁드립니다',                             ' ' , TO_DATE('2023/03/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Kyungsoo0723@bamentum.com',   'aaa', '문경수', './DATA/ImgProfil/pf007.jpg', '클라이밍과 자전거로 자기관리!', ' ' , TO_DATE('2023/03/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Da-gyeong0711@bamentum.com',  'aaa', '배다경', './DATA/ImgProfil/pf008.png', '자전거 디자인팀장입니다! 잘부탁드립니다!', ' ' , TO_DATE('2023/03/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Hyeong_sun0331@bamentum.com', 'aaa', '심형선', './DATA/ImgProfil/pf009.jpg', '마이스터고에서 자전거로 출퇴근하는 중입니다', ' ' , TO_DATE('2023/03/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Mi_yeon0602@bamentum.com',    'aaa', '안미연', './DATA/ImgProfil/pf010.jpg', '자전거로 해외여행다니는 중이에요 정보공유해요!', ' ' , TO_DATE('2023/03/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Sangjae0604@bamentum.com',    'aaa', '윤상재', './DATA/ImgProfil/pf011.jpg', '자전거 엔지니어 현업을 하고 있는 라이더입니다!', ' ' , TO_DATE('2023/03/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Jung_Hyun0421@bamentum.com',  'aaa', '윤정현', './DATA/ImgProfil/pf012.jpg', '뒤쳐지기싫다,끌려다니기싫다,포기하기싫다! 내가능성을 보여주자!', ' ' , TO_DATE('2023/03/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Semi1108@bamentum.com',       'aaa', '이세미', './DATA/ImgProfil/pf013.jpg', '자전거로 우리나라 국토여행중이에요~', ' ' , TO_DATE('2023/03/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('JiKang1010@bamentum.com',     'aaa', '왕지강', './DATA/ImgProfil/pf014.png', '자전거로 맛집탐방중입니다 냠냠', ' ' , TO_DATE('2023/03/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ESOO0710@bamentum.com',       'aaa', '장이수', './DATA/ImgProfil/pf015.jpg', '자전거 어디까지 예뻐질 수 있는데? 내가 꾸며주지', ' ' , TO_DATE('2023/03/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Young-rae0618@bamentum.com',  'aaa', '주영래', './DATA/ImgProfil/pf016.jpg', '나만의 자전거길을 개척한다! 자전거길 코스 추천은 나에게', ' ' , TO_DATE('2023/03/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('JunYong0112@bamentum.com',    'aaa', '조준용', './DATA/ImgProfil/pf017.jpg', '가정의 화목을 위해 온가족이 다함께 자전거 타고 있습니다', ' ' , TO_DATE('2023/03/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('zipgalle1116@bamentum.com',   'aaa', '최근호', './DATA/ImgProfil/pf018.jpg', '해외에서 유학하는 중에 자전거로 여행다니는 미스터리최입니다', ' ' , TO_DATE('2023/03/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('SeongGyu0407@bamentum.com',   'aaa', '한성규', './DATA/ImgProfil/pf019.jpg', '생명공학 바이오 회사 다니고 있는 한연구원입니다ㅇㅅㅇ', ' ' , TO_DATE('2023/03/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('Yeonwoo0806@bamentum.com',    'aaa', '김연우', './DATA/ImgProfil/pf020.jpg', '앞질러보자,넘어서보자,가볍게,우월해지자! 나의 가오는 나만의 내자전거로! ', ' ' , TO_DATE('2023/03/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;

insert into bmt_user values ('aaa@aaa.aaa',    'aaa', '관리자', './DATA/ImgProfil/img058.jpg', '앞질러보자,넘어서보자,가볍게,우월해지자! 나의 가오는 나만의 내자전거로! ', ' ' , TO_DATE('2023/03/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('eee@eee.eee',    'eee', '관리자', './DATA/ImgProfil/img058.jpg', '앞질러보자,넘어서보자,가볍게,우월해지자! 나의 가오는 나만의 내자전거로! ', ' ' , TO_DATE('2023/03/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;

commit;


insert into bmt_post values (10001, 'f', '남천동 벚꽃 라이딩',                   '?오늘 야간 근무라 벚꽃 다 떨어지기 전 남천동 삼익비치쪽 라이딩 하고 왔슴다 ㅎ<br> <br> 지금 절정이니 함 다녀오세유 ㅎ??', './DATA/PostImage/img001.jpeg', TO_DATE('2023/03/29 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com', 11);
insert into bmt_post values (10002, 'f', 'XC하드테일로 오산 마등산 싱글 라이딩 후기',   '입문한지 3주 된 것 같은데<br> <br>싱글라이딩 너무 재밌는 것 같습니다.', './DATA/PostImage/img002.jpg', TO_DATE('2023/03/27 08:12:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ho_won0806@bamentum.com', 12);
insert into bmt_post values (10003, 'f', '자전거를 타게 되는 이유~~~~!!!',         ' 자전거를 타게 되는 이유~~~~~!!! <br><br>눈 호강하는 풍경이 기다린다는,,,,,,,,', './DATA/PostImage/img003.jpg', TO_DATE('2023/03/24 21:54:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kwon_Min1102@bamentum.com', 13);
insert into bmt_post values (10004, 'f', '첨으로 평일 나들이~',                  '날씨가 너무 좋네요<br>빕숏에 반팔.바막  입고왔는데 넘 좋아요~ <br> 벗꽃들도 넘 이뿌고@@ <br> 5달만에 탓더니 30k왔는데도 손.발 다떨립니다완전 초기화?어요ㅠ', './DATA/PostImage/img004.jpg', TO_DATE('2023/03/29 15:10:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com', 14);
insert into bmt_post values (10005, 'f', '친구 자전거와 찍은사진',                 '학교운동장에서 밤에 글러브와 자전거를 한번에 찍었어요 ㅋㅋ <br><br>좋아하는것들이 같이 있으니 멋지네요!', './DATA/PostImage/img005.jpg', TO_DATE('2023/03/11 23:52:00', 'YYYY/MM/DD HH24:MI:SS'), 'KIHYUN0928@bamentum.com', 15);
insert into bmt_post values (10006, 'f', '동촌 해맞이다리 개나리',                 '오늘 퇴근길 한컷 <br><br>봄 봄 봄 봄 봄이왔어요^^', './DATA/PostImage/img006.jpg', TO_DATE('2023/03/14 18:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com', 16);
insert into bmt_post values (10007, 'f', '아라 부부라이딩 날씨 죽이네요',            '?신차구매후 참으로 오랜만에 라이딩 나왔더니<br>날씨 끝내주네요~ <br>청라에서 계양까지 달리고 왔네요~ <br>정서진에서 햄버거 하나 먹고, 아미노바이탈로 에너지 충전하니 좋네요 ㅎ', './DATA/PostImage/img007.jpg', TO_DATE('2023/03/04 14:56:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ha_Eun0103@bamentum.com', 17);
insert into bmt_post values (10008, 'f', '[제주] 봄햇살 라이딩',                 '낙타등 구간을 지나 유수암 마을에 도착합니다 나이 많은 보호수가 운치있는 마을이에요 <br>날씨가 풀려서 시즌온 글들이 많이 올라오고 있네요  <br>도로에, 산길에 점점 라이더들이 많아지겠죠 <br>상대방을 배려하고 양보하면서 안전한 시즌온 라이딩이 하시길 바랍니다 ', './DATA/PostImage/img008.jpeg', TO_DATE('2023/02/27 20:31:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kyungsoo0723@bamentum.com', 18);
insert into bmt_post values (10009, 'f', '석양이 저무는 곳',                     '동네 한바퀴 돌면서 <br>여느때와 다름없이 다니던 길목에 <br>멋진 기억이 머물고 있습니다', './DATA/PostImage/img009.jpg', TO_DATE('2023/02/21 16:41:00', 'YYYY/MM/DD HH24:MI:SS'), 'Da-gyeong0711@bamentum.com', 19);
insert into bmt_post values (10010, 'f', '오늘의 라이딩 사진',                   '부산라이딩에 와서 부산골목에서 본 냥이친구들과 <br>부산 골목골목 사진들을 한번 찍어보았습니다.', './DATA/PostImage/img010.jpg', TO_DATE('2023/02/08 20:24:00', 'YYYY/MM/DD HH24:MI:SS'), 'Hyeong_sun0331@bamentum.com', 10);
insert into bmt_post values (10011, 'f', '[제주] 강풍 라이딩',                   '바람 덕분에 공기는 깨끗했지만 쌀쌀하고 자전거가 휘청일 정도로 세게 불어댔습니다 <br>역풍을 뚫고 지나가는 자동차 속 사람들이 마냥 부럽게 느껴지기 시작했습니다 <br>멘탈을 부여잡고 속으로 화이팅! 외쳐봅니다 ', './DATA/PostImage/img011.jpeg', TO_DATE('2023/02/20 20:33:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com', 11);
insert into bmt_post values (10012, 'f', '[4대강길]영산강 종주 후기(3/26~27)',     '작년 섬진강종주 이후 영산강종주를 하고 왔습니다! <br>섬진강은 홀로 다녀왔는데, <br>영산강은 저전거구매하고 4주만에 가는 와이프님과 함께 가서 느긋이 1박2일로 다녀왔어요. ', './DATA/PostImage/img012.jpg', TO_DATE('2023/03/29 14:28:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sangjae0604@bamentum.com', 12);
insert into bmt_post values (10013, 'f', '정서진 한강다녀왔어요.',                 '국토종주는 하고 싶으나 한번에 몰아서 할 여건은 안되고  <br>나눠서라도 해보자 결심하고 조금씩 실천중인 자린입니다. <br>큰 마음먹고 당일치기로 정서진부터 광나루인증센터까지 다녀왔습니다. ', './DATA/PostImage/img013.jpg', TO_DATE('2023/03/25 20:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Jung_Hyun0421@bamentum.com', 13);
insert into bmt_post values (10014, 'f', 'Byplorer 여행기 68회',               '오늘은 대전브레베 200을 다녀왔습니다. <br>브레베때는 랜도너 많은 회원분들이 참가를 하는 축제이기도 합니다. <br>저같이 랜린이가 해야될것은 선배님들 얼굴도장 ㅋㅋ <br>그래서 오늘은 제야의 고수들과의 인증샷을 얻는것을 오늘 라이딩보다 더 행복함을 느낍니다.^^', './DATA/PostImage/img014.jpg', TO_DATE('2023/03/01 20:19:00', 'YYYY/MM/DD HH24:MI:SS'), 'Semi1108@bamentum.com', 14);
insert into bmt_post values (10015, 'f', '규슈여행후기',                        '자전거로는 처음가보는 일본여행이였는데 <br>정말 괜찮았어서 다음엔 비행기에 실어서 가볼까 <br>계획중입니다', './DATA/PostImage/img015.jpeg', TO_DATE('2023/03/15 21:26:00', 'YYYY/MM/DD HH24:MI:SS'), 'JiKang1010@bamentum.com', 15);
insert into bmt_post values (10016, 'f', '연휴 라이딩',                        '연휴라 일하는 차들도 없고 원래 차없는 곳이지만 <br>오늘은 더욱더 없어좋네요 <br>편도 10키로정도라 길도 깨끗하고 <br>멀리갈 시간 없을때는 대부분 여기로 옵니다 ㅎㅎ', './DATA/PostImage/img016.jpeg', TO_DATE('2022/05/03 17:53:00', 'YYYY/MM/DD HH24:MI:SS'), 'ESOO0710@bamentum.com', 16);
insert into bmt_post values (10017, 'f', '유럽 자전거여행 ',                     '정상에 오르니 다른 풍경이 펼쳐진다. <br>빙하가 녹아 만들어진 호수들 틈으로 풍력발전기와 댐도 눈에 들어온다. <br>그리고 반대편 이태리쪽으론 왕좌의게임속 얼음장벽마냥 <br>웅장한 산맥이 우뚝 가로막고 있다.', './DATA/PostImage/img017.jpg', TO_DATE('2022/07/31 15:19:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young-rae0618@bamentum.com', 17);
insert into bmt_post values (10018, 'f', '브롬톤으로 영국시내한바퀴 하고 왔습니다!',     '영국의 자전거도로가 너무 잘되어있고 <br>신호도 따로있어서 안전하게 타고다닐 수 있었어요!', './DATA/PostImage/img018.jpg', TO_DATE('2022/04/23 00:17:00', 'YYYY/MM/DD HH24:MI:SS'), 'JunYong0112@bamentum.com', 18);
insert into bmt_post values (10019, 'f', '유럽이 자전거 선진국이긴 선진국이네요. ',      '도로 가운데 자전거 도로가 있다는게 참 부럽습니다.', './DATA/PostImage/img019.png', TO_DATE('2022/04/09 23:03:00', 'YYYY/MM/DD HH24:MI:SS'), 'zipgalle1116@bamentum.com', 19);
insert into bmt_post values (10020, 'f', '태국 자덕들의 성지를 소개합니다 -트렉편-',     '이렇게 전자팔찌를 태킹 태킹해주면 마법의 문이 열리며...게이트를 지나.. <br>이렇게 만남의 다리(?)에서 집결하게 됩니다. ', './DATA/PostImage/img020.jpg', TO_DATE('2022/01/16 14:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'SeongGyu0407@bamentum.com', 10);

insert into bmt_post values (10021, 'f', '정읍 벚꽃라이딩', '올해 74세 되신 킹왕짱 체력의 소유자이신 아버지랑 복흥 갈재 올라가는 <br>길에 한컷 내장산 하산하는 길에 한컷 찍어봤습니다 모두 즐라하세요 ~', './DATA/PostImage/img021.jpg', TO_DATE('2023/03/31 02:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com', 10);
insert into bmt_post values (10022, 'f', '대만에 왓습니다', '?여긴 고풍스러운 자전거도 많네요(전시용)<br>독특해서 보여드리고 싶어서요<br>대만에서 자전거용품 뭐사가면 소문날지<br>추천좀 부탁드려요', './DATA/PostImage/img022.jpg', TO_DATE('2023/03/30 22:58:00', 'YYYY/MM/DD HH24:MI:SS'), 'zipgalle1116@bamentum.com', 10);
insert into bmt_post values (10023, 'f', '베트남 Phu Quoc 섬', '?베트남 호치민에 살고 있는 교민입니다.   ^^<br>금요일 저녁 Phu Quoc 섬에 도착해서, 일요일에 호치민으로 복귀하는 일정이었습니다. <br>토요일 오전에 자전거를 빌렸는데, 일요일에 자전거샵이 오픈하지 않아서... 토요일 오후 5시까지 반납해야만 했네요. <br>결국 시간에 쫓겨서 섬을 절반만 둘러 보았습니다 ~ ', './DATA/PostImage/img023.jpg', TO_DATE('2023/03/22 09:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'Hyeong_sun0331@bamentum.com', 10);
insert into bmt_post values (10024, 'f', '[유럽]Grosse Scheidegg 라이딩', '역시 스위스는 날씨가 모든걸 좌우하는 곳이란걸 다시한번 느꼈습니다. <br>날씨가 않좋을때는 참 우중충한데 화창한 날의 스위스는 콧노래가 절로 나오는 그런 곳이네요.  ', './DATA/PostImage/img024.jpg', TO_DATE('2023/02/10 17:23:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com', 10);
insert into bmt_post values (10025, 'f', '매화꽃 만발한 섬진강 자전거길 종주', '이번 여행은 섬진강 종주의 목적이 있었는데요.<br>섬진강을 따라가며 #광양매화꽃축제 #아름다운강변 #평화롭고아늑한시골풍경 등을 고루 감상할 수 있는 행복한 시간들이었습니다.<br>다만, 갈수록 높아지는 고도와 맞바람이 속도를 더디게 했지만, 아름다운 경치에 젖어 힘든 줄을 몰랐어요.<br>날씨도 쾌청해 자연의 모습을 생눈으로 보고 싶어 고글도 벗고 달렸어요...<br>산, 강, 하늘, 꽃, 겨울잠에서 깨어나 봄을 맞이하는 과수원, 들녁, 농촌...<br>모두가 너무 아름답고 아름다웠어요..<br>', './DATA/PostImage/img025.jpg', TO_DATE('2023/03/19 18:43:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com',    10);
insert into bmt_post values (10026, 'f', '[전라광주]고흥 거금도', '누가 뒤떨어졌다냐?<br>7명중 하나 안 보이믄 쉬어 갑니다.<br>이런 간판도 오늘 눈여겨 봅니다.', './DATA/PostImage/img026.jpg', TO_DATE('2023/03/11 20:31:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ho_won0806@bamentum.com',     10);
insert into bmt_post values (10027, 'f', '호수와 바다가 만나는곳... 화성호 한바퀴 순환코스', '총 54km 3시간 30분 걸린듯 하네요', './DATA/PostImage/img027.jpg', TO_DATE('2023/03/08 17:31:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kwon_Min1102@bamentum.com',   10);
insert into bmt_post values (10028, 'f', '국토종주 무사히 종료합니다.', '친형과 함께 좋은날씨의 연속함으로 633 국종 금일 마무리 하였습니다.<br>안전하지만 끝없이 이어지는 자도가 가장 힘들었네요.<br>도로에서만 탔던 로드자전거에 적응되어서 그런지,,,<br>자도의 도로 질감은 피로도가 많이 쌓이고 추진력도 많이 떨어지는듯 합니다.<br>열심히 열정을 가지고 탔던 자전거를 몇년간 뜸하게 보내왔던 제 자신을 다스리며 다시 즐겨보려 합니다.<br>자출사 모든 회원님들의 안라 기원드립니다.<br>감사합니다.<br>', './DATA/PostImage/img028.jpg', TO_DATE('2023/03/10 21:36:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com',     10);
insert into bmt_post values (10029, 'f', '남아공 케이프 타운 2탄', '여기는 보통 하루 일과과 7시부터 4시<br>특히 금요일은 7시부터 2시에 끝납니다.<br>대체 얼마나 선진국인지 ㅎㅎ.<br>그만큼 할 것도 없고 빈부의 격차도 언청나지만 특히 밤에는 돌아다니는 사람도 없기 때문에<br>대부분 하루를 일찍 시작하고 일찍마치네요<br>주말에 시내나 해안도로를 보게되면 등산 또는 자전거 타는 사람들이 엄청 많습니다.<br>특히나 자전거는 거의 차와 동일시 되기 때문에 시내에 한해서는 <br>좌회전 가능하고 자전거 전용도로도 차선과 나란히 하고 있습니다 <br>', './DATA/PostImage/img029.jpg', TO_DATE('2022/04/24 15:16:00', 'YYYY/MM/DD HH24:MI:SS'), 'KIHYUN0928@bamentum.com',     10);
insert into bmt_post values (10030, 'f', '베트남 / 무이네 -> 냐짱', '베트남에 거주하는 교민입니다. ', './DATA/PostImage/img030.jpg', TO_DATE('2022/09/10 09:37:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com',  10);
insert into bmt_post values (10031, 'f', '캄보디아에서의 자전거 생활', '캄보디아 생활한지 벌써 아홉 달이나 지났습니다...처음 mtb를 타다 지금은 로드로 바꾼지 한 5개월 됐습니다. <br><br>주말이면 이곳 저곳 돌아다니는게 저의 가장 큰 행복입니다. <br><br>최근 캄보디아도 자전거 인구가 증가하는 추세라 도로 곳곳에서 라이딩을 즐기는 사람들이 많이 보이곤 합니다.<br><br>즐거운 하루 보내세요^^<br>', './DATA/PostImage/img031.jpg', TO_DATE('2022/07/10 11:35:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ha_Eun0103@bamentum.com',     10);
insert into bmt_post values (10032, 'f', '연휴 라이딩', '일본은 지금 연휴 기간으로 사람마다 10연휴 혹은 3연휴를 보내고 있는 기간입니다<br>파워미터도 달고 첫 주간라이딩다녀왔습니디<br>', './DATA/PostImage/img032.jpeg', TO_DATE('2022/05/03 17:53:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kyungsoo0723@bamentum.com',   10);
insert into bmt_post values (10033, 'f', '자전거 업힐의 성지, Passo dello Stelvio 2차 등반', '주말에 스텔비오 날씨가 좋아서 스텔비오에 다시 다녀왔습니다. <br>스텔비오는 11월이면 길을 닫기 때문에 그전에 꼭 한번 다녀와야지 생각했는데,<br> 갑자기 날씨가 풀려서 다녀왔습니다 ㅎㅎ<br>', './DATA/PostImage/img033.jpg', TO_DATE('2021/10/26 20:32:00', 'YYYY/MM/DD HH24:MI:SS'), 'Da-gyeong0711@bamentum.com',  10);
insert into bmt_post values (10034, 'f', '스위스의 명산, 리기산을 자전거로 등반하다.', '첫번째 라이딩에선 중간에 길을 잘못들어 등산로에서 끌바를 시전한 끝에 <br>겨우겨우 리기산 정상에 올라갔고,<br>두번째 라이딩에선 길 잃지 않고 끌바도 없이 <br>(물론 엄청나게 많은 수의 휴식을 취했습니다) 리기산 정상까지 올라갔네요. <br>같이 갔던 친구중 한명은 도저히 못가겠다며 정상을 얼마 안남기고 돌려 내려가 버렸습니다. <br>', './DATA/PostImage/img034.jpg', TO_DATE('2021/09/16 21:28:00', 'YYYY/MM/DD HH24:MI:SS'), 'Hyeong_sun0331@bamentum.com', 10);
insert into bmt_post values (10035, 'f', '북유럽 핀란드 신혼여행라이딩', '2년전 신혼여행을 북유럽으로 로드를 챙겨가서 경험하고<br>코로나가 끝나면 지인들과 함께 해외라이딩을 계획중에 있습니다<br>', './DATA/PostImage/img035.jpg', TO_DATE('2021/08/16 19:57:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com',    10);
insert into bmt_post values (10036, 'f', '꽃피는 산골 장성진원-황룡강 소식', '첨단-상림4거리-백토고개-고산서원-진원면-밤실고개-<br>황룡대교-오룡교-초지마을-푸른솔cc-능성-사창  37km<br>출근길에 본 봄소식을 올립니다.<br>', './DATA/PostImage/img036.jpg', TO_DATE('2023/03/24 10:14:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sangjae0604@bamentum.com',    10);
insert into bmt_post values (10037, 'f', '본격 시즌온준비 마지막', '오늘은 낮에일이있어서<br>본격시즌온 준비 마지막은 정비..<br>올 한해도 무탈하게 달려보자 ㅎ<br>', './DATA/PostImage/img037.jpeg', TO_DATE('2023/03/19 09:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'Jung_Hyun0421@bamentum.com',  10);
insert into bmt_post values (10038, 'f', '영산강 하구둑에서 유스퀘어 까지 라이딩', '오늘 처음으로 징거리 도전이고 광주권을 벗어나서 처음 도전 해봤네요.<br>영산강 하구둑에서 느러지 전망대를 거쳐 죽산보와 싱촌보를 지나서<br>터미널에 치를 세워놔서 유스퀘어 까지 장징 총 5시간이 넘게 ㅎㅎㅎ <br>라이딩했네요. 뿌듯하네요.<br>다음번엔 담양댐 까지 한번 도전을 ㅎㅎㅎ<br>', './DATA/PostImage/img038.jpg', TO_DATE('2023/03/11 18:10:00', 'YYYY/MM/DD HH24:MI:SS'), 'Semi1108@bamentum.com',       10);
insert into bmt_post values (10039, 'f', '날 풀린 김에 목포에서 광주까지 라이딩을 가봤습니다', '어제 갔는데 깜빡 잊는 바람에 오늘 쓰게 되네요. <br>3시 반 정도 시작해서 집에 도착하니 8시가 되더군요. 아직은 해가 지면 춥습니다...', './DATA/PostImage/img039.jpg', TO_DATE('2023/03/01 18:46:00', 'YYYY/MM/DD HH24:MI:SS'), 'JiKang1010@bamentum.com',     10);
insert into bmt_post values (10040, 'f', '장성황룡강 자전거길 공사구간안내', '장성황룡강자전거길중 천변좌로를 새로 말끔히 단장했기에<br>어제 답사를 했읍니다. 지도상 청색선이 기존이 도로이고<br>임곡->오룡교에서  빨간색좌로로 직진하면 쾌적하게 달릴수<br>있을것 같네요 다리가 거의 완공된듯하여 곧 개통될것 같습니다.<br>', './DATA/PostImage/img040.jpg', TO_DATE('2023/02/13 12:43:00', 'YYYY/MM/DD HH24:MI:SS'), 'ESOO0710@bamentum.com',       10);

insert into bmt_post values (10041, 'f', '전남이 따스하지만', '아침6시 라이딩은 춥네요.', './DATA/PostImage/img041.jpg', TO_DATE('2023/02/09 11:42:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kwon_Min1102@bamentum.com',   10);
insert into bmt_post values (10042, 'f', '북한강 자전거길 벚꽃은 ', '어제 보다 20 % 더 폈네여 ..', './DATA/PostImage/img042.jpg', TO_DATE('2023/03/31 09:08:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sohyun0519@bamentum.com',     10);
insert into bmt_post values (10043, 'f', '자출길에 너구리 봤어유', '너구리 봤어유 3년 전에 보고 잘못본건가 했는데<br>아직도 잘 살아있네요<br>누가 키우다 버린건가요?<br>사진이 무섭게 나와서 그렇지 음청 귀여워요<br>먹을게 있었으면 주고 싶을 정도로요^^<br>', './DATA/PostImage/img043.jpeg', TO_DATE('2023/03/29 22:36:00', 'YYYY/MM/DD HH24:MI:SS'), 'KIHYUN0928@bamentum.com',     10);
insert into bmt_post values (10044, 'f', '국토종주길에도 흐드러지게 핀 벚꽃~', '구미 국토종주길 낙동강변도로입니다,,,<br>잠깐 왔다가는 벚꽃,,, <br>낮도 좋지만, 야라에서 즐기는 눈호강은 곱빼기입니다^^<br>', './DATA/PostImage/img044.jpg', TO_DATE('2023/03/26 10:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young_Min0531@bamentum.com',  10);
insert into bmt_post values (10045, 'f', '대전 갑천 벚꽃만개', '라이딩겸 친구들만나러 대전내려갔더니<br>벚꽃이 활짝 ?? ??<br>서울은 이제 꽃망울 올라오던데<br>엑스포 구경도하고 라이딩, 꽃놀이까지 잘하고 가요', './DATA/PostImage/img045.jpg', TO_DATE('2023/03/26 17:56:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ha_Eun0103@bamentum.com',     10);
insert into bmt_post values (10046, 'f', '대구 달성습지생태학습관 개나리 만개했네요', '안녕하세요 최근 중고로 자전거 입문한 왕왕초보입니다??<br>어제 혼자 운동삼아 다녀온곳이 너무 예뻐서요~', './DATA/PostImage/img046.jpg', TO_DATE('2023/03/22 21:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Kyungsoo0723@bamentum.com',   10);
insert into bmt_post values (10047, 'f', '자전거 대신 등산 다녀왔어요', '이번에 자전거 대신 등산 다녀왔어요  <br>정상에서 보는 풍정 역시 최고네요  <br>아직 등산 초보지만 천천히 심호흡 하면서 올라가다 보니까 <br>이맛에 등산도 다니는 구나 싶습니다 <br>내셔널지오그래픽 프로모션 하길래 짐벌캠 사둔게 있는데 이럴때 써먹네요  <br>영상도 찍으면서 돌아다니는데 화질이 진짜 최고에요 <br>가볍고 찍기도 쉽고 흔들림 없어서 좋네요  <br>좋은풍경 보고 왔으니 한주 또 잘 버텨봐야겠습니다  <br>', './DATA/PostImage/img047.jpg', TO_DATE('2023/03/20 21:00:00', 'YYYY/MM/DD HH24:MI:SS'), 'Da-gyeong0711@bamentum.com',  10);
insert into bmt_post values (10048, 'f', '동촌 해맞이다리 개나리', '오늘 퇴근길 한컷<br>봄 봄 봄 봄 봄이왔어요^^<br>', './DATA/PostImage/img048.jpg', TO_DATE('2023/03/14 14:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'Hyeong_sun0331@bamentum.com', 10);
insert into bmt_post values (10049, 'f', '새만금 남북대교', '새만금 남북도로를 잇는 대교 공사중<br><br>왼쪽은 새만금 잼버리 2023 개최지방향<br><br>오른쪽은 내가 사는 전북 군산<br>', './DATA/PostImage/img049.jpg', TO_DATE('2023/03/13 09:34:00', 'YYYY/MM/DD HH24:MI:SS'), 'Mi_yeon0602@bamentum.com',    10);
insert into bmt_post values (10050, 'f', '친구와 롱비치 라이딩', '롱비치 항구 뷰포인트에 올라 기념사진 찍어봤네요<br>자덕의 천국이라는 이곳에서 <br>올 한해 열심히 천국을 맛보렵니다.<br>종종 사진으로 소식전하겠습니다.<br>그럼 언제나 안라, 즐라하시구요~<br>', './DATA/PostImage/img050.jpg', TO_DATE('2023/02/26 16:46:00', 'YYYY/MM/DD HH24:MI:SS'), 'Sangjae0604@bamentum.com',    10);
insert into bmt_post values (10051, 'f', '두물머리', '함께온 가족과 연인들이 많네요', './DATA/PostImage/img051.jpg', TO_DATE('2023/02/21 06:49:00', 'YYYY/MM/DD HH24:MI:SS'), 'Jung_Hyun0421@bamentum.com',  10);
insert into bmt_post values (10052, 'f', '시즌 온~~~', '낙차사고로 척추골절되고 반년만에 야외라이딩~~ <br>10키로 뿔어서 져지고 빕이고 안들어가서 잠바입고 돌아다니는데 자유롭고 좋네요<br>체력이 거의초기화되서 20키로만 타도 헉헉..<br>', './DATA/PostImage/img052.jpg', TO_DATE('2023/02/06 09:24:00', 'YYYY/MM/DD HH24:MI:SS'), 'Semi1108@bamentum.com',       10);
insert into bmt_post values (10053, 'f', '후쿠오카에 자전거 타고 있습니다', '그저께 부산항에서 비틀호 타고 건너왔습니다 <br>자전거로 맨날 움직이다 일본에 한달에 한번씩 올때 마다 뚜벅이 하려니 <br>답답하기도 하고 여기 공공교통요금이 너무 비싸서 도선료나 그거나 비슷해서 <br>한번 싣고와 봤는데 좋네여 ㅎㅎ<br>', './DATA/PostImage/img053.jpg', TO_DATE('2023/02/16 08:39:00', 'YYYY/MM/DD HH24:MI:SS'), 'JiKang1010@bamentum.com',     10);
insert into bmt_post values (10054, 'f', '일본 시즈오카현 하마마츠시 하마나호수 일주', '일본 7대1주중 하나인 하마이치라는 하마나호수를 도는 코스를 다녀왔습니다<br>어제 미친듯 비오고 오늘 하늘은 깨끗했는데<br>바람이.... 최대풍속 32킬로..ㅋㅋㅋ 방풍림<br>나무를 지나고 ㄴㅏ무사이를 지날때마다<br>자전거가 요동을 칩니다<br>가파른 내릭막을 내려가는데 페달을<br>밟는데 허벅지가 터집니다<br>역풍과 싸우다 무사히 귀환하여 사우나에서 피로풀고<br>겨우 집에 왔네요...<br>그냥 태풍이라 말해줬으면 안탔을지도...<br><br>', './DATA/PostImage/img054.jpeg', TO_DATE('2021/05/02 18:38:00', 'YYYY/MM/DD HH24:MI:SS'), 'ESOO0710@bamentum.com',       10);
insert into bmt_post values (10055, 'f', '주말 가족 자전거', '간만에 바람 없는 맑은 날씨에 샤방 자전거를 즐겨보아요<br>캘리포니아 몬테레이 에서....', './DATA/PostImage/img055.jpg', TO_DATE('2021/03/22 08:14:00', 'YYYY/MM/DD HH24:MI:SS'), 'Young-rae0618@bamentum.com',  10);
insert into bmt_post values (10056, 'f', '런던에서 만났던 자전거들..', '전엔 자전거에 큰 관심이 없었어서 몰랐었는데<br>정말 다양한 종류의 자전거들이 있더라구요<br>몇장 찍은 자전거 사진들 올려 봅니다 ^^;<br>', './DATA/PostImage/img056.jpg', TO_DATE('2023/03/24 20:08:00', 'YYYY/MM/DD HH24:MI:SS'), 'JunYong0112@bamentum.com',    10);
insert into bmt_post values (10057, 'f', '파리 자전거 도로', '출장 왔은데 요즘 이 동네 자전거 길 새로 깔고 있네요. <br>보니 정말 하려면 이정도는 해야 하는 거 아닌가 해서 사진 찍고 올려 봅니다.<br> 자전거와 전동들이 같이 다니는데 차량은 절대로 들어오지 못하네요.<br>', './DATA/PostImage/img057.jpg', TO_DATE('2023/03/22 18:06:00', 'YYYY/MM/DD HH24:MI:SS'), 'zipgalle1116@bamentum.com',   10);
insert into bmt_post values (10058, 'f', '프랑스 자전거 여행', '숙소도착 후 체크아웃하고, 잔차는 바퀴 분해하여 자동차에 싣고 알프스 프로방스 방향으로 이동을 시작했다.<br>오전 라이딩만하고 투르Tours 로 이동하는데 날씨도 점점 좋아지고 아쉬운 마음에...분풀이 라이딩 한번 더 진행한다.<br>메슬레 듀-만느에서 차세우고 바퀴장착 후 라-플레슈 부근까지 그냥 직선길을 시원하게 쏘았다. 낙타등 구간 ...이지만 왜 오르막만 있는 것 같은지ㅎㅎㅎ<br>', './DATA/PostImage/img058.jpg', TO_DATE('2023/03/11 17:25:00', 'YYYY/MM/DD HH24:MI:SS'), 'SeongGyu0407@bamentum.com',   10);
insert into bmt_post values (10059, 'f', '벚꽃 라이딩', '어제 휴무날 친구와 <br>벚꽃 라이딩...<br>코스는 구례구역에서 곡성예성캠핑장까지..<br>', './DATA/PostImage/img059.jpg', TO_DATE('2023/03/30 09:27:00', 'YYYY/MM/DD HH24:MI:SS'), 'Yeonwoo0806@bamentum.com',    10);
insert into bmt_post values (10060, 'f', '여기는 어디일까요?', '서울시 한강공원 입니다', './DATA/PostImage/img060.jpg', TO_DATE('2023/03/30 15:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com',    10);



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

insert into bmt_bic values ('WSBC021015577T',        'Mi_yeon0602@bamentum.com',       './DATA/bic_num_img/bic_num/1-1.png',   '스페셜라이즈드',  '스페셜라이즈드 타막 SL6');
insert into bmt_bic values ('WTU189C0817T',          'Young_Min0531@bamentum.com',     './DATA/bic_num_img/bic_num/2-1.jpeg',  '트랙',  '트랙 마린7');
insert into bmt_bic values ('WTU190C7684T',          'Kyungsoo0723@bamentum.com',      './DATA/bic_num_img/bic_num/3-1.jpg',   '트렉',  '트렉 마린 7');
insert into bmt_bic values ('WSBC001002294R',        'Sangjae0604@bamentum.com',       './DATA/bic_num_img/bic_num/4-1.jpg',   '알레',  '알레 스프린트 2019 피터사간 에디션 블랙');
insert into bmt_bic values ('STR23D25221070081T',    'Yeonwoo0806@bamentum.com',       './DATA/bic_num_img/bic_num/5-1.jpg',   '스캇',  '스캇 에딕트 rc 30');
insert into bmt_bic values ('wto017ct0074m0207',     'Gyu_nam1211@bamentum.com',       './DATA/bic_num_img/bic_num/6-1.jpg',   '트렉',  '트렉 에몬다 sl6 18년식');
insert into bmt_bic values ('JG22120672',            'SeongGyu0407@bamentum.com',      './DATA/bic_num_img/bic_num/7-2.jpg',   '콘스탄틴',  '콘스탄틴 버나드');
insert into bmt_bic values ('JMH220404156',          'Kwon_Min1102@bamentum.com',      './DATA/bic_num_img/bic_num/8-2.jpg',   '티티카카',  '티티카카 플라이트 p8 v');
insert into bmt_bic values ('236325221900481',       'Sohyun0519@bamentum.com',        './DATA/bic_num_img/bic_num/9-1.jpeg',  '모터벨로',  '모터벨로 TX8 PRO');
insert into bmt_bic values ('B1A114504S WBK946971S', 'KIHYUN0928@bamentum.com',        './DATA/bic_num_img/bic_num/10-1.jpg',  '비앙키',  '비앙키 아리아 디스크');
insert into bmt_bic values ('XD2112APOO31C',         'Ha_Eun0103@bamentum.com',        './DATA/bic_num_img/bic_num/11-1.jpg',  '엘파마',  '엘파마 페이스6100');
insert into bmt_bic values ('AAAAA',                 'Da-gyeong0711@bamentum.com',     './DATA/bic_num_img/bic_num/12-1.jpg',  '스캇',  '스캇 스케일 20');
insert into bmt_bic values ('WTU256XC0146T',         'Hyeong_sun0331@bamentum.com',    './DATA/bic_num_img/bic_num/13-1.jpg',  '듀얼스포츠3',  '듀얼스포츠3 5세대');
insert into bmt_bic values ('IBDFSD17KA1732',        'Jung_Hyun0421@bamentum.com',     './DATA/bic_num_img/bic_num/14-1.jpg',  '슈윈',  '슈윈 105 풀카본 림 로드');
insert into bmt_bic values ('BM22100830',            'Semi1108@bamentum.com',          './DATA/bic_num_img/bic_num/15-1.jpg',  '알톤',  '2023 알톤 RCT 엔도24');
insert into bmt_bic values ('JMH201203868',          'JiKang1010@bamentum.com',        './DATA/bic_num_img/bic_num/16-1.jpg',  '알톤',  '알톤 샌드스톤 2.5D');
insert into bmt_bic values ('LK210330577',           'ESOO0710@bamentum.com',          './DATA/bic_num_img/bic_num/17-1.jpeg', '스타카토',  '스타카토 베뉴 MK5 (STACATO VENNUE MK5) 20인치');
insert into bmt_bic values ('AH20M 165918',          'Young-rae0618@bamentum.com',     './DATA/bic_num_img/bic_num/18-1.jpg',  '스타카토',  '스타카토 슈퍼노바 650B');
insert into bmt_bic values ('Y5C05217',              'JunYong0112@bamentum.com',       './DATA/bic_num_img/bic_num/19-1.jpg',  '스마트',  '스마트 거번 H27');
insert into bmt_bic values ('P19CE9110084',          'zipgalle1116@bamentum.com',      './DATA/bic_num_img/bic_num/20-1.jpg',  '스컬트라',  '스컬트라 100 디스크');

commit;


insert into bmt_post values (10501, 'f', '남천동 벚꽃 라이딩', '오늘 야간 근무라 벚꽃 다 떨어지기 전 남천동 삼익비치쪽 라이딩 하고 왔슴다 ㅎ 지금 절정이니 함 다녀오세유 ㅎ??', './DATA/PostImage/img001.jpeg', TO_DATE('2023/03/29 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'aaa@aaa.aaa', 11);
insert into bmt_post values (10502, 'f', '[제주] 강풍 라이딩', '바람 덕분에 공기는 깨끗했지만 쌀쌀하고 자전거가 휘청일 정도로 세게 불어댔습니다 ', './DATA/PostImage/img002.jpg', TO_DATE('2023/03/29 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'aaa@aaa.aaa', 11);
insert into bmt_post values (10510, 'f', ' 혹시 XX근처에 자전고 두고가신분?? ', ' 오늘 한강 산책 갔다가 제가 타던 자전거랑 똑같은 자전거가 있길래 유심히 보고 있었는데요<br> 매점 아주머니께서 며칠동안 자전거 주인이 안 나타난다고 하시더라구요!! <br> 혹시 바멘텀에 차대번호 등록하신분이라면 이 글 보고 연락주실 거 같아서 글 올려봐요!! ', './DATA/PostImage/bamen003.jpg', TO_DATE('2023/04/02 15:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com',    10);
commit;

-- insert into bmt_follow values (bmt_fw_seq.NEXTVAL, 'ddd@ddd.ddd', 'ccc@ccc.ccc', TO_DATE('2023/03/05 11:05:00', 'YYYY/MM/DD HH24:MI:SS'));
/*
select u.u_email, u.u_nick, u.u_profile, u.u_info, u.u_joindate, b.b_num, b.b_img, b.b_brand, b.b_model 
from bmt_user u, bmt_bic b 
where u.u_email = b.u_email ;

*/







insert into bmt_user values ('bbb@bamentum.com', 'aaa', '홍아름', './DATA/ImgProfil/pf000.jpg', '안녕하세요 아름다운 아름입니다', ' ' , TO_DATE('2023/03/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ccc@bamentum.com', 'aaa', '심이슬', './DATA/ImgProfil/pf001.jpg', '자전거를 배운지 얼마 안됐어요',               ' ' , TO_DATE('2023/03/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('ddd@bamentum.com', 'aaa', '류이레', './DATA/ImgProfil/pf002.jpg', '자전거령력 4년차 과장입니다',                              ' ' , TO_DATE('2023/03/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('zzz@bamentum.com', 'aaa', '안송이', './DATA/ImgProfil/pf003.jpg', '자전거로 다이어트 효과를 볼 수 있을까요?',                                 ' ' , TO_DATE('2023/03/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('fff@bamentum.com', 'aaa', '성비', './DATA/ImgProfil/pf004.jpg', '저의 추천코스는 제주도 둘레길입니다.',                         ' ' , TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ggg@bamentum.com', 'aaa', '손나리', './DATA/ImgProfil/pf005.jpg', '자전거 대리점을 운영하는 CEO입니다',                            ' ' , TO_DATE('2023/03/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('hhh@bamentum.com', 'aaa', '박사랑', './DATA/ImgProfil/pf006.jpg', '박사랑입니다 ',                             ' ' , TO_DATE('2023/03/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('iii@bamentum.com', 'aaa', '탁푸름', './DATA/ImgProfil/pf007.jpg', '탁푸름입니다!', ' ' , TO_DATE('2023/02/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('jjj@bamentum.com', 'aaa', '조봄', './DATA/ImgProfil/pf008.jpg', '조봄입니다!', ' ' , TO_DATE('2023/02/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('kkk@bamentum.com', 'aaa', '신하루', './DATA/ImgProfil/pf009.jpg', '신하루입니다', ' ' , TO_DATE('2023/02/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('lll@bamentum.com', 'aaa', '정광', './DATA/ImgProfil/pf010.jpg', '정광입니다', ' ' , TO_DATE('2023/02/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('mmm@bamentum.com', 'aaa', '추호', './DATA/ImgProfil/pf011.jpg', '입니다', ' ' , TO_DATE('2023/02/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('nnn@bamentum.com', 'aaa', '최혁', './DATA/ImgProfil/pf012.jpg', '입니다', ' ' , TO_DATE('2023/02/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ooo@bamentum.com', 'aaa', '남철', './DATA/ImgProfil/pf013.jpg', '입니다', ' ' , TO_DATE('2023/02/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ppp@bamentum.com', 'aaa', '설건', './DATA/ImgProfil/pf014.jpg', '입니다', ' ' , TO_DATE('2023/02/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('qqq@bamentum.com', 'aaa', '설혁', './DATA/ImgProfil/pf015.jpg', '입니다', ' ' , TO_DATE('2023/02/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('rrr@bamentum.com', 'aaa', '고호', './DATA/ImgProfil/pf016.jpg', '입니다', ' ' , TO_DATE('2023/02/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('sss@bamentum.com', 'aaa', '오건', './DATA/ImgProfil/pf017.jpg', '입니다', ' ' , TO_DATE('2023/02/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ttt@bamentum.com', 'aaa', '정리', './DATA/ImgProfil/pf018.jpg', '입니다', ' ' , TO_DATE('2023/02/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('uuu@bamentum.com', 'aaa', '노리', './DATA/ImgProfil/pf019.jpg', '입니다', ' ' , TO_DATE('2023/02/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('vvv@bamentum.com', 'aaa', '성현', './DATA/ImgProfil/pf020.jpg', '입니다 ', ' ' , TO_DATE('2023/02/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('www@bamentum.com', 'aaa', '문은', './DATA/ImgProfil/pf000.jpg', '입니다', ' ' , TO_DATE('2023/02/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('xxx@bamentum.com', 'aaa', '봉설', './DATA/ImgProfil/pf001.jpg', '입니다',               ' ' , TO_DATE('2023/02/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('yyy@bamentum.com', 'aaa', '하진', './DATA/ImgProfil/pf002.jpg', '입니다',                              ' ' , TO_DATE('2023/02/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('111@bamentum.com', 'aaa', '윤은', './DATA/ImgProfil/pf003.jpg', '입니다',                                 ' ' , TO_DATE('2023/02/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('222@bamentum.com', 'aaa', '전설', './DATA/ImgProfil/pf004.jpg', '입니다',                         ' ' , TO_DATE('2023/02/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('333@bamentum.com', 'aaa', '조으뜸', './DATA/ImgProfil/pf005.jpg', '입니다',                            ' ' , TO_DATE('2023/02/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('444@bamentum.com',     'aaa', '복미르', './DATA/ImgProfil/pf006.jpg', '입니다',                             ' ' , TO_DATE('2023/02/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('555@bamentum.com',   'aaa', '문하다', './DATA/ImgProfil/pf007.jpg', '입니다', ' ' , TO_DATE('2023/02/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('666@bamentum.com',  'aaa',' 예하늬', './DATA/ImgProfil/pf008.jpg', '입니다', ' ' , TO_DATE('2023/02/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('777@bamentum.com', 'aaa', '표햇빛', './DATA/ImgProfil/pf009.jpg', '입니다', ' ' , TO_DATE('2023/02/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('888@bamentum.com',    'aaa', '개나리', './DATA/ImgProfil/pf010.jpg', '입니다', ' ' , TO_DATE('2023/02/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;


insert into bmt_user values ('999@bamentum.com',    'aaa', '김허브', './DATA/ImgProfil/pf011.jpg', '입니다', ' ' , TO_DATE('2023/02/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('000@bamentum.com',  'aaa', '조한슨', './DATA/ImgProfil/pf012.jpg', '입니다', ' ' , TO_DATE('2023/02/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('1212@bamentum.com',       'aaa', '제이슨', './DATA/ImgProfil/pf013.jpg', '입니다~', ' ' , TO_DATE('2023/02/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('2323@bamentum.com',     'aaa', '김세라', './DATA/ImgProfil/pf014.jpg', '입니다', ' ' , TO_DATE('2023/02/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('3434@bamentum.com',       'aaa', '이수지', './DATA/ImgProfil/pf015.jpg', '입니다', ' ' , TO_DATE('2023/02/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('4545@bamentum.com',  'aaa', '토마스', './DATA/ImgProfil/pf016.jpg', '입니다', ' ' , TO_DATE('2023/02/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('5656@bamentum.com',    'aaa', '머글', './DATA/ImgProfil/pf017.jpg', '입니다', ' ' , TO_DATE('2023/02/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('6767@bamentum.com',   'aaa', '바람', './DATA/ImgProfil/pf018.jpg', '입니다', ' ' , TO_DATE('2023/02/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('7878@bamentum.com',   'aaa', '문달', './DATA/ImgProfil/pf019.jpg', '입니다', ' ' , TO_DATE('2023/02/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('8989@bamentum.com',    'aaa', '선해', './DATA/ImgProfil/pf020.jpg', '입니다 ', ' ' , TO_DATE('2023/02/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;




insert into bmt_user values ('b@bamentum.com',    'aaa', '홍아름', './DATA/ImgProfil/pf000.jpg', '안녕하세요 아름다운 아름입니다', ' ' , TO_DATE('2023/03/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('c@bamentum.com',     'aaa', '심이슬', './DATA/ImgProfil/pf001.jpg', '자전거를 배운지 얼마 안됐어요',               ' ' , TO_DATE('2023/03/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('d@bamentum.com',   'aaa', '류이레', './DATA/ImgProfil/pf002.jpg', '자전거령력 4년차 과장입니다',                              ' ' , TO_DATE('2023/03/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('z@bamentum.com',     'aaa', '안송이', './DATA/ImgProfil/pf003.jpg', '자전거로 다이어트 효과를 볼 수 있을까요?',                                 ' ' , TO_DATE('2023/03/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('f@bamentum.com',     'aaa', '성비', './DATA/ImgProfil/pf004.jpg', '저의 추천코스는 제주도 둘레길입니다.',                         ' ' , TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('g@bamentum.com',  'aaa', '손나리', './DATA/ImgProfil/pf005.jpg', '자전거 대리점을 운영하는 CEO입니다',                            ' ' , TO_DATE('2023/03/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('h@bamentum.com',     'aaa', '박사랑', './DATA/ImgProfil/pf006.jpg', '박사랑입니다 ',                             ' ' , TO_DATE('2023/03/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('i@bamentum.com',   'aaa', '탁푸름', './DATA/ImgProfil/pf007.jpg', '탁푸름입니다!', ' ' , TO_DATE('2023/02/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('j@bamentum.com',  'aaa', '조봄', './DATA/ImgProfil/pf008.jpg', '조봄입니다!', ' ' , TO_DATE('2023/02/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('k@bamentum.com', 'aaa', '신하루', './DATA/ImgProfil/pf009.jpg', '신하루입니다', ' ' , TO_DATE('2023/02/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('l@bamentum.com',    'aaa', '정광', './DATA/ImgProfil/pf010.jpg', '정광입니다', ' ' , TO_DATE('2023/02/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('m@bamentum.com',    'aaa', '추호', './DATA/ImgProfil/pf011.jpg', '입니다', ' ' , TO_DATE('2023/02/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('n@bamentum.com',  'aaa', '최혁', './DATA/ImgProfil/pf012.jpg', '입니다', ' ' , TO_DATE('2023/02/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('o@bamentum.com',       'aaa', '남철', './DATA/ImgProfil/pf013.jpg', '입니다', ' ' , TO_DATE('2023/02/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('p@bamentum.com',     'aaa', '설건', './DATA/ImgProfil/pf014.jpg', '입니다', ' ' , TO_DATE('2023/02/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('q@bamentum.com',       'aaa', '설혁', './DATA/ImgProfil/pf015.jpg', '입니다', ' ' , TO_DATE('2023/02/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('r@bamentum.com',  'aaa', '고호', './DATA/ImgProfil/pf016.jpg', '입니다', ' ' , TO_DATE('2023/02/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('s@bamentum.com',    'aaa', '오건', './DATA/ImgProfil/pf017.jpg', '입니다', ' ' , TO_DATE('2023/02/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('t@bamentum.com',   'aaa', '정리', './DATA/ImgProfil/pf018.jpg', '입니다', ' ' , TO_DATE('2023/02/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('u@bamentum.com',   'aaa', '노리', './DATA/ImgProfil/pf019.jpg', '입니다', ' ' , TO_DATE('2023/02/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('v@bamentum.com',    'aaa', '성현', './DATA/ImgProfil/pf020.jpg', '입니다 ', ' ' , TO_DATE('2023/02/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('w@bamentum.com',    'aaa', '문은', './DATA/ImgProfil/pf000.jpg', '입니다', ' ' , TO_DATE('2023/02/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('x@bamentum.com',     'aaa', '봉설', './DATA/ImgProfil/pf001.jpg', '입니다',               ' ' , TO_DATE('2023/02/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('y@bamentum.com',   'aaa', '하진', './DATA/ImgProfil/pf002.jpg', '입니다',                              ' ' , TO_DATE('2023/02/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('1@bamentum.com',     'aaa', '윤은', './DATA/ImgProfil/pf003.jpg', '입니다',                                 ' ' , TO_DATE('2023/02/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('2@bamentum.com',     'aaa', '전설', './DATA/ImgProfil/pf004.jpg', '입니다',                         ' ' , TO_DATE('2023/02/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('3@bamentum.com',  'aaa', '조으뜸', './DATA/ImgProfil/pf005.jpg', '입니다',                            ' ' , TO_DATE('2023/02/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('4@bamentum.com',     'aaa', '복미르', './DATA/ImgProfil/pf006.jpg', '입니다',                             ' ' , TO_DATE('2023/02/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('5@bamentum.com',   'aaa', '문하다', './DATA/ImgProfil/pf007.jpg', '입니다', ' ' , TO_DATE('2023/02/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('6@bamentum.com',  'aaa',' 예하늬', './DATA/ImgProfil/pf008.jpg', '입니다', ' ' , TO_DATE('2023/02/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('7@bamentum.com', 'aaa', '표햇빛', './DATA/ImgProfil/pf009.jpg', '입니다', ' ' , TO_DATE('2023/02/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('8@bamentum.com',    'aaa', '개나리', './DATA/ImgProfil/pf010.jpg', '입니다', ' ' , TO_DATE('2023/02/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('9@bamentum.com',    'aaa', '김허브', './DATA/ImgProfil/pf011.jpg', '입니다', ' ' , TO_DATE('2023/02/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('0@bamentum.com',  'aaa', '조한슨', './DATA/ImgProfil/pf012.jpg', '입니다', ' ' , TO_DATE('2023/02/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('12@bamentum.com',       'aaa', '제이슨', './DATA/ImgProfil/pf013.jpg', '입니다~', ' ' , TO_DATE('2023/02/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('23@bamentum.com',     'aaa', '김세라', './DATA/ImgProfil/pf014.jpg', '입니다', ' ' , TO_DATE('2023/02/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('34@bamentum.com',       'aaa', '이수지', './DATA/ImgProfil/pf015.jpg', '입니다', ' ' , TO_DATE('2023/02/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('45@bamentum.com',  'aaa', '토마스', './DATA/ImgProfil/pf016.jpg', '입니다', ' ' , TO_DATE('2023/02/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('56@bamentum.com',    'aaa', '머글', './DATA/ImgProfil/pf017.jpg', '입니다', ' ' , TO_DATE('2023/02/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('67@bamentum.com',   'aaa', '바람', './DATA/ImgProfil/pf018.jpg', '입니다', ' ' , TO_DATE('2023/02/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('78@bamentum.com',   'aaa', '문달', './DATA/ImgProfil/pf019.jpg', '입니다', ' ' , TO_DATE('2023/02/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('89@bamentum.com',    'aaa', '선해', './DATA/ImgProfil/pf020.jpg', '입니다 ', ' ' , TO_DATE('2023/02/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;



insert into bmt_user values ('bb@bamentum.com',    'aaa', '홍아름', './DATA/ImgProfil/pf000.jpg', '안녕하세요 아름다운 아름입니다', ' ' , TO_DATE('2023/03/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('cc@bamentum.com',     'aaa', '심이슬', './DATA/ImgProfil/pf001.jpg', '자전거를 배운지 얼마 안됐어요',               ' ' , TO_DATE('2023/03/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('dd@bamentum.com',   'aaa', '류이레', './DATA/ImgProfil/pf002.jpg', '자전거령력 4년차 과장입니다',                              ' ' , TO_DATE('2023/03/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('zz@bamentum.com',     'aaa', '안송이', './DATA/ImgProfil/pf003.jpg', '자전거로 다이어트 효과를 볼 수 있을까요?',                                 ' ' , TO_DATE('2023/03/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ff@bamentum.com',     'aaa', '성비', './DATA/ImgProfil/pf004.jpg', '저의 추천코스는 제주도 둘레길입니다.',                         ' ' , TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('gg@bamentum.com',  'aaa', '손나리', './DATA/ImgProfil/pf005.jpg', '자전거 대리점을 운영하는 CEO입니다',                            ' ' , TO_DATE('2023/03/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('hh@bamentum.com',     'aaa', '박사랑', './DATA/ImgProfil/pf006.jpg', '박사랑입니다 ',                             ' ' , TO_DATE('2023/03/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ii@bamentum.com',   'aaa', '탁푸름', './DATA/ImgProfil/pf007.jpg', '탁푸름입니다!', ' ' , TO_DATE('2023/02/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('jj@bamentum.com',  'aaa', '조봄', './DATA/ImgProfil/pf008.jpg', '조봄입니다!', ' ' , TO_DATE('2023/02/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('kk@bamentum.com', 'aaa', '신하루', './DATA/ImgProfil/pf009.jpg', '신하루입니다', ' ' , TO_DATE('2023/02/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ll@bamentum.com',    'aaa', '정광', './DATA/ImgProfil/pf010.jpg', '정광입니다', ' ' , TO_DATE('2023/02/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('mm@bamentum.com',    'aaa', '추호', './DATA/ImgProfil/pf011.jpg', '입니다', ' ' , TO_DATE('2023/02/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('nn@bamentum.com',  'aaa', '최혁', './DATA/ImgProfil/pf012.jpg', '입니다', ' ' , TO_DATE('2023/02/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('oo@bamentum.com',       'aaa', '남철', './DATA/ImgProfil/pf013.jpg', '입니다', ' ' , TO_DATE('2023/02/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('pp@bamentum.com',     'aaa', '설건', './DATA/ImgProfil/pf014.jpg', '입니다', ' ' , TO_DATE('2023/02/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('qq@bamentum.com',       'aaa', '설혁', './DATA/ImgProfil/pf015.jpg', '입니다', ' ' , TO_DATE('2023/02/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('rr@bamentum.com',  'aaa', '고호', './DATA/ImgProfil/pf016.jpg', '입니다', ' ' , TO_DATE('2023/02/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ss@bamentum.com',    'aaa', '오건', './DATA/ImgProfil/pf017.jpg', '입니다', ' ' , TO_DATE('2023/02/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('tt@bamentum.com',   'aaa', '정리', './DATA/ImgProfil/pf018.jpg', '입니다', ' ' , TO_DATE('2023/02/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('uu@bamentum.com',   'aaa', '노리', './DATA/ImgProfil/pf019.jpg', '입니다', ' ' , TO_DATE('2023/02/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('vv@bamentum.com',    'aaa', '성현', './DATA/ImgProfil/pf020.jpg', '입니다 ', ' ' , TO_DATE('2023/02/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('ww@bamentum.com',    'aaa', '문은', './DATA/ImgProfil/pf000.jpg', '입니다', ' ' , TO_DATE('2023/02/01 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('xx@bamentum.com',     'aaa', '봉설', './DATA/ImgProfil/pf001.jpg', '입니다',               ' ' , TO_DATE('2023/02/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' '  ) ;
insert into bmt_user values ('yy@bamentum.com',   'aaa', '하진', './DATA/ImgProfil/pf002.jpg', '입니다',                              ' ' , TO_DATE('2023/02/03 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('11@bamentum.com',     'aaa', '윤은', './DATA/ImgProfil/pf003.jpg', '입니다',                                 ' ' , TO_DATE('2023/02/04 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('22@bamentum.com',     'aaa', '전설', './DATA/ImgProfil/pf004.jpg', '입니다',                         ' ' , TO_DATE('2023/02/05 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('33@bamentum.com',  'aaa', '조으뜸', './DATA/ImgProfil/pf005.jpg', '입니다',                            ' ' , TO_DATE('2023/02/06 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('44@bamentum.com',     'aaa', '복미르', './DATA/ImgProfil/pf006.jpg', '입니다',                             ' ' , TO_DATE('2023/02/07 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('55@bamentum.com',   'aaa', '문하다', './DATA/ImgProfil/pf007.jpg', '입니다', ' ' , TO_DATE('2023/02/08 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('66@bamentum.com',  'aaa',' 예하늬', './DATA/ImgProfil/pf008.jpg', '입니다', ' ' , TO_DATE('2023/02/09 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('77@bamentum.com', 'aaa', '표햇빛', './DATA/ImgProfil/pf009.jpg', '입니다', ' ' , TO_DATE('2023/02/10 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('88@bamentum.com',    'aaa', '개나리', './DATA/ImgProfil/pf010.jpg', '입니다', ' ' , TO_DATE('2023/02/11 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('99@bamentum.com',    'aaa', '김허브', './DATA/ImgProfil/pf011.jpg', '입니다', ' ' , TO_DATE('2023/02/12 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('00@bamentum.com',  'aaa', '조한슨', './DATA/ImgProfil/pf012.jpg', '입니다', ' ' , TO_DATE('2023/02/13 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('122@bamentum.com',       'aaa', '제이슨', './DATA/ImgProfil/pf013.jpg', '입니다~', ' ' , TO_DATE('2023/02/14 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('233@bamentum.com',     'aaa', '김세라', './DATA/ImgProfil/pf014.jpg', '입니다', ' ' , TO_DATE('2023/02/15 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('344@bamentum.com',       'aaa', '이수지', './DATA/ImgProfil/pf015.jpg', '입니다', ' ' , TO_DATE('2023/02/16 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('455@bamentum.com',  'aaa', '토마스', './DATA/ImgProfil/pf016.jpg', '입니다', ' ' , TO_DATE('2023/02/17 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('566@bamentum.com',    'aaa', '머글', './DATA/ImgProfil/pf017.jpg', '입니다', ' ' , TO_DATE('2023/02/18 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('677@bamentum.com',   'aaa', '바람', './DATA/ImgProfil/pf018.jpg', '입니다', ' ' , TO_DATE('2023/02/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('788@bamentum.com',   'aaa', '문달', './DATA/ImgProfil/pf019.jpg', '입니다', ' ' , TO_DATE('2023/02/20 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;
insert into bmt_user values ('899@bamentum.com',    'aaa', '선해', './DATA/ImgProfil/pf020.jpg', '입니다 ', ' ' , TO_DATE('2023/02/21 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), ' ' ) ;




insert into bmt_post values (10505, 'f', ' 혹시 XX근처에 자전고 두고가신분?? ',  ' 오늘 한강 산책 갔다가 제가 타던 자전거랑 똑같은 자전거가 있길래 유심히 보고 있었는데요<br> 매점 아주머니께서 며칠동안 자전거 주인이 안 나타난다고 하시더라구요!! <br> 혹시 바멘텀에 차대번호 등록하신분이라면 이 글 보고 연락주실 거 같아서 글 올려봐요!! ', './DATA/PostImage/bamen1.JPG', TO_DATE('2023/04/01 12:45:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com', 11);



insert into bmt_post values (10509, 'f', '여기는 어디일까요?', '서울시 한강공원 입니다', './DATA/PostImage/img060.jpg', TO_DATE('2023/03/30 15:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com',    10);
insert into bmt_post values (10060, 'f', '여기는 어디일까요?', '서울시 한강공원 입니다', './DATA/PostImage/img060.jpg', TO_DATE('2023/03/30 15:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com',    10);



insert into bmt_post values (10060, 'f', '여기는 어디일까요?', '서울시 한강공원 입니다', './DATA/PostImage/img060.jpg', TO_DATE('2023/03/30 15:40:00', 'YYYY/MM/DD HH24:MI:SS'), 'Gyu_nam1211@bamentum.com',    10);


insert into bmt_post values (10007, 'f', '아라 부부라이딩 날씨 죽이네요',            '?신차구매후 참으로 오랜만에 라이딩 나왔더니<br>날씨 끝내주네요~ <br>청라에서 계양까지 달리고 왔네요~ <br>정서진에서 햄버거 하나 먹고, 아미노바이탈로 에너지 충전하니 좋네요 ㅎ', './DATA/PostImage/img007.jpg', TO_DATE('2023/03/04 14:56:00', 'YYYY/MM/DD HH24:MI:SS'), 'Ha_Eun0103@bamentum.com', 17);

commit;




insert into bmt_post values (10040, 'f', '장성황룡강 자전거길 공사구간안내', '장성황룡강자전거길중 천변좌로를 새로 말끔히 단장했기에<br>어제 답사를 했읍니다. 지도상 청색선이 기존이 도로이고<br>임곡->오룡교에서  빨간색좌로로 직진하면 쾌적하게 달릴수<br>있을것 같네요 다리가 거의 완공된듯하여 곧 개통될것 같습니다.<br>', './DATA/PostImage/img040.jpg', TO_DATE('2023/02/13 12:43:00', 'YYYY/MM/DD HH24:MI:SS'), 'ESOO0710@bamentum.com',       10);



insert into bmt_post values (10020, 'f', '태국 자덕들의 성지를 소개합니다 -트렉편-',     '이렇게 전자팔찌를 태킹 태킹해주면 마법의 문이 열리며...게이트를 지나.. <br>이렇게 만남의 다리(?)에서 집결하게 됩니다. ', './DATA/PostImage/img020.jpg', TO_DATE('2022/01/16 14:21:00', 'YYYY/MM/DD HH24:MI:SS'), 'SeongGyu0407@bamentum.com', 10);

*/
