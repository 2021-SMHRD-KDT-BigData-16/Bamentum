drop table BMT_BIC;
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


insert into bmt_user values ('aaa@aaa.aaa', 'aaa', 'aaa문경수', './DATA/PostImage/img001.jpg', '사용자정보를 길게 써보장', '좋아하는 코스aaa' , TO_DATE('2023/03/01 11:00:00', 'YYYY/MM/DD HH:MI:SS'), 'u' ) ;
insert into bmt_user values ('bbb@bbb.bbb', 'aaa', 'bbb기영민', './DATA/PostImage/img002.jpg', '사용자정보를 길게 써보장', '좋아하는 코스bbb' , TO_DATE('2023/03/02 11:00:00', 'YYYY/MM/DD HH:MI:SS'), 'u' ) ;
insert into bmt_user values ('ccc@ccc.ccc', 'aaa', 'ccc안미연', './DATA/PostImage/img003.jpg', '사용자정보를 길게 써보장', '좋아하는 코스ccc' , TO_DATE('2023/03/03 11:00:00', 'YYYY/MM/DD HH:MI:SS'), 'u' ) ;
insert into bmt_user values ('ddd@ddd.ddd', 'aaa', 'ddd윤상재', './DATA/PostImage/img004.jpg', '사용자정보를 길게 써보장', '좋아하는 코스ddd' , TO_DATE('2023/03/04 11:00:00', 'YYYY/MM/DD HH:MI:SS'), 'u' ) ;
insert into bmt_user values ('eee@eee.eee', 'aaa', 'eee김연우', './DATA/PostImage/img005.jpg', '사용자정보를 길게 써보장', '좋아하는 코스eee' , TO_DATE('2023/03/05 11:00:00', 'YYYY/MM/DD HH:MI:SS'), 'u' ) ;

commit;


insert into bmt_post values (10001, 'f', '말이안되네 ㅋ', '대박대박대박 세요 꼭지루했지루했지루했록 눈즐거운 영화는', './DATA/PostImage/img021.jpg', TO_DATE('2023/03/06 12:01:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 11);
insert into bmt_post values (10002, 'f', '미래에도 영화', '제이크설리가세요 꼭 그래픽그래픽그래픽 눈이거운 영화는', './DATA/PostImage/img022.jpg', TO_DATE('2023/03/06 12:02:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 12);
insert into bmt_post values (10003, 'f', '제일궁금했던건', '초반의 긴 서보세요 이미친이미친이미친토록  즐거운 영화', './DATA/PostImage/img023.jpg', TO_DATE('2023/03/06 12:03:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 13);
insert into bmt_post values (10004, 'f', '믿고보는 아바', 'CG기술력 궁보세요  러닝타  러닝타  러닝타  눈이 즐거운 영화 ', './DATA/PostImage/img024.jpg', TO_DATE('2023/03/06 12:04:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 14);
insert into bmt_post values (10005, 'f', '진짜 올해 최', ' OTT시대에 영세요 꼭아바타아바타아바타록 눈즐거운 영화', './DATA/PostImage/img025.jpg', TO_DATE('2023/03/06 12:05:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 15);
insert into bmt_post values (10006, 'f', '찢었다3탄 기', ' 스토리빈약 영세요 꼭상상속상상속상상속록 눈즐거운 영화', './DATA/PostImage/img026.jpg', TO_DATE('2023/03/06 12:06:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 16);
insert into bmt_post values (10007, 'f', '카메룬 영감…', ' 우리가 계속해세요  그냥보그냥보그냥보토록  즐거운 영화', './DATA/PostImage/img027.jpg', TO_DATE('2023/03/06 12:07:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 17);
insert into bmt_post values (10008, 'f', '영상미 하나로', '군입대 전 마세요 꼭  아누가아누가아누가눈이 운 영화는', './DATA/PostImage/img028.jpg', TO_DATE('2023/03/06 12:08:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 18);
insert into bmt_post values (10009, 'f', '이영화 미쳤다', '개봉일 조조3세요 꼭 진짜시진짜시진짜시 눈이거운 영화는', './DATA/PostImage/img029.jpg', TO_DATE('2023/03/06 12:09:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 19);
insert into bmt_post values (10010, 'f', '2만원에 외계', ' 기대를 너무 많세요 꼭꼭영화꼭영화꼭영화록 눈즐거운 영', './DATA/PostImage/img030.jpg', TO_DATE('2023/03/06 12:10:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 10);
insert into bmt_post values (10011, 'f', '평점 개판났네', '진짜 어딘가에 세요 꼭표값하표값하표값하록 눈즐거운 영화', './DATA/PostImage/img031.jpg', TO_DATE('2023/03/06 12:11:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 11);
insert into bmt_post values (10012, 'f', '영화본다고 생', '시간 가는줄 모세요 꼭이게어이게어이게어록 눈즐거운 영화', './DATA/PostImage/img032.jpg', TO_DATE('2023/03/06 12:12:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 12);
insert into bmt_post values (10013, 'f', '왜 자꾸 cg가', '3D로 봤는데 시요 꼭 년만에년만에년만에 눈이거운 영화', './DATA/PostImage/img033.jpg', TO_DATE('2023/03/06 12:13:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 13);
insert into bmt_post values (10014, 'f', '영상미 하나만', '프리미엄 상영세요 꼭영화보영화보영화보록 눈즐거운 영화는', './DATA/PostImage/img034.jpg', TO_DATE('2023/03/06 12:14:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 14);
insert into bmt_post values (10015, 'f', '스토리가 새로', '내 인생 최고의요 꼭  완벽한완벽한완벽한눈이 운 영화', './DATA/PostImage/img035.jpg', TO_DATE('2023/03/06 12:15:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 15);
insert into bmt_post values (10016, 'f', 'CG미쳤다 바다',  '영상미 때문보세요 평점낮  평점낮  평점낮 록 눈이 즐거운 영', './DATA/PostImage/img036.jpg', TO_DATE('2023/03/06 12:16:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 16);
insert into bmt_post values (10017, 'f', '자식들은 말 ', ' 눈물눈물 가슴세요 꼭 심야영심야영심야영 눈이거운 영화', './DATA/PostImage/img037.jpg', TO_DATE('2023/03/06 12:17:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 17);
insert into bmt_post values (10018, 'f', '3D 안경 착용', '무슨 말이 필요세요 꼭분간억분간억분간억록 눈즐거운 영화', './DATA/PostImage/img038.jpg', TO_DATE('2023/03/06 12:18:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 18);
insert into bmt_post values (10019, 'f', '영화관의 존재', '경이롭다 ,이쁘세요 꼭지루하지루하지루하록 눈즐거운 영화', './DATA/PostImage/img039.jpg', TO_DATE('2023/03/06 12:19:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 19);
insert into bmt_post values (10020, 'f', '역시 타노스가', '엄청납니다 최세요 꼭진짜세진짜세진짜세록 눈즐거운 영화는', './DATA/PostImage/img040.jpg', TO_DATE('2023/03/06 12:20:00', 'YYYY/MM/DD HH:MI:SS'), 'aaa@aaa.aaa', 10);


insert into bmt_post values (10021, 'f', '말가부장적인  ㅋ', '대박대박대박 다영상미 하영상미 대박이고 스토리화는', './DATA/PostImage/img041.jpg', TO_DATE('2023/03/07 12:01:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 11);
insert into bmt_post values (10022, 'f', '미돈 많이 들인영화', '제이크설리가 눈영상미 하기대한대로네요. 잘봤습화는', './DATA/PostImage/img042.jpg', TO_DATE('2023/03/07 12:02:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 12);
insert into bmt_post values (10023, 'f', '제너무 기대한했던건', '초반의 긴 서사에영상미 각본 이게 최선인가요?  영화', './DATA/PostImage/img043.jpg', TO_DATE('2023/03/07 12:03:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 13);
insert into bmt_post values (10024, 'f', '믿3시간이 길 아바', 'CG기술력 궁금해영상미  명작입니다ㅠㅠ 더이상 화 ', './DATA/PostImage/img044.jpg', TO_DATE('2023/03/07 12:04:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 14);
insert into bmt_post values (10025, 'f', '진그냥 그래픽 최', ' OTT시대에 영화 영상미   3시간 10분동안 영화가 화', './DATA/PostImage/img045.jpg', TO_DATE('2023/03/07 12:05:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 15);
insert into bmt_post values (10026, 'f', '찢이건 영화가 기', ' 스토리빈약 영상 영상미 하스토리 영상미 뭐하나 화', './DATA/PostImage/img046.jpg', TO_DATE('2023/03/07 12:06:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 16);
insert into bmt_post values (10027, 'f', '카스토리 뻔하감…', ' 우리가 계속해서 영상미   가족은 무엇과도 바꿀  화', './DATA/PostImage/img047.jpg', TO_DATE('2023/03/07 12:07:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 17);
insert into bmt_post values (10028, 'f', '영스쿠버다이나로', '군입대 전 마지막영상미   무엇보다 눈이 너무 즐화는', './DATA/PostImage/img048.jpg', TO_DATE('2023/03/07 12:08:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 18);
insert into bmt_post values (10029, 'f', '이영상미가 좋쳤다', '개봉일 조조3D 영상미 하역시나 좋았어요^^ 전화는', './DATA/PostImage/img049.jpg', TO_DATE('2023/03/07 12:09:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 19);
insert into bmt_post values (10030, 'f', '2 보면서 이 정외계', ' 기대를 너무 많이 영상미  영상미를 제외하고는 정 ', './DATA/PostImage/img050.jpg', TO_DATE('2023/03/07 12:10:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 10);
insert into bmt_post values (10031, 'f', '평CG라는 생났네', '진짜 어딘가에 있영상미 하정말 현존할꺼 같은 아화', './DATA/PostImage/img051.jpg', TO_DATE('2023/03/07 12:11:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 11);
insert into bmt_post values (10032, 'f', '영1편이 너무 고 생', '시간 가는줄 모르영상미 하길이와 감동이 비례하도화', './DATA/PostImage/img052.jpg', TO_DATE('2023/03/07 12:12:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 12);
insert into bmt_post values (10033, 'f', '왜스토리는 뭐g가', '3D로 봤는데 시영상미 하2009년이랑 크게 다를 ', './DATA/PostImage/img053.jpg', TO_DATE('2023/03/07 12:13:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 13);
insert into bmt_post values (10034, 'f', '영3시간 동안 나만', '프리미엄 상영관영상미 하스토리로 보는 영화가 화는', './DATA/PostImage/img054.jpg', TO_DATE('2023/03/07 12:14:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 14);
insert into bmt_post values (10035, 'f', '스역시 인간은새로', '내 인생 최고의 영상미 하 3시간이 30분이 되는 기화', './DATA/PostImage/img055.jpg', TO_DATE('2023/03/07 12:15:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 15);
insert into bmt_post values (10036, 'f', 'C그냥 풍경 감 바다',  '영상미 때문에라 영상미러닝타임이 좀 많이 길영', './DATA/PostImage/img056.jpg', TO_DATE('2023/03/07 12:16:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 16);
insert into bmt_post values (10037, 'f', '자70살 아부지말 ', ' 눈물눈물 가슴찢 영상미 하요정가족 버전 타이타닉화', './DATA/PostImage/img057.jpg', TO_DATE('2023/03/07 12:17:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 17);
insert into bmt_post values (10038, 'f', '3 초당 2억 6천착용', '무슨 말이 필요할영상미 하방금 봤는데 실망했어요화', './DATA/PostImage/img058.jpg', TO_DATE('2023/03/07 12:18:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 18);
insert into bmt_post values (10039, 'f', '영영상미 만으존재', '경이롭다 ,이쁘다영상미   대박! 감동적이고 3시간화', './DATA/PostImage/img059.jpg', TO_DATE('2023/03/07 12:19:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 19);
insert into bmt_post values (10040, 'f', '역영상미가 매스가', '엄청납니다 최고영상미 하이 영화를 10점 안주면 는', './DATA/PostImage/img060.jpg', TO_DATE('2023/03/07 12:20:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb', 10);

commit;

insert into bmt_post values (10041, 'f', '지루했', '짜 명작인 영화 1편1편에서 훨씬 진일보한 영상기술의 집합체', './DATA/PostImage/img061.jpg', TO_DATE('2023/03/08 12:01:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 11);
insert into bmt_post values (10042, 'f', '그래픽', '토리가 넘 아쉽다..무조건 영화관(아이맥스, 돌비, 컬러리움) ', './DATA/PostImage/img062.jpg', TO_DATE('2023/03/08 12:02:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 12);
insert into bmt_post values (10043, 'f', '이미친', '화를 보면서 엄청 기대보다 별로네요. 4d로 봐서 그나마 세시', './DATA/PostImage/img063.jpg', TO_DATE('2023/03/08 12:03:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 13);
insert into bmt_post values (10044, 'f', '러닝타', '밌습니다. 개쩔어요스토리고 뭐고 3시간 동안 황홀하게 감상...', './DATA/PostImage/img064.jpg', TO_DATE('2023/03/08 12:04:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 14);
insert into bmt_post values (10045, 'f', '아바타', '3년 기다려 본 아바경이로운 CG. 하지만 CG를 보여주기 위', './DATA/PostImage/img065.jpg', TO_DATE('2023/03/08 12:05:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 15);
insert into bmt_post values (10046, 'f', '상상속', 'g 보는 맛 있습니다아빠타 ㅎㅎ 연말에 가족의 소중함을 느껴', './DATA/PostImage/img066.jpg', TO_DATE('2023/03/08 12:06:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 16);
insert into bmt_post values (10047, 'f', '그냥보', 'G가 훌륭합니다!아름다운 영화~~진짜 명 영화~~작인 영화~~', './DATA/PostImage/img067.jpg', TO_DATE('2023/03/08 12:07:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 17);
insert into bmt_post values (10048, 'f', '아누가', '부한 내용, 이미 1타이타닉이 떠올랐다. 진짜 명작인작인 영화', './DATA/PostImage/img068.jpg', TO_DATE('2023/03/08 12:08:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 18);
insert into bmt_post values (10049, 'f', '진짜시', '상미는 진짜 끝내주비쥬얼 빼고는 딱히 스토리 등 기타 모두 평', './DATA/PostImage/img069.jpg', TO_DATE('2023/03/08 12:09:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 19);
insert into bmt_post values (10050, 'f', '꼭영화', '동 그 이상...황홀했아바타1이너무재미있어서 너무 기대했는지', './DATA/PostImage/img070.jpg', TO_DATE('2023/03/08 12:10:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 10);
insert into bmt_post values (10051, 'f', '표값하', '토리는 많은걸 담으생각보다 스토리가 개이 없음이 없음연성이 ', './DATA/PostImage/img071.jpg', TO_DATE('2023/03/08 12:11:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 11);
insert into bmt_post values (10052, 'f', '이게어', '바타의 상징인 영상이거 아이맥스로 이번생에 안보면 평생 후회', './DATA/PostImage/img072.jpg', TO_DATE('2023/03/08 12:12:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 12);
insert into bmt_post values (10053, 'f', '년만에', '상미는 진짜 미쳤는형에게 미치지는 못하나, 부끄럽지는 않을 동', './DATA/PostImage/img073.jpg', TO_DATE('2023/03/08 12:13:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 13);
insert into bmt_post values (10054, 'f', '영화보', '려하게 포장한 쓰레영상미x3. 이런 호사를 누리고 별 5개를 안 ', './DATA/PostImage/img074.jpg', TO_DATE('2023/03/08 12:14:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 14);
insert into bmt_post values (10055, 'f', '완벽한', '바타 1편을 처음봤구경하는 쾌감이야 더할 나위 없다만, 영화란', './DATA/PostImage/img075.jpg', TO_DATE('2023/03/08 12:15:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 15);
insert into bmt_post values (10056, 'f', '평점낮', '상미 빼면 아무것도좃간이라 미안해.. 내용개연성이.은 개연성이', './DATA/PostImage/img076.jpg', TO_DATE('2023/03/08 12:16:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 16);
insert into bmt_post values (10057, 'f', '심야영', '상미 좋다는 말이 1편이 10점이라면 2편은 7점이상은 듬 힘듬', './DATA/PostImage/img077.jpg', TO_DATE('2023/03/08 12:17:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 17);
insert into bmt_post values (10058, 'f', '분간억', '계행성에서 찍은 네스토리는 유치하고 영상미는 좋다. 바다를 좋', './DATA/PostImage/img078.jpg', TO_DATE('2023/03/08 12:18:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 18);
insert into bmt_post values (10059, 'f', '지루하', '메론 앞으로도 열일3시간이 1시간처럼 느껴지는 매직. 아바타3', './DATA/PostImage/img079.jpg', TO_DATE('2023/03/08 12:19:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 19);
insert into bmt_post values (10060, 'f', '진짜세', '보다는 별로라길래 지구온난화에 대한 불감증자는 스토리에 딴지', './DATA/PostImage/img080.jpg', TO_DATE('2023/03/08 12:20:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc', 10);

commit;


delete from bmt_comment;

insert into bmt_comment values (20001, 10001, ' 지루했지루했  ', TO_DATE('2023/03/09 12:31:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb');
insert into bmt_comment values (20002, 10001, ' 그래픽그래픽  ', TO_DATE('2023/03/09 12:32:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc');
insert into bmt_comment values (20003, 10001, ' 이미친이미친  ', TO_DATE('2023/03/09 12:33:00', 'YYYY/MM/DD HH:MI:SS'), 'ddd@ddd.ddd');
insert into bmt_comment values (20004, 10001, ' 러닝타러닝타  ', TO_DATE('2023/03/09 12:34:00', 'YYYY/MM/DD HH:MI:SS'), 'eee@eee.eee');
insert into bmt_comment values (20005, 10001, ' 아바타아바타  ', TO_DATE('2023/03/09 12:35:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb');
insert into bmt_comment values (20006, 10001, ' 상상속상상속  ', TO_DATE('2023/03/09 12:36:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc');
insert into bmt_comment values (20007, 10001, ' 그냥보그냥보  ', TO_DATE('2023/03/09 12:37:00', 'YYYY/MM/DD HH:MI:SS'), 'ddd@ddd.ddd');
insert into bmt_comment values (20008, 10001, ' 아누가아누가  ', TO_DATE('2023/03/09 12:38:00', 'YYYY/MM/DD HH:MI:SS'), 'eee@eee.eee');
insert into bmt_comment values (20009, 10001, ' 진짜시진짜시  ', TO_DATE('2023/03/09 12:39:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb');
insert into bmt_comment values (20010, 10001, ' 꼭영화꼭영화  ', TO_DATE('2023/03/09 12:30:00', 'YYYY/MM/DD HH:MI:SS'), 'ddd@ddd.ddd');
insert into bmt_comment values (20011, 10021, ' 표값하표값하  ', TO_DATE('2023/03/09 12:31:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb');
insert into bmt_comment values (20012, 10021, ' 이게어이게어  ', TO_DATE('2023/03/09 12:32:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc');
insert into bmt_comment values (20013, 10021, ' 년만에년만에  ', TO_DATE('2023/03/09 12:33:00', 'YYYY/MM/DD HH:MI:SS'), 'ddd@ddd.ddd');
insert into bmt_comment values (20014, 10021, ' 영화보영화보  ', TO_DATE('2023/03/09 12:34:00', 'YYYY/MM/DD HH:MI:SS'), 'eee@eee.eee');
insert into bmt_comment values (20015, 10021, ' 완벽한완벽한  ', TO_DATE('2023/03/09 12:35:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb');
insert into bmt_comment values (20016, 10021, ' 평점낮평점낮  ', TO_DATE('2023/03/09 12:36:00', 'YYYY/MM/DD HH:MI:SS'), 'ccc@ccc.ccc');
insert into bmt_comment values (20017, 10021, ' 심야영심야영  ', TO_DATE('2023/03/09 12:37:00', 'YYYY/MM/DD HH:MI:SS'), 'ddd@ddd.ddd');
insert into bmt_comment values (20018, 10021, ' 분간억분간억  ', TO_DATE('2023/03/09 12:38:00', 'YYYY/MM/DD HH:MI:SS'), 'eee@eee.eee');
insert into bmt_comment values (20019, 10021, ' 지루하지루하  ', TO_DATE('2023/03/09 12:39:00', 'YYYY/MM/DD HH:MI:SS'), 'bbb@bbb.bbb');
insert into bmt_comment values (20020, 10021, ' 진짜세진짜세  ', TO_DATE('2023/03/09 12:30:00', 'YYYY/MM/DD HH:MI:SS'), 'ddd@ddd.ddd');

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