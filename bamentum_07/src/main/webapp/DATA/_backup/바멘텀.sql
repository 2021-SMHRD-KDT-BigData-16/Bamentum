drop table Bmt_Friend;
drop table Bmt_Reply;
drop table Bmt_CycleID;
drop table Bmt_Post;
drop table Bmt_Board;
drop table Bmt_User;


CREATE TABLE Bmt_User (
	Email	VarChar2(50)		PRIMARY KEY,
	Pw	VarChar2(20)		NOT NULL,
	U_Name	VarChar2(20)		NULL,
	ProfileImg	VARCHAR2(256)		NULL,
	ProfileText	VARCHAR2(2000)		NULL
);

CREATE TABLE Bmt_Board (
	BoardId	NUMBER(10)		PRIMARY KEY,
	BoardName	VARCHAR2(20)		NULL
);

CREATE TABLE Bmt_Post (
	PostId	NUMBER(20)		PRIMARY KEY,
	BoardId	NUMBER(10)		NOT NULL,
	Email	VarChar2(50)		NOT NULL,
	Title	VarChar2(100)		NULL,
	ImgPath	VarChar2(500)		NULL,
	P_Content	VARCHAR2(2000)		NULL
	
   ,foreign key (Email) references Bmt_User(Email)
   ,foreign key (BoardId) references Bmt_Board(BoardId)
	
);

CREATE TABLE Bmt_CycleID (
	CIdNum	VarChar2(20)		PRIMARY KEY,
	IdNumPath	VarChar2(500)		NOT NULL,
	Email	VarChar2(50)		NOT NULL
	
   ,foreign key (Email) references Bmt_User(Email)
	
);

CREATE TABLE Bmt_Reply (
	ReplyId	Number(10)		PRIMARY KEY,
	ParentId	Number(10)		NOT NULL,
	R_Depth	Number(5)		NULL,
	PostId	NUMBER(10)		NOT NULL,
	Reply	VarChar2(500)		NULL,
	Email	VarChar2(50)		NOT NULL
	
   ,foreign key (Email) references Bmt_User(Email)
   ,foreign key (PostId) references Bmt_Post(PostId)
	
);

CREATE TABLE Bmt_Friend (
	FriendId	Number(20)		PRIMARY KEY,
	FriendEmail	VarChar2(50)		NOT NULL,
	UserEmail	VarChar2(50)		NOT NULL,
	RelAgree	Number(1)		NULL

   ,foreign key (FriendEmail) references Bmt_User(Email)
   ,foreign key (UserEmail) references Bmt_User(Email)
	
);

-- delete from Bmt_Post;
-- delete from Bmt_Board;
-- delete from Bmt_User;


insert into Bmt_User values ('aaa@aaa.aaa', 'aaa', 'aaa', './DATA/PostImage/img001.jpg', 'CG에 돈 많이 썼다는건 개구라임. 다만 직접 판도라가서 수중촬영하긴 빡쎘을거 같음. 나비족 섭외에도 돈 많이 썼겠드만... ');
insert into Bmt_User values ('bbb@bbb.bbb', 'bbb', 'bbb', './DATA/PostImage/img002.jpg', '말이안되네 ㅋㅋㅋ 어케만든겨 ');
insert into Bmt_User values ('ccc@ccc.ccc', 'ccc', 'ccc', './DATA/PostImage/img003.jpg', '미래에도 영화관이 있어야 되는 이유를 보여준 영화. ');
insert into Bmt_User values ('ddd@ddd.ddd', 'ddd', 'ddd', './DATA/PostImage/img004.jpg', '제일궁금했던건 2009년도에도 대단했던 CG기술이 2022년도에 얼마나 대단해졌을까..?13년의 기다림이 아깝지 않았습니다. ');
insert into Bmt_User values ('eee@eee.eee', 'eee', 'eee', './DATA/PostImage/img005.jpg', '믿고보는 아바타 아쿠아리움에 있는줄..3시간이 어떻게 간건지 모르겠어요 ');

commit;

insert into Bmt_Board values (001, '개인게시판');

insert into Bmt_Board values (002, '공용게시판');

commit;

insert into Bmt_Post values (0001, 001, 'aaa@aaa.aaa', '영상미', './DATA/PostImage/img011.jpg', '영상미 하나로 10점 아맥 3d로 보세요 꼭 이토록 눈이 즐거운 영화는 얼마만인가.... ');
insert into Bmt_Post values (0002, 001, 'aaa@aaa.aaa', '이영화', './DATA/PostImage/img012.jpg', '이영화 미쳤다! 13년 기다린 보람이 있습니다! ');
insert into Bmt_Post values (0003, 001, 'aaa@aaa.aaa', '2만원에', './DATA/PostImage/img013.jpg', '2만원에 외계 행성 여행이면 저렴하네요 ');
insert into Bmt_Post values (0004, 001, 'aaa@aaa.aaa', '평점', './DATA/PostImage/img014.jpg', '평점 개판났네..최소 9.5점짜리입니다 ');
insert into Bmt_Post values (0005, 001, 'aaa@aaa.aaa', '영화본다고', './DATA/PostImage/img015.jpg', '영화본다고 생각하지말고 외계 아쿠아리움 구경한다고 생각하고 보세요 ');
insert into Bmt_Post values (0006, 001, 'aaa@aaa.aaa', '왜', './DATA/PostImage/img016.jpg', '왜 자꾸 cg가 대단하다고 뻥치는지 모르겠다이건 그냥 판도라 행성 가서 찍은거잖아 ');
insert into Bmt_Post values (0007, 001, 'aaa@aaa.aaa', '영상미', './DATA/PostImage/img017.jpg', '영상미 하나만으로도 충분히 볼 가치가있다 ');
insert into Bmt_Post values (0008, 001, 'aaa@aaa.aaa', '스토리가', './DATA/PostImage/img018.jpg', '스토리가 새로운 영화는 아닙니다. 하지만 아바타 세계관에 집중할 수 있도록 스토리를 만들었으며 보여지는 장면 하나하나가 너무 알차고 경이롭습니다.   새로운 재미보다 아바타 세상에 체험한다는 시점으로 영화를 관람하면... ');
insert into Bmt_Post values (0009, 001, 'aaa@aaa.aaa', 'CG미쳤다', './DATA/PostImage/img019.jpg', 'CG미쳤다 바다 물멍 잘하고 갑니다 ');
insert into Bmt_Post values (0010, 001, 'aaa@aaa.aaa', '자식들은', './DATA/PostImage/img020.jpg', '자식들은 말 안듣고, 툴쿤이 제일 말 잘 듣네 ');
insert into Bmt_Post values (0011, 001, 'aaa@aaa.aaa', '3D', './DATA/PostImage/img021.jpg', '3D 안경 착용하고 3시간 길이의 영화를 보는 건  버겁지만 바닷 속 시각적인 디테일과 환경 보존에 대한 메세지를 잘 전달한 영화. ');
insert into Bmt_Post values (0012, 001, 'aaa@aaa.aaa', '영화관의', './DATA/PostImage/img022.jpg', '영화관의 존재 이유를 상기시키는 영화. 영화가 관객에게 주는 가치와 즐거움이 다양할텐데, 아바타2는 영화관에서 즐길 수 있는 영화적 체험 측면에서 역대 최고라고 할 수 있음 ');
insert into Bmt_Post values (0013, 001, 'aaa@aaa.aaa', '역시', './DATA/PostImage/img023.jpg', '역시 타노스가 옳았고 인간은 정도를 모른다 ');
insert into Bmt_Post values (0014, 001, 'aaa@aaa.aaa', '영상미', './DATA/PostImage/img024.jpg', '영상미 좋고 3시간이 별로 안지루함 13년기다린 보람이 있음 ');
insert into Bmt_Post values (0015, 001, 'aaa@aaa.aaa', '마지막', './DATA/PostImage/img025.jpg', '마지막 전투에서 바다부족은 어디갔는지 보이지도 않고.. 대령은 왜 살려주는건지 이해도 안되고..영상미만 좋으면 뭐하나.. ');

commit;

insert into Bmt_Post values (0021, 001, 'bbb@bbb.bbb', '스토리가 별로', './DATA/PostImage/img031.jpg', '스토리가 별로라고해서 기대안하고 갔는데이건 정말 영화관에서 보지않으면 후회한다생각이 들정도로 장면장면의 디테일에압도당했습니다. 아이맥스 3D가격이전혀 아깝지않았고 아쿠아리움이나동물원에 갈바에 아바타를 3D로보는게나을... ');
insert into Bmt_Post values (0022, 001, 'bbb@bbb.bbb', '가상의', './DATA/PostImage/img032.jpg', '가상의 세계를 완벽하게 구현하려는 야심에는 박수가 아깝지 않지만, 정교한 CG와 웅장한 분위기에 비해 다소 빈약해 보이는 이야기. ');
insert into Bmt_Post values (0023, 001, 'bbb@bbb.bbb', '그냥', './DATA/PostImage/img033.jpg', '그냥 지나가는 스토리요.영상미 그래픽은 좋은데 아바타 1에 비하면 좀... 아쉽습니다. ');
insert into Bmt_Post values (0024, 001, 'bbb@bbb.bbb', '인간', './DATA/PostImage/img034.jpg', '인간 혐오 생기게 하는 영화다잉 ㅠㅠ고래 죽이지마셈 ㅠㅠ ');
insert into Bmt_Post values (0025, 001, 'bbb@bbb.bbb', '영화보는', './DATA/PostImage/img035.jpg', '영화보는 내내 자식들 때문에 고구마 먹는 기분이었다. 아이들은 계속 사고 치고 인질에 또 인질에.. 영화를 왜 이렇게 만들었지? 영상미 좋은건 인정 하지만 이런 스토리면  카메론 감독도 한물갔다 ');
insert into Bmt_Post values (0026, 001, 'bbb@bbb.bbb', '아들이고', './DATA/PostImage/img036.jpg', '아들이고 아버지며 형제였던 영화. 인생영화. ');
insert into Bmt_Post values (0027, 001, 'bbb@bbb.bbb', '1편에선', './DATA/PostImage/img037.jpg', '1편에선 수천명이 모여서 싸웠었는데 2편은 고작해야 50명vs50명? 액션은 축소되고 제이크 설리는 고구마 먹은짓만 골라 한다. CG는 감탄이 나왔지만 1편만큼 신선하고 충격적이진 않았다. CG에 부은 돈 5%라도 ... ');
insert into Bmt_Post values (0028, 001, 'bbb@bbb.bbb', '기대가', './DATA/PostImage/img038.jpg', '기대가 컷던탓인지 눈은즐거웟으나스토리가 아쉬움 ');
insert into Bmt_Post values (0029, 001, 'bbb@bbb.bbb', '숨 참을때', './DATA/PostImage/img039.jpg', '숨 참을때 같이 숨 들이마신 사람 손 ');
insert into Bmt_Post values (0030, 001, 'bbb@bbb.bbb', '여전히', './DATA/PostImage/img040.jpg', '여전히 10점을 받아 마땅하지만 1편이 더 재미있다 ');
insert into Bmt_Post values (0031, 001, 'bbb@bbb.bbb', '재밋음', './DATA/PostImage/img041.jpg', '재밋음. 근데 중간에 싸우던 놈들 다 어디가고 설리가족만 남음?? 장례식때도 보니까 첫째말곤 전사자도 없는거 같더만. 그리고 휘파람 불면 나오는 소환수들은 왜 위급할땐 안부르고 익사 직전까지 가는거고 애초에 불붙은거... ');
insert into Bmt_Post values (0032, 001, 'bbb@bbb.bbb', '관람이', './DATA/PostImage/img042.jpg', '관람이 아니라 체험 그 자체. 초당 3억원 들인 영상미에 경이롭고 황홀했다. n차 뛰어야지... ');
insert into Bmt_Post values (0033, 001, 'bbb@bbb.bbb', '3D 안경을', './DATA/PostImage/img043.jpg', '3D 안경을 끼고 영화 시작하는 순간 이미 가슴이 웅장해짐.끝없는 영상미와 디테일에 정신없이 황홀하게 봤음 .이거 3시간 길다고 징징거리고 스토리 재미 없다고 하는 사람들은요새 틱톡 이런 쇼츠 영상에 너무 길들여져서... ');
insert into Bmt_Post values (0034, 001, 'bbb@bbb.bbb', '눈이', './DATA/PostImage/img044.jpg', '눈이 호강하는 해산물 다큐멘터리 ');
insert into Bmt_Post values (0035, 001, 'bbb@bbb.bbb', '알바인지', './DATA/PostImage/img045.jpg', '알바인지 관종인지 모르겠지만지금 평 다는 애들은 뇌가 비었다는것 만큼은 잘 알겠네요.(조조로 봐도 아직 영화 중반도 안갔음) ');
insert into Bmt_Post values (0036, 001, 'bbb@bbb.bbb', '카메론의 야심을', './DATA/PostImage/img046.jpg', '카메론의 야심을 꽉꽉 눌러담은 192분. 스토리가 탄탄한 밀도높은 영화는 아니지만 영화 역사상 가장 화려한 영상미를 선사하며 당신의 눈을 5살 아이처럼 반짝이게 만들어주기 충분합니다. ');
insert into Bmt_Post values (0037, 001, 'bbb@bbb.bbb', 'sf 내셔널지오', './DATA/PostImage/img047.jpg', 'sf 내셔널지오그래픽 ');
insert into Bmt_Post values (0038, 001, 'bbb@bbb.bbb', '2편 기다리느라 ', './DATA/PostImage/img048.jpg', '2편 기다리느라 힘들었음. 5편 개봉할 때 까지 건강해야지... ');
insert into Bmt_Post values (0039, 001, 'bbb@bbb.bbb', '왜 지금 평점이', './DATA/PostImage/img049.jpg', '왜 지금 평점이 8.9인지 이해불가…. 내가 아바타가 된거마냥 착각하게 만드는 영상미.. 물에 들어갈때마다 괜히 숨막힐정도로 정신이 혼미해짐 그졍도로 대단한 영화입니다 미쳤어요 주말 포디엑스 자리 빡세서 예매만 거의... ');
insert into Bmt_Post values (0040, 001, 'bbb@bbb.bbb', '2009년에도 이게', './DATA/PostImage/img050.jpg', '2009년에도 이게 말이되나.. 했는데 13년이 지난 지금도 이게 말이되나..하는 영화 ');
insert into Bmt_Post values (0041, 001, 'bbb@bbb.bbb', '될 수 있는대로', './DATA/PostImage/img051.jpg', '될 수 있는대로 큰 스크린에서 보길바라요 ');
insert into Bmt_Post values (0042, 001, 'bbb@bbb.bbb', '1편을 보고 너무', './DATA/PostImage/img052.jpg', '1편을 보고 너무 경이로웠고 이번편도 기대가 너무 컸던 탓일까.. 화려한 영상미와 그래픽에비해 각본이 조금 부실한 느낌.. 다음편에서 완결성 지어주길 다시금 기대해봄 ');

commit;

insert into Bmt_Post values (0051, 002, 'aaa@aaa.aaa',  '스토리는', './DATA/PostImage/img061.jpg', '스토리는 평범하지만 장면은 경이롭고 또 경이롭다. ');
insert into Bmt_Post values (0052, 002, 'aaa@aaa.aaa',  '누가', './DATA/PostImage/img062.jpg', '누가 어떤 평을 하든 영화관에서 봐야 후회가 없을 영화라는데는 이견이 없을듯 '); 
insert into Bmt_Post values (0053, 002, 'aaa@aaa.aaa',  '그냥', './DATA/PostImage/img063.jpg', '그냥 내내 답답함과 지루함 스토리개연성 제로 진짜 그냥 영상보는거 밖에 없음 이게 왜 평점이 높은지 이해가 1도 안됨 ');
insert into Bmt_Post values (0054, 002, 'aaa@aaa.aaa',  '영상미', './DATA/PostImage/img064.jpg', '영상미 좋긴한데..보다보면 감흥 없어짐. 스토리 허접..상영시간은끔찍 ');
insert into Bmt_Post values (0055, 002, 'aaa@aaa.aaa',  '지루하지만', './DATA/PostImage/img065.jpg', '지루하지만 볼거리는 많아요 ');
insert into Bmt_Post values (0056, 002, 'bbb@bbb.bbb',  '아바타', './DATA/PostImage/img066.jpg', '아바타 물의길 너무 기대했는데, 뻔한 스토리 전개에 생각보다 지루했다. 영상미는 정말 눈이 휘둥그레 지지만.. 스케일이 너무 작음 1편에 못미침 ');
insert into Bmt_Post values (0057, 002, 'bbb@bbb.bbb',  '뭐하는', './DATA/PostImage/img067.jpg', '뭐하는 거야 3편을 보여줘!!! ');
insert into Bmt_Post values (0058, 002, 'bbb@bbb.bbb',  '영상미', './DATA/PostImage/img068.jpg', '영상미 좋아하시는 분들은 봐도 괜찮을듯!스토리를 중요시 하는 분들은 글쎄요' );
insert into Bmt_Post values (0059, 002, 'bbb@bbb.bbb',  '인간이', './DATA/PostImage/img069.jpg', '인간이 죽는게 이렇게 통쾌하긴 처음이다 ');
insert into Bmt_Post values (0060, 002, 'bbb@bbb.bbb',  '영상미로', './DATA/PostImage/img070.jpg', '영상미로 3시간을 견디기에는 힘들었네요 ');
insert into Bmt_Post values (0061, 002, 'bbb@bbb.bbb',  '방금', './DATA/PostImage/img071.jpg', '방금 4DX 3D로 봤습니다. 꼭 3D로 보세요. 역시는 역시다. 3편 찍어놨다는데 개봉해 주세요. 언능!!! ');
insert into Bmt_Post values (0062, 002, 'bbb@bbb.bbb',  '스쿠버다이빙', './DATA/PostImage/img072.jpg', '스쿠버다이빙 왜 함??아바타보면 되는데 ');
insert into Bmt_Post values (0063, 002, 'bbb@bbb.bbb',  '진부하고', './DATA/PostImage/img073.jpg', '진부하고 단순한 이야기... 아바타1 이후로 많은 시간이 흘렀지만 CG이외에 모든 것들은 과거에 멈춰있는 것 같다.영상미는 최고 ');
insert into Bmt_Post values (0064, 002, 'ccc@ccc.ccc',  '거대한 자연과', './DATA/PostImage/img074.jpg', '거대한 자연과 문화 그리고 타인과의 교감으로 깨우치는 가치는 가족의 소중함이며 어떤 고난과 역경이 닥칠때 가족은 위대한 힘을 발휘한다는 것을 깨닫게 된다.가족에 방점이 찍힌 홈드라마 그리고 돌비로 보니 시각적 신세계... ');
insert into Bmt_Post values (0065, 002, 'ccc@ccc.ccc',  '더 재미났어요', './DATA/PostImage/img075.jpg', '1이 더 재미났어요. 볼거리는 많았는데쓸데없는 장면이 많아서 지루한 구간이 많았어요. . . 시간을 좀 줄여도될것같아요 ');
insert into Bmt_Post values (0066, 002, 'ccc@ccc.ccc',  '시각적으로는 훌륭', './DATA/PostImage/img076.jpg', '시각적으로는 훌륭하지만 스토리가 아쉽긴 하다. 설리의 가족들이 한동안 몸담았던 고향을 너무 쉽게 떠나고 마지막에 바다를 고향으로 삼게 되는 개연성이 부족하게 느껴졌다. ');
insert into Bmt_Post values (0067, 002, 'ccc@ccc.ccc',  '전작에 비해', './DATA/PostImage/img077.jpg', '전작에 비해 서사가 너무 부실합니다 ');
insert into Bmt_Post values (0068, 002, 'ccc@ccc.ccc',  '사실상', './DATA/PostImage/img078.jpg', '사실상 후반 3~40분 가량을 제외한 시간은 수중 생태 다큐에 불과 ');
insert into Bmt_Post values (0069, 002, 'ccc@ccc.ccc',  '그냥', './DATA/PostImage/img079.jpg', '그냥 미침 꼭 3d로 보고 화장실 컨트롤 꼭 하시길 한순간도 놓치면 안됨 ');
insert into Bmt_Post values (0070, 002, 'ccc@ccc.ccc',  '오줌보를', './DATA/PostImage/img070.jpg', '오줌보를 참아야 지나갈 수 있는 길, 물의 길. ');
insert into Bmt_Post values (0071, 002, 'ccc@ccc.ccc',  '전편과', './DATA/PostImage/img080.jpg', '전편과 비교해서 스토리 전개가 조금 지루한 느낌입니다.190분의 시간이 지루함없이 지나갔다는 느낌은 아니였어요...하지만 전작에비해 너무 아름다운 영상미가 돋보이고 감동적이였네요 극장에서 꼭 3D로 보시길 추천드려요... ');
insert into Bmt_Post values (0072, 002, 'ccc@ccc.ccc',  '영상미만', './DATA/PostImage/img081.jpg', '영상미만 엄청난 영화... 중간에 몇번 졸은..?감동두 액션도 스토리도 별루인... ');

commit;


select * from bmt_user;

select * from bmt_board;

select * from bmt_post;

select * 
    from bmt_user u, bmt_post p
where u.email = p.email;
    

select u.email, p.email, p.p_content, p.imgpath
    from bmt_user u, bmt_post p
where u.email = p.email;
    
commit;

select *
    from bmt_post p
where p.email = #{email}
    and p.boardid = 1;

/*
insert into Bmt_Reply values (100001, 0, 0,  002, '', 'bbb@bbb.bbb');

CREATE TABLE Bmt_Reply (
	ReplyId	Number(10)		PRIMARY KEY,
	ParentId	Number(10)		NOT NULL,
	R_Depth	Number(5)		NULL,
	PostId	NUMBER(10)		NOT NULL,
	Reply	VarChar2(500)		NULL,
	Email	VarChar2(50)		NOT NULL
	
   ,foreign key (Email) references Bmt_User(Email)
   ,foreign key (PostId) references Bmt_Post(PostId)
	
);

*/