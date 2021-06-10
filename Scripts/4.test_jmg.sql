select user(), database();

desc theater;

-- 극장 
select tht_no, tht_name, tht_address, tht_lat, tht_long, tht_subs, tht_detail 
	from theater;

select tht_no, tht_name, tht_address, tht_lat, tht_long, tht_subs, tht_detail 
	from theater 
 where tht_no = 2;

select tht_no, tht_name, tht_address, tht_lat, tht_long, tht_subs, tht_detail 
	from theater 
 where tht_name like "대구신세계%";

insert into theater values (
			null,
			'대구이시아', 
			'대구광역시 동구 봉무동 팔공로49길 51', 
			35.92078372990312, 
			128.6356898243599, 
			'test', 
			'[ 대구 프리미엄 영화관 ] 전 좌석 리클라이너 설치, 프라이빗한 모션베드 단독룸 보유, 전관 레이저 영사기 대구 최초 도입! 생생하고 선명한 화질'
);

insert into theater values (
			null, 
			'대구신세계(동대구)', 
			'대구 동구 동부로 149 신세계백화점 8~9층 메가박스 대구신세계지점', 
			35.877686, 
			128.6294, 
			'일반상영관', 
			'메가박스가 대구 지역 최초로 고화질 영상과 생생한 사운드를 선사하는 기술 특화관 MX관. 전 좌석 가죽시트와 JBL사운드에서 즐기는 일반관으로 총 6개의 상영관을 오픈합니다.'
);

insert into theater values (
			null, 
			'북대구(칠곡)', 
			'대구광역시 북구 동암로 100', 
			35.944270157017534, 
			128.56170906909924, 
			'test', 
			'인구 25만의 자족신도시 대구 칠곡 최초의 멀티플렉스. 쇼핑, 영화, 외식까지 한 번에 즐기는 칠곡 문화의 중심'
);

alter table theater auto_increment = 1;

-- 상영관 
select cin_no, cin_row, cin_col, cin_seat, cin_type, cin_adultprice, cin_teenprice, cin_prefprice 
	from cinema;

select cin_no, cin_row, cin_col, cin_seat, cin_type, cin_adultprice, cin_teenprice, cin_prefprice 
	from cinema
 where cin_no = 1;

insert into cinema values (null, 10, 10, cin_row * cin_col, '2D', 10000, 8000, 5000);
insert into cinema values (null, 8, 9, cin_row * cin_col, '3D', 15000, 13000, 10000);
insert into cinema values (null, 6, 8, cin_row * cin_col, '4D', 20000, 18000, 15000);

alter table cinema auto_increment = 1;

-- 영화
desc movie;

-- 컬럼명 : 영화 번호, 제목, 등급, 장르, 런타임, 감독, 출연진, 주요정보, 개봉일, 종료일, 평균 별점, 포스터
select mov_no, mov_title, mov_grade, mov_genre, mov_runtime, mov_director, mov_actor, 
		mov_detail, mov_opendate, mov_enddate, mov_avgstar, mov_poster 
from movie;

-- 박스 오피스 데이터 (영화 번호 ~12)
insert into movie values (
		null, 
		'크루엘라', 
		12, 
		'드라마, 범죄, 코미디', 
		133, 
		'크레이그 질레스피', 
		'엠마 스톤, 엠마 톰슨, 마크 스트롱', 
		'처음부터 난 알았어. 내가 특별하단 걸', 
		'2021-05-26', 
		'2021-07-26', 
		4.5, 
		'Cruella.jpg'
);

insert into movie values (
		null, 
		'캐시트럭', 
		19, 
		'액션', 
		118, 
		'가이 리치', 
		'제이슨 스타뎀, 스콧 이스트우드, 조쉬 하트넷, 홀트 맥칼라니, 제프리 도노반', 
		'캐시트럭을 노리는 무장 강도에 의해 아들을 잃은 H(제이슨 스타뎀).', 
		'2021-06-09', 
		'2021-08-09', 
		4.4, 
		'Wrath of Man.jpg'
);

insert into movie values (
		null, 
		'컨저링3: 악마가 시켰다', 
		15, 
		'공포(호러), 미스터리, 스릴러', 
		112, 
		'마이클 차베즈', 
		'베라 파미가, 패트릭 윌슨', 
		'모든 것은 악마가 시켰다!', 
		'2021-06-03', 
		'2021-08-03', 
		4.1, 
		'The Conjuring3.jpg'
);

insert into movie values (
		null, 
		'분노의 질주 : 더 얼티메이트', 
		12, 
		'액션', 
		143, 
		'저스틴 린', 
		'빈 디젤, 존 시나, 성 강, 샤를리즈 테론, 미셸 로드리게즈, 조다나 브루스터, 헬렌 미렌', 
		'기다림은 끝났다! 전 세계가 기다려온 단 하나의 액션블록버스터!', 
		'2021-05-19', 
		'2021-07-19', 
		4.4, 
		'Fast & Furious.jpg'
);

insert into movie values (
		null, 
		'미스피츠', 
		15, 
		'스릴러, 액션, 어드벤처', 
		94, 
		'레니 할린', 
		'제이미 정, 피어스 브로스넌, 팀 로스, 헤르미온느 코필드, 닉 캐논', 
		'이것이 ‘미스피츠’가 보여줄 참/교/육 이다!', 
		'2021-06-03', 
		'2021-08-03', 
		3.9, 
		'The misfits.jpg'
);

insert into movie values (
		null, 
		'극장판 귀멸의 칼날: 무한열차편', 
		15, 
		'애니메이션', 
		117, 
		'소토자키 하루오', 
		'하나에 나츠키, 키토 아카리, 시모노 히로, 마츠오카 요시츠구, 히노 사토시, 히라카와 다이스케', 
		'혈귀로 변해버린 여동생 ‘네즈코’를 인간으로 되돌릴 단서를 찾아 비밀조직 귀살대에 들어간', 
		'2021-01-27', 
		'2021-07-27', 
		4.5, 
		'Demon Slayer.jpg'
);

insert into movie values (
		null, 
		'뱅드림! 로젤리아 에피소드Ⅰ: 약속', 
		0, 
		'애니메이션', 
		77, 
		'카키모토 코다이', 
		'아이바 아이나, 쿠도 하루카, 나카시마 유키, 사쿠라가와 메구, 시자키 카논', 
		'너희들, Roselia에 전부를 걸 각오는 됐어?', 
		'2021-06-03', 
		'2021-08-03', 
		4.1, 
		'BanG Dream!.jpg'
);

insert into movie values (
		null, 
		'프로페서 앤 매드맨', 
		15, 
		'드라마, 미스터리, 스릴러', 
		124, 
		'P.B. 셰므란', 
		'멜 깁슨, 숀 펜', 
		'역사의 첫 페이지를 연 꿈의 프로젝트,', 
		'2021-06-02', 
		'2021-08-02', 
		3.4, 
		'The Professor and the Madman.jpg'
);

insert into movie values (
		null, 
		'낫아웃', 
		15, 
		'드라마', 
		108, 
		'이정곤', 
		'정재광, 이규성', 
		'“내 꿈은 얼마예요?”', 
		'2021-06-03', 
		'2021-08-03', 
		3.4, 
		'NOT OUT.jpg'
);

insert into movie values (
		null, 
		'아들의 이름으로', 
		12, 
		'드라마, 스릴러', 
		90, 
		'이정국', 
		'안성기, 박근형, 윤유선, 김희찬, 이세은', 
		'“늦었지만 이제는 해야 할 일을 하려고 합니다”', 
		'2021-05-12', 
		'2021-07-17', 
		3.1, 
		'In the Name of the Son.jpg'
);

insert into movie values (
		null, 
		'파이프라인', 
		15, 
		'범죄', 
		133, 
		'유하', 
		'배다빈, 서인국, 이수혁, 음문석, 유승목, 태항호', 
		'목표는 하나, 목적은 여섯!', 
		'2021-05-26', 
		'2021-07-26', 
		4.5, 
		'Pipeline.jpg'
);

insert into movie values (
		null, 
		'보이저스', 
		15, 
		'SF, 스릴러, 어드벤처', 
		108, 
		'닐 버거', 
		'콜린 파렐, 타이 쉐리던, 릴리 로즈 멜로디 뎁, 핀 화이트헤드', 
		'2063년, 극심한 지구 온난화로', 
		'2021-05-26', 
		'2021-07-26', 
		3.4, 
		'Voyagers.jpg'
);


-- 상영예정작 데이터	(영화 번호 13번 부터 시작)
insert into movie values (
		null, 
		'여고괴담 여섯번째 이야기 : 모교', 
		15, 
		'공포(호러), 미스터리', 
		108, 
		'이미영', 
		'김서형, 김현수, 최리, 김형서', 
		'고교시절의 기억을 잃은 ‘은희(김서형)’는', 
		'2021-06-17', 
		'2021-08-17', 
		3.4, 
		'Whispering Corridors 6.jpg'
);

insert into movie values (
		null, 
		'발신제한', 
		15, 
		'드라마, 스릴러', 
		94, 
		'김창주', 
		'조우진, 이재인, 진경', 
		'평범한 출근길, 의문의 발신번호 표시제한 전화 한 통,', 
		'2021-06-23', 
		'2021-08-23', 
		3.4, 
		'Hard Hit.jpg'
);

insert into movie values (
		null, 
		'실크 로드', 
		15, 
		'드라마, 범죄, 스릴러', 
		116, 
		'틸러 러셀', 
		'닉 로빈슨, 제이슨 클락', 
		'지금 당장 마약을 흔적 없이 살 수 있다면?', 
		'2021-06-29', 
		'2021-08-29', 
		3.7, 
		'Silk Road.jpg'
);

insert into movie values (
		null, 
		'화이트 온 화이트', 
		12, 
		'드라마', 
		100, 
		'테오 코트', 
		'알프레도 카스트로, 라스 루돌프', 
		'‘한 장의 잔혹한 아름다움으로 덧칠하다’', 
		'2021-06-10', 
		'2021-08-10', 
		2.0, 
		'White on White.jpg'
);

insert into movie values (
		null, 
		'강호아녀', 
		15, 
		'드라마', 
		136, 
		'지아 장 커 ', 
		'자오 타오, 리아오 판', 
		'중국 산시성 다통시에 사는 ‘차오’와 이 지역의 조직보스 ‘빈’은 연인 사이다.', 
		'2021-06-10', 
		'2021-08-10', 
		0.0, 
		'Ash Is Purest White.jpg'
);

insert into movie values (
		null, 
		'플래시백', 
		15, 
		'드라마, 스릴러', 
		97, 
		'크리스토퍼 맥브라이드', 
		'딜런 오브라이언, 마이카 먼로, 키어 길크리스, 한나 그로스', 
		'“네가 선택하는 순간 그게 너의 현실이 될 거야”', 
		'2021-06-10', 
		'2021-08-10', 
		3.3, 
		'Flashback.jpg'
);

insert into movie values (
		null, 
		'콰이어트 플레이스 2', 
		15, 
		'스릴러', 
		97, 
		'존 크랜신스키 ', 
		'에밀리 블런트, 킬리언 머피, 밀리센트 시몬스, 노아 주프, 디몬 하운수, 웨인 듀발', 
		'소리 없이 맞서 싸워라!', 
		'2021-06-16', 
		'2021-08-16', 
		4.5, 
		'A Quiet Place Part II.jpg'
);

insert into movie values (
		null, 
		'그 여름, 가장 차가웠던', 
		15, 
		'드라마', 
		101, 
		'주순', 
		'등은희, 이감', 
		'3년 전 엄마가 살해된 후, 소녀 ‘자허’와 아빠의 삶은 엉망이다.', 
		'2021-06-17', 
		'2021-08-17', 
		3.5, 
		'Summer is the coldest season.jpg'
);

select mov_no, mov_title, mov_grade, mov_genre, mov_runtime, mov_director, mov_actor, 
		mov_detail, mov_opendate, mov_enddate, mov_avgstar, mov_poster 
from movie;

alter table movie auto_increment = 1;

delete from movie where mov_no > 0;





			
