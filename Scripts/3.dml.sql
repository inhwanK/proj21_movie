select user(), database();

-- 관리자
select adm_no, adm_id, adm_passwd from admin;
insert into admin values (null, 'admin', password(1234));

-- 회원
select mem_no, mem_email, mem_passwd, mem_birthdate, mem_name, mem_phone from member;
insert into member values (null, 'test1@test.com', password(1234), '1990-06-01', '테스트1', '010-1234-1234');
insert into member values (null, 'test2@test.com', password(1234), '2005-06-01', '테스트2', '010-4321-4321');
insert into member values (null, 'test3@test.com', password(1234), '1999-06-01', '테스트3', '010-1342-4312');
insert into member values (null, 'passtest950@gmail.com', password(1234), '2021-07-01', 'testaccountemailtest', '010-1111-1111');

-- 공지
-- 파일관련 테스트는 관리자 페이지에서 직접 파일 업로드 해야합니다. 
select not_no, not_title, not_detail, not_date, not_file from notice;
insert into notice values (null, '공지테스트1', '공지테스트1내용', now(), null);
insert into notice values (null, '공지테스트2', '공지테스트2내용', now(), null);
insert into notice values (null, '공지테스트3', '공지테스트3내용', now(), 'test.txt');
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());

-- 영화
select mov_no, mov_title, mov_grade, mov_genre, mov_runtime, mov_director, mov_actor, mov_detail, mov_opendate, mov_enddate, mov_avgstar, mov_poster, mov_video from movie;

insert into movie values (
		null, 
		'크루엘라', 
		12, 
		'드라마, 범죄, 코미디', 
		133, 
		'크레이그 질레스피', 
		'엠마 스톤, 엠마 톰슨, 마크 스트롱',
		'처음부터 난 알았어. 내가 특별하단 걸<br><br>
		그게 불편한 인간들도 있겠지만 모두의 비위를 맞출 수는 없잖아?<br>
		그러다 보니 결국, 학교를 계속 다닐 수가 없었지<br><br>	
		우여곡절 런던에 오게 된 나, 에스텔라는 재스퍼와 호레이스를 운명처럼 만났고<br>
		나의 뛰어난 패션 감각을 이용해 완벽한 변장과 빠른 손놀림으로 런던 거리를 싹쓸이 했어<br><br>	
		도둑질이 지겹게 느껴질 때쯤, 꿈에 그리던 리버티 백화점에 낙하산(?)으로 들어가게 됐어<br>
		거리를 떠돌았지만 패션을 향한 나의 열정만큼은 언제나 진심이었거든<br><br>	
		근데 이게 뭐야, 옷에는 손도 못 대보고 하루 종일 바닥 청소라니<br>
		인내심에 한계를 느끼고 있을 때, 런던 패션계를 꽉 쥐고 있는 남작 부인이 나타났어<br>
		천재는 천재를 알아보는 법! 난 남작 부인의 브랜드 디자이너로 들어가게 되었지<br><br>		
		꿈을 이룰 것 같았던 순간도 잠시, 세상에 남작 부인이 ‘그런 사람’이었을 줄이야…<br><br>		
		그래서 난 내가 누군지 보여주기로 했어<br>
		잘가, 에스텔라<br><br>
		난 이제 크루엘라야!', 
		'2021-05-26', 
		'2021-07-26', 
		0, 
		'Cruella.jpg',
		'https://www.youtube.com/embed/yfSMTFzw-Kw'
);
insert into movie values (
		null, 
		'캐시트럭', 
		19, 
		'액션', 
		118, 
		'가이 리치', 
		'제이슨 스타뎀, 스콧 이스트우드, 조쉬 하트넷, 홀트 맥칼라니, 제프리 도노반', 
		'캐시트럭을 노리는 무장 강도에 의해 아들을 잃은 H(제이슨 스타뎀).<br><br>
		분노에 휩싸인 그는 아들을 죽인 범인의 단서를 찾기 위해<br>
		현금 호송 회사에 위장 취업한다.<br><br>		
		첫 임무부터 백발백중 사격 실력을 자랑하며,<br>
		단숨에 에이스로 급부상한 H.<br><br>
		캐시트럭을 노리는 자들을 하나 둘 처리하며,<br>
		아들을 죽인 범인들과 점점 가까워지는데…<br><br>	
		자비는 없다, 분노에 가득 찬 응징만이 남았다.<br><br>		
		6월, 그의 분노가 폭발한다!', 
		'2021-06-09', 
		'2021-08-09', 
		0, 
		'Wrath-of-Man.jpg',
		'https://www.youtube.com/embed/SYiEc5GO0-8'
);
insert into movie values (
		null, 
		'컨저링3: 악마가 시켰다', 
		15, 
		'공포(호러), 미스터리, 스릴러', 
		112, 
		'마이클 차베즈', 
		'베라 파미가, 패트릭 윌슨', 
		'모든 것은 악마가 시켰다!<br><br>
		1981년, 미국 역사상 최초로 잔혹한 살인사건의 용의자가<br>
		악마가 살해하도록 시켰다고 주장하는 초유의 사태가 일어난다!<br>
		그리고 사건의 배후에는 악마에게 빙의된 소년이 있었는데…<br>
		초자연 현상 연구가 워렌 부부의 사건 파일 중 여전히 미스터리로 남아있는 실화!<br>
		진실 혹은 거짓? 살인사건의 범인, 인간인가 악마인가…', 
		'2021-06-03', 
		'2021-08-03', 
		0, 
		'The-Conjuring3.jpg',
		'https://www.youtube.com/embed/MRY26k7sUkY'
);
insert into movie values (
		null, 
		'분노의 질주 : 더 얼티메이트', 
		12, 
		'액션', 
		143, 
		'저스틴 린', 
		'빈 디젤, 존 시나, 성 강, 샤를리즈 테론, 미셸 로드리게즈, 조다나 브루스터, 헬렌 미렌', 
		'기다림은 끝났다! 전 세계가 기다려온 단 하나의 액션블록버스터!<br><br>
		도미닉(빈 디젤)은 자신과 가장 가까웠던 형제 제이콥(존 시나)이 사이퍼(샤를리즈 테론)와 연합해<br>
		전 세계를 위기로 빠트릴 위험천만한 계획을 세운다는 사실을 알게 되고,<br>
		이를 막기 위해 다시 한 번 패밀리들을 소환한다.<br><br>
		가장 가까운 자가 한순간, 가장 위험한 적이 된 상황<br>
		도미닉과 패밀리들은 이에 반격할 놀라운 컴백과 작전을 세우고<br>
		지상도, 상공도, 국경도 경계가 없는 불가능한 대결이 시작되는데…', 
		'2021-05-19', 
		'2021-07-19', 
		0, 
		'Fast-&-Furious.jpg',
		'https://www.youtube.com/embed/L9Y-hn2COm0'
);
insert into movie values (
		null, 
		'미스피츠', 
		15, 
		'스릴러, 액션, 어드벤처', 
		94, 
		'레니 할린', 
		'제이미 정, 피어스 브로스넌, 팀 로스, 헤르미온느 코필드, 닉 캐논', 
		'이것이 ‘미스피츠’가 보여줄 참/교/육 이다!<br><br>
		절도는 물론, 탈옥에도 일가견이 있는 범죄자 ‘페이스’. 그에게 뜻밖의 제안이 들어온다.<br>
		변장에 능한 ‘링고’, 폭탄전문가 ‘윅’, 암살자 ‘바이올렛’, 물주 ‘프린스’, 그리고 ‘페이스’의 딸이자 이번 작전의 기획자 ‘호프’까지,<br>
		그들과 함께 테러 자금을 대는 교도소장 ‘슐츠’의 아부다비 교도소에 숨겨진 금을 털자는 것이다.<br><br>	
		스스로 사회 부적응자, 즉 ‘미스피츠’라 이름 지은 그들은 세상 나쁜 놈들에게 사이다 한 방을 날리기 위해 아부다비로 향하는데…', 
		'2021-06-03', 
		'2021-08-03', 
		0, 
		'The-misfits.jpg',
		'https://www.youtube.com/embed/wR6ywHua5jw'
);
insert into movie values (
		null, 
		'극장판 귀멸의 칼날: 무한열차편', 
		15, 
		'애니메이션', 
		117, 
		'소토자키 하루오', 
		'하나에 나츠키, 키토 아카리, 시모노 히로, 마츠오카 요시츠구, 히노 사토시, 히라카와 다이스케', 
		'혈귀로 변해버린 여동생 ‘네즈코’를 인간으로 되돌릴 단서를 찾아 비밀조직 귀살대에 들어간<br><br>
		‘탄지로.’<br>
		‘젠이츠’, ‘이노스케’와 새로운 임무 수행을 위해 무한열차에 탑승 후<br>
		귀살대 최강 검사 염주 ‘렌고쿠’와 합류한다.<br><br>	
		달리는 무한열차에서 승객들이 하나 둘 흔적 없이 사라지자<br>
		숨어있는 식인 혈귀의 존재를 직감하는 ‘렌고쿠’.<br><br>
		귀살대 ‘탄지로’ 일행과 최강 검사 염주 ‘렌고쿠’는<br>
		어둠 속을 달리는 무한열차에서 모두의 목숨을 구하기 위해<br>
		예측불가능한 능력을 가진 혈귀와 목숨을 건 혈전을 시작하는데…', 
		'2021-01-27', 
		'2021-07-27', 
		0, 
		'Demon-Slayer.jpg',
		'https://www.youtube.com/embed/pAPwjvIMxcg'
);
insert into movie values (
		null, 
		'뱅드림! 로젤리아 에피소드Ⅰ: 약속', 
		0, 
		'애니메이션', 
		77, 
		'카키모토 코다이', 
		'아이바 아이나, 쿠도 하루카, 나카시마 유키, 사쿠라가와 메구, 시자키 카논', 
		'너희들, Roselia에 전부를 걸 각오는 됐어?<br><br>
		‘페스’에 출전하기 위해 밴드 결성을 결심한 미나토 유키나.<br>
		그런 그녀 앞에 각자의 소망을 품은 멤버들이 모인다.<br>
		다섯 멤버는 Roselia로서 정상을 노린다.<br>
		이것은 그녀들의 결성부터 FUTURE WORLD FES에 도전하기까지의 ‘약속’을 그린 이야기.', 
		'2021-06-03', 
		'2021-08-03', 
		0, 
		'BanG-Dream!.jpg',
		'https://www.youtube.com/embed/wgP9a-JPGxs'
);
insert into movie values (
		null, 
		'프로페서 앤 매드맨', 
		15, 
		'드라마, 미스터리, 스릴러', 
		124, 
		'P.B. 셰므란', 
		'멜 깁슨, 숀 펜', 
		'역사의 첫 페이지를 연 꿈의 프로젝트,<br><br>
		그 시작에는 두 천재가 있었다!<br><br>
		빅토리아 시대, 대영제국의 부활을 위해 세상을 정의할 ‘옥스퍼드 사전 편찬 프로젝트’가 시작된다.<br>
		책임자로 부임한 이는 수십 개의 언어를 구사하는 괴짜 교수 제임스 머리(멜 깁슨).<br>
		그는 영어를 쓰는 모든 이들로부터 단어와 예문을 모으자는 파격적인 제안을 내놓는다.<br>
		전국에서 편지가 빗발치던 어느 날, 머리는 고전을 풍부하게 인용한 수백 개 예문이 담긴 편지를 발견한다.<br>
		보낸 이는 닥터 윌리엄 마이너(숀 펜), 그의 천재적인 능력으로 불가능해 보였던 사전 편찬 작업엔 속도가 붙는다.<br>
		하지만 윌리엄이 정신병원에 구금된 미치광이라는 사실이 밝혀지게 되는데...', 
		'2021-06-02', 
		'2021-08-02', 
		0, 
		'The-Professor-and-the-Madman.jpg',
		'https://www.youtube.com/embed/fXkLVS1eypc'
);
insert into movie values (
		null, 
		'낫아웃', 
		15, 
		'드라마', 
		108, 
		'이정곤', 
		'정재광, 이규성', 
		'“내 꿈은 얼마예요?”<br><br>
		기적이 일어났고, 끝까지 가고 싶었다.<br><br>	
		특별할 것 없던 열아홉 고교 야구 입시생 ‘광호’는<br>
		봉황대기 결승전 결승타의 주인공이 된다,<br>
		잘 될 것 같았던 신인 드래프트에서 탈락한 ‘광호’.<br><br>
		야구를 계속하기 위해서는 돈이 필요하다고 생각한 ‘광호’는<br>
		친구에게 불법 휘발유를 파는 일을 소개받아 악착같이 돈을 모으기 시작한다.<br><br>		
		하지만 뭐하나 뜻대로 되지 않자,<br>
		결국 ‘광호’는 친구에게 위험한 제안을 하는데….', 
		'2021-06-03', 
		'2021-08-03', 
		0, 
		'NOT-OUT.jpg',
		'https://www.youtube.com/embed/kymRai9G4rY'
);
insert into movie values (
		null, 
		'아들의 이름으로', 
		12, 
		'드라마, 스릴러', 
		90, 
		'이정국', 
		'안성기, 박근형, 윤유선, 김희찬, 이세은', 
		'“늦었지만 이제는 해야 할 일을 하려고 합니다”<br><br>
		반성 없는 세상을 향해, 그의 복수가 시작된다!<br><br>	
		1980년 5월의 광주를 잊지 못하고<br>
		괴로움 속에 살아가던 ‘오채근’(안성기)은<br>
		소중한 아들과의 약속을 지키기 위해<br>
		반성 없이 호의호식하며 살아가는 이들에게 복수를 하기로 마음 먹고<br>
		당시의 책임자 중 한 사람이었던 ‘박기준’(박근형)에게 접근하는데…', 
		'2021-05-12', 
		'2021-07-17', 
		0, 
		'In-the-Name-of-the-Son.jpg',
		'https://www.youtube.com/embed/5-lnu7mbGFY'
);
insert into movie values (
		null, 
		'파이프라인', 
		15, 
		'범죄', 
		133,
		'유하', 
		'배다빈, 서인국, 이수혁, 음문석, 유승목, 태항호', 
		'목표는 하나, 목적은 여섯!<br><br>
		화끈하게 뚫고, 완벽하게 빼돌려라!<br><br>​
		손만 대면 대박을 터트리는 도유 업계 최고 천공기술자 ‘핀돌이’는<br>
		수천억의 기름을 빼돌리기 위해 거대한 판을 짠 대기업 후계자 ‘건우’의<br>
		거부할 수 없는 제안에 빠져 위험천만한 도유 작전에 합류한다.<br><br>
		프로 용접공 ‘접새’, 땅 속을 장기판처럼 꿰고 있는 ‘나과장’,<br>
		괴력의 인간 굴착기 ‘큰삽’, 이 모든 이들을 감시하는 ‘카운터’까지!<br><br>​
		그러나 저마다 다른 목적을 가진 이들이 서로를 속고 속이면서<br>
		계획은 예상치 못한 방향으로 흘러가기 시작하는데...<br><br>​
		인생 역전을 꿈꾸는 여섯 명의 도유꾼들<br>​
		그들의 막장 팀플레이가 시작된다!', 
		'2021-05-26', 
		'2021-07-26', 
		0, 
		'Pipeline.jpg',
		'https://www.youtube.com/embed/KgsMl1KHmxA'
);
insert into movie values (
		null, 
		'보이저스', 
		15, 
		'SF, 스릴러, 어드벤처', 
		108, 
		'닐 버거', 
		'콜린 파렐, 타이 쉐리던, 릴리 로즈 멜로디 뎁, 핀 화이트헤드', 
		'2063년, 극심한 지구 온난화로<br><br>
		미래 세대가 살아갈 새로운 행성을 개척하기 위해<br>
		‘인류 이주 프로젝트’를 계획한다.<br><br>
		완벽한 우성 인자로 태어나 철저하게 격리 훈련을 받은 ‘30명의 탐사대원들’과<br>
		이들을 이끌 대장 ‘리처드’는 ‘휴매니타스호’에 탑승해 우주로 향하게 된다.<br><br>
		한편, 일부 탐사대원들은 자신들의 임무에 대해 떨칠 수 없는 의문을 갖게 되고<br>
		그들의 생활 속에 밀접한 ‘블루’를 가장 먼저 의심하기 시작한다.<br>
		의심의 시작과 함께 비밀과 음모가 하나 둘 밝혀지고<br>
		대원들은 곧 겉잡을 수 없는 혼란에 빠지게 되는데…<br><br>
		인류를 위한 새로운 행성까지 앞으로 86년,<br>
		과연 이들은 ‘인류 이주 프로젝트’를 완수할 수 있을까?!', 
		'2021-05-26', 
		'2021-07-26', 
		0, 
		'Voyagers.jpg',
		'https://www.youtube.com/embed/4gxMoIF1f8c'
);

insert into movie values (
		null, 
		'여고괴담 여섯번째 이야기 : 모교', 
		15, 
		'공포(호러), 미스터리', 
		108, 
		'이미영', 
		'김서형, 김현수, 최리, 김형서', 
		'고교시절의 기억을 잃은 ‘은희(김서형)’는<br><br>
		모교에 교감으로 부임한 후부터<br>
		알 수 없는 환영과 환청에 시달리기 시작한다.<br><br>	
		피해자임에도 불구하고 문제아로 내몰린 ‘하영(김현수)’은<br>
		홀리듯 들어간 학교의 폐쇄된 화장실에서 귀신 소리를 듣게 되고<br>
		그 곳에서 같은 아픔을 가진 ‘은희(김서형)’와 마주친다.<br><br>
		두 사람은 학교에서 벌어지는 기이한 일들이<br>
		화장실에 있는 존재와 연관됐음을 알게 되고,<br>
		곧 죽음의 공포와 마주하게 된다.<br><br>
		기억 속에 감춰진 충격적인 진실이 밝혀진다!', 
		'2021-06-17', 
		'2021-08-17', 
		0, 
		'Whispering-Corridors6.jpg',
		'https://www.youtube.com/embed/pUzBmQLSeqQ'
);
insert into movie values (
		null, 
		'발신제한', 
		15, 
		'드라마, 스릴러', 
		94, 
		'김창주', 
		'조우진, 이재인, 진경', 
		'평범한 출근길, 의문의 발신번호 표시제한 전화 한 통,<br><br>
		“지금 당신의 의자 밑에는 폭탄이 설치되어 있습니다”<br><br>
		은행센터장 성규(조우진)는 아이들을 차에 태우고 출발한 평범한 출근길에<br>
		한 통의 발신번호 표시제한 전화를 받는다.<br>
		전화기 너머 의문의 목소리는 차에 폭탄이 설치되어 있고,<br>
		자리에서 일어날 경우 폭탄이 터진다고 경고하는데…<br><br>
		의문의 전화를 보이스피싱이라고 대수롭지 않게 여기던 성규는<br>
		곧 회사 동료의 차가 같은 방식으로 폭파되는 것을 바로 눈앞에서 목격하고,<br>
		졸지에 부산 도심 테러의 용의자가 되어 경찰의 추격을 받게 된다.<br><br>
		내리면 폭탄이 터지는 절체절명의 순간,<br>
		경찰의 추격 속 의문의 발신자와의 전화마저 끊을 수 없는 상황에 놓이게 되는데…!', 
		'2021-06-23', 
		'2021-08-23', 
		0, 
		'Hard-Hit.jpg',
		'https://www.youtube.com/embed/WSmgHodVqDk'
);
insert into movie values (
		null, 
		'실크 로드', 
		15, 
		'드라마, 범죄, 스릴러', 
		116, 
		'틸러 러셀', 
		'닉 로빈슨, 제이슨 클락', 
		'지금 당장 마약을 흔적 없이 살 수 있다면?<br><br>
		역대급 재능낭비 충격 실화!<br><br>	
		개인이 마약을 하든 뭘 하든<br>
		국가의 통제는 억압이라 생각하는<br>
		상위 1% 비합법적 천재 ‘로스’.<br><br>
		뛰어난 두뇌와 치밀한 계획으로<br>
		비트코인을 이용해 흔적 없이<br>
		마약 쿨거래가 가능한<br>
		다크 웹사이트 ‘실크로드’를 만든다.<br><br>
		‘실크로드’로 돈맛을 알고<br>
		세상을 향한 X를 날렸다고 생각한 바로 그 순간,<br>
		정체불명 누군가가 말을 걸어오는데…
		', 
		'2021-06-29', 
		'2021-08-29', 
		0, 
		'Silk-Road.jpg',
		'https://www.youtube.com/embed/hGoyCt60dNI'
);
insert into movie values (
		null, 
		'화이트 온 화이트', 
		12, 
		'드라마', 
		100, 
		'테오 코트', 
		'알프레도 카스트로, 라스 루돌프', 
		'‘한 장의 잔혹한 아름다움으로 덧칠하다’<br><br>
		20세기 초반, 중년의 사진작가 ‘페드로’는<br>
		정체 모를 지주 ‘포터’의 결혼식 사진을 찍기 위해<br>
		설원으로 둘러싸인 칠레의 어느 마을에 도착한다.<br>
		하지만 소녀 티가 아직 가시지 않은 어린 신부만이 나타나고<br>
		‘페드로’는 그녀의 순수한 아름다움에 집착하다<br>
		결국 ‘포터’의 부하들에게 끌려가고 마는데…<br><br>	
		세상 끝에 선 사진작가, 잔혹한 현실을 마주한다!', 
		'2021-06-10', 
		'2021-08-10', 
		0, 
		'White-on-White.jpg',
		'https://www.youtube.com/embed/tpmDLQVuLqM'
);
insert into movie values (
		null, 
		'강호아녀', 
		15, 
		'드라마', 
		136, 
		'지아 장 커 ', 
		'자오 타오, 리아오 판', 
		'중국 산시성 다통시에 사는 ‘차오’와 이 지역의 조직보스 ‘빈’은 연인 사이다.<br><br>
		라이벌 갱단과의 싸움 도중 ‘차오’는 ‘빈’을 보호하기 위해 총을 발포하게 되고<br>
		그로 인해 감옥에 5년간 복역하게 되지만 ‘빈’은 단 한 번도 그녀를 찾아오지 않는다.<br><br>
		출소한 ‘차오’는 새로운 시작을 위해 ‘빈’을 찾아가지만 그는 이미 새로운 여자친구와<br>
		‘차오’가 없는 대도시에서의 삶을 살아가는 중이었다.<br><br>	
		시간이 흘러 ‘차오’ 또한 ‘빈’이 없는 일상에서 평온하게 지내고 있던 중에 ‘빈’이 찾아오는데…<br><br>
		17년간의 질긴 인연, 지아장커가 선사하는 현실 로맨스!', 
		'2021-06-10', 
		'2021-08-10', 
		0, 
		'Ash-Is-Purest-White.jpg',
		'https://www.youtube.com/embed/yGtHna19s-0'
);
insert into movie values (
		null, 
		'플래시백', 
		15, 
		'드라마, 스릴러', 
		97, 
		'크리스토퍼 맥브라이드', 
		'딜런 오브라이언, 마이카 먼로, 키어 길크리스, 한나 그로스', 
		'“네가 선택하는 순간 그게 너의 현실이 될 거야”<br><br>
		과거, 현재, 미래를 초월하는 금지된 약 ‘머큐리’<br><br>
		단조로운 일상에 지친 직장인 ‘프레드릭’.<br>
		어느 날 길에서 마주친 낯선 남자에게서 데자뷔를 느낀 뒤<br>
		기억 저편에 묻어두었던 고등학생 시절 첫사랑 ‘신디’를 떠올린다.<br><br>
		신디가 졸업 시험을 앞두고 갑자기 사라졌다는 사실을 알게 된 프레드릭은<br>
		그의 실종이 친구들과 호기심에 삼킨 금지된 약 ‘머큐리’와 깊이 연관되어 있음을 직감한다.<br><br>		
		“나는 과거의 기억인가, 미래의 환영인가”<br>
		과거와 미래의 경계에 갇힌 프레드릭의 마지막 선택!<br><br>	
		과거의 미스터리를 파헤칠수록 시공간이 무너지는 기묘한 감각을 느끼게 되고<br>
		악몽 같은 과거와 감옥 같은 미래의 경계에 갇힌 프레드릭은 자신의 현실을 결정할 최후의 선택을 한다.', 
		'2021-06-10', 
		'2021-08-10', 
		0, 
		'Flashback.jpg',
		'https://www.youtube.com/embed/zinc2c1_Nus'
);
insert into movie values (
		null, 
		'콰이어트 플레이스 2', 
		15, 
		'스릴러', 
		97, 
		'존 크랜신스키 ', 
		'에밀리 블런트, 킬리언 머피, 밀리센트 시몬스, 노아 주프, 디몬 하운수, 웨인 듀발', 
		'소리 없이 맞서 싸워라!<br><br>
		실체를 알 수 없는 괴생명체의 공격으로 일상의 모든 것이 사라진 세상,<br>
		아이들 대신 죽음을 선택한 아빠의 희생 이후 살아남은 가족들은 위험에 노출된다.<br>
		갓 태어난 막내를 포함한 아이들과 함께 소리 없는 사투를 이어가던 엄마 ‘에블린’은<br>
		살아남기 위해 새로운 은신처를 찾아 집 밖을 나서지만,<br>
		텅 빈 고요함으로 가득한 바깥은 더 큰 위험이 도사리고 있는데...', 
		'2021-06-16', 
		'2021-08-16', 
		0, 
		'A-Quiet-Place-Part-II.jpg',
		'https://www.youtube.com/embed/clWcJd9ZIbY'
);
insert into movie values (
		null, 
		'그 여름, 가장 차가웠던', 
		15, 
		'드라마', 
		101, 
		'주순', 
		'등은희, 이감', 
		'3년 전 엄마가 살해된 후, 소녀 ‘자허’와 아빠의 삶은 엉망이다.<br><br>
		친구들에게 왕따를 당하고, 아빠와도 마음 속 이야기를 하지 않게 된 소녀,<br>
		그러던 어느 날 우연히 자신의 엄마를 죽인 소년 ‘유레이’와 마주치게 된다.<br>
		예상보다 빨리 석방된 그를 보고 소녀는 분노에 휩싸이고,<br>
		복수하고 싶은 마음으로 그에게 의도적으로 접근하게 되는데…', 
		'2021-06-17', 
		'2021-08-17', 
		0, 
		'Summer-is-the-coldest-season.jpg',
		'https://www.youtube.com/embed/33pNshzcZgo'
);

-- 상영 예정작 데이터 (오늘 날짜 이후)-------------------------------
insert into movie values (
		null, 
		'블랙 위도우', 
		12, 
		'SF, 액션, 어드벤처', 
		134, 
		'케이트 쇼트랜드', 
		'스칼렛 요한슨, 플로렌스 퓨, 레이첼 와이즈, 데이빗 하버', 
		'”모든 것을 바꾼 그녀의 선택”<br><br>
		어벤져스의 운명을 바꾼 블랙 위도우, 그녀의 진짜 이야기가 시작된다!<br><br>
		어벤져스의 히어로 블랙 위도우, ‘나타샤 로마노프’ (스칼렛 요한슨)는<br>
		자신의 과거와 연결된 레드룸의 거대한 음모와 실체를 깨닫게 된다.<br><br>
		상대의 능력을 복제하는 빌런 ‘태스크마스터’와 새로운 위도우들의 위협에 맞서<br>
		목숨을 건 반격을 시작하는 ‘나타샤’는 스파이로 활약했던 자신의 과거 뿐 아니라,<br>
		어벤져스가 되기 전 함께했던 동료들을 마주해야만 하는데…<br><br>
		폭발하는 리얼 액션 카타르시스!<br>
		7월, MCU의 새로운 시대를 시작할 첫 액션 블록버스터를 만끽하라!', 
		'2021-07-07', 
		'2021-09-07', 
		0, 
		'Black-Widow.jpg',
		'https://www.youtube.com/embed/7oNrTvNX7WA'
);

insert into movie values (
		null, 
		'미션 임파서블: 루벤', 
		15, 
		'미스터리, 범죄, 스릴러, 애니메이션, 액션, 어드벤처', 
		94, 
		'밀로라드 크르스틱', 
		'가브리엘라 하모리, 이반 카마라스', 
		'파리 오르세 미술관에서 마네의 ‘올랭피아’ 도난 사건이 발생하고,<br><br>
		연이어 폴 고갱의 ‘과일을 든 여인’, 반 고흐의 ‘우편배달부 조셉 룰랭의 초상’,<br>
		피카소의 ‘책을 든 여인’, 에드워드 호퍼의 ‘밤을 지새우는 사람들’까지…<br>
		세계 곳곳에서 유명 명화들이 사라지기 시작한다!<br><br>
		범인은 바로 심리치료사 루벤과 그의 환자 미미, 페르난도, 조, 브루노!<br>
		루벤이 명화 속 주인공들에게 공격당하는 끔찍한 악몽에 시달리자<br>
		다 함께 문제의 예술작품 13점을 훔치기 시작한 것!<br><br>
		하지만 마지막 작전을 앞두고 사립탐정 코왈스키에게 덜미가 잡히고<br>
		현상금을 노리는 킬러들에게 쫓기기 시작하며 예기치 못한 위험에 빠지는데…<br><br>
		남은 명화는 단 하나!<br>
		마지막 한탕을 위한 팀 루벤의 미션 임파서블이 시작된다!', 
		'2021-07-08', 
		'2021-09-08', 
		0, 
		'Ruben-Brandt,Collector.jpg',
		'https://www.youtube.com/embed/swkLIwKp1Yk'
);

insert into movie values (
		null, 
		'랑종', 
		19, 
		'공포(호러), 드라마, 스릴러', 
		131, 
		'반종 피산다나쿤', 
		'나릴야 군몽콘켓, 싸와니 우툼마, 씨라니 얀키띠칸, 야사카 차이쏜', 
		'태국 북동부 ‘이산’ 지역 낯선 시골 마을.<br><br>
		집 안, 숲, 산, 나무, 논밭까지,<br>
		이곳의 사람들은<br>
		모든 것에 혼이 깃들어 있다고 믿는다.<br><br>
		가문의 대를 이어 조상신 ‘바얀 신’을 모시는 랑종(무당) ‘님’은<br>
		조카 ‘밍’의 상태가 심상치 않음을 직감한다.<br>
		날이 갈수록 이상 증세가 점점 심각해지는 ‘밍’.<br>
		무당을 취재하기 위해 ‘님’과 동행했던 촬영팀은<br>
		신내림이 대물림되는 순간을 포착하기 위해<br>
		‘밍’과 ‘님’, 그리고 가족에게 벌어지는 미스터리한 현상을 카메라에 담기 시작한다.<br><br>
		신내림이 대물림되는 무당 가문<br>
		피에 관한 세 달간의 기록', 
		'2021-07-14', 
		'2021-09-14', 
		0, 
		'The-Medium.jpg',
		'https://www.youtube.com/embed/Xj7jMVlW2vk'
);

insert into movie values (
		null, 
		'꽃다발 같은 사랑을 했다', 
		12, 
		'로맨스', 
		123, 
		'도이 노부히로', 
		'아리무라 카스미, 스다 마사키', 
		'“시작은 막차였다”<br><br>
		집으로 가는 막차를 놓친 스물한 살 대학생 ’무기’와 ‘키누’는<br>
		첫차를 기다리며 함께 시간을 보내게 된다.<br>
		좋아하는 책부터 영화, 신고 있는 신발까지 모든 게 꼭 닮은 두 사람은<br>
		수줍은 고백과 함께 연애를 시작하고 매일매일 행복한 시간을 쌓아간다.<br><br>
		“내 인생의 목표는 너와의 현상 유지야!”<br>
		하지만 대학 졸업과 함께 취업 준비에 나선 두 사람은 점점 서로에게 소원해지고<br>
		꿈과 현실 사이의 거리 만큼 마음의 거리도 멀어지기 시작하는데...', 
		'2021-07-14', 
		'2021-09-14', 
		0,
		'I-Fell-in-Love-Like-A-Flower-Bouquet.jpg',
		'https://www.youtube.com/embed/dpC79PWrHqM'
);

insert into movie values (
		null, 
		'더 퍼지: 포에버', 
		19, 
		'공포(호러), 스릴러', 
		103, 
		'에베라도 발레리오 구트', 
		'안나 데 라 레구에라, 조쉬 루카스, 윌 패튼', 
		'매년 단 하루, 12시간 동안 살인은 물론 어떤 범죄도 허용되는 미국의 연례 행사 ‘퍼지’ 데이!<br><br>
		아메리칸 드림을 꿈꾸며 미국에 정착한 멕시코 부부 ‘아델라’와 ‘후안’,<br>
		텍사스 부촌에서 마구간과 농장을 꾸리며 안락하게 살아가는 ‘딜런’ 가족까지<br>
		모든 이들이 긴장감 속에서 ‘퍼지’ 데이를 맞이한다.<br><br>
		다행히 큰 사고없이 ‘퍼지’ 데이를 보낸 이들은 공식적인 ‘퍼지’ 종료 사이렌이 울리자 일상으로 복귀한다.<br>
		하지만 ‘영원한 퍼지’를 통한 ‘미국의 정화’를 외치는 추종자 세력이 등장하면서<br>
		걷잡을 수 없는 폭력과 살인이 난무하기 시작한다.<br><br>
		안전을 위해 멕시코 국경까지 이동해야 하는 ‘아델라’와 ‘후안’, 그리고 ‘딜런’ 가족은<br>
		과연 공권력과 법의 통제가 완전히 사라져버린 ‘영원한 퍼지’ 속에서 살아남을 수 있을 것인가…<br><br>
		시작만 있을 뿐, 더 이상의 끝은 존재하지 않는 ‘영원한 퍼지’가 온다!', 
		'2021-07-14', 
		'2021-09-14', 
		0, 
		'The-Forever-Purge.jpg',
		'https://www.youtube.com/embed/7wIC0gF01-Y'
);

insert into movie values (
		null, 
		'오필리아', 
		15, 
		'드라마, 로맨스', 
		106, 
		'클레어 맥카시', 
		'데이지 리들리, 조지 맥케이', 
		'“드디어 내 이야기를 들려줄 때가 왔군요”<br><br>
		현명함과 자유로움을 지닌 오필리아는 왕비 거트루드의 총애를 받아 왕실의 시녀가 된다.<br>
		왕실의 규율에 얽매이지 않는 오필리아에게 첫눈에 반한 왕자 햄릿은 운명적 사랑에 빠지지만<br>
		신분의 격차로 인해 두 사람의 사랑은 위기를 맞는다.<br>
		선왕의 갑작스런 죽음으로 왕국은 혼란에 빠지고,<br>
		오필리아는 이 사건의 배후에 커다란 음모가 감춰져 있음을 알게 되는데…', 
		'2021-07-14', 
		'2021-09-14', 
		0, 
		'Ophelia.jpg',
		'https://www.youtube.com/embed/qbpKLwTBV3A'
);

insert into movie values (
		null, 
		'보스 베이비 2', 
		0, 
		'애니메이션, 어드벤처, 코미디', 
		107, 
		'톰 맥그라스', 
		'알렉 볼드윈, 에이미 세다리스, 제임스 마스던, 제프 골드블럼, 지미 키멜', 
		'가족 같은 회사로 모십니다<br><br>
		베이비 주식회사의 레전드 보스 베이비에서 인생 만렙 CEO가 된 ‘테드’.<br>
		베이비인 줄 알았던 조카 ‘티나’가 알고 보니 베이비 주식회사 소속이라니!<br>
		뉴 보스 베이비 ‘티나’의 지시로 ‘테드’는 형과 함께 다시 베이비로 돌아가야만 하는데…<br><br>
		보스 베이비 IS BACK<br><br>
		* 공식 홈페이지 주소: http://bossbaby2.universalpictureskr.com/', 
		'2021-07-21', 
		'2021-09-21', 
		0, 
		'The-Boss-Baby2.jpg',
		'https://www.youtube.com/embed/lxE2JI6MgEE'
);

insert into movie values (
		null, 
		'옥스포드 살인사건', 
		15, 
		'범죄, 스릴러', 
		108, 
		'알렉스 드 라 이글레시아', 
		'일라이저 우드, 존 허트', 
		'옥스포드 대학 인근의 호화 저택에서 어느 날, 저명한 암호해독가가 살해당한다.<br><br>
		암호해독가의 절친한 친구였던 수학자 ‘아서 셀덤’ 교수(존 허트)와<br>
		이곳에서 하숙을 하던 대학원생 ‘마틴’(일라이저 우드)이 현장을 최초로 발견하고,<br>
		곧 이 사건이 단순한 살인이 아님을 확신한다.<br>
		그날 이후, 셀덤 교수에게 의문의 기호가 적힌 편지가 배달되고<br>
		다음날에는 반드시 기이한 살인 사건이 일어나 옥스포드 대학 일대가 공포에 휩싸이는데…', 
		'2021-07-21', 
		'2021-09-21', 
		0, 
		'The-Oxford-Murders.jpg',
		'https://www.youtube.com/embed/kiNSTul-cPM'
);

select mov_no, mov_title, mov_grade, mov_genre, mov_runtime, mov_director, mov_actor, 
		mov_detail, mov_opendate, mov_enddate, mov_avgstar, mov_poster 
from movie;

-- 한줄평
select com_no, mov_no, com_user, com_content, com_star, com_date from comment;
insert into comment values (null, 1, 'test1@test.com', '재미있음', 4, now());
insert into comment values (null, 2, 'test1@test.com', '그저그럼', 3, now());
insert into comment values (null, 3, 'test1@test.com', '노잼', 2, now());

-- 극장
select tht_no, tht_name, tht_address, tht_lat, tht_long, tht_subs, tht_detail from theater;
insert into theater values (
			null,
			'대구이시아', 
			'대구광역시 동구 봉무동 팔공로49길 51', 
			35.920749, 
			128.635719, 
			'장애인석', 
			'[ 대구 프리미엄 영화관 ] 전 좌석 리클라이너 설치, 프라이빗한 모션베드 단독룸 보유 <br> 전관 레이저 영사기 대구 최초 도입! 생생하고 선명한 화질'
);
insert into theater values (
			null, 
			'대구신세계(동대구)', 
			'대구 동구 동부로 149 신세계백화점 8~9층 메가박스 대구신세계지점', 
			35.877686, 
			128.6294, 
			'일반상영관', 
			'메가박스가 대구 지역 최초로 고화질 영상과 생생한 사운드를 선사하는 기술 특화관 MX관. <br> 전 좌석 가죽시트와 JBL사운드에서 즐기는 일반관으로 총 6개의 상영관을 오픈합니다.'
);
insert into theater values (
			null, 
			'북대구(칠곡)', 
			'대구광역시 북구 동암로 100', 
			35.9440731, 
			128.561734, 
			'일반상영관, 장애인석', 
			'인구 25만의 자족신도시 대구 칠곡 최초의 멀티플렉스 <br> 쇼핑, 영화, 외식까지 한 번에 즐기는 칠곡 문화의 중심'
);

-- 상영관
select cin_no, cin_row, cin_col, cin_seat, cin_type, cin_adultprice, cin_teenprice, cin_prefprice from cinema;
insert into cinema values (null, 10, 10, cin_row * cin_col, '2D', 10000, 8000, 5000);
insert into cinema values (null, 8, 9, cin_row * cin_col, '3D', 15000, 13000, 10000);
insert into cinema values (null, 6, 8, cin_row * cin_col, '4D', 20000, 18000, 15000);

-- 극장상영관정보
select * from theater_cinema;
insert into theater_cinema values (1, 1);
insert into theater_cinema values (1, 2);
insert into theater_cinema values (1, 3);
insert into theater_cinema values (2, 1);
insert into theater_cinema values (2, 2);
insert into theater_cinema values (2, 3);
insert into theater_cinema values (3, 1);
insert into theater_cinema values (3, 2);
insert into theater_cinema values (3, 3);

-- 상영정보
-- 상영정보 입력시 시작시간 설정 후 해당 영화의 런타임을 가져와서 시작시간에 더하여 shw_endtime에 넣어줄 것 
-- delete from showinfo where shw_no = 1;
-- alter table showinfo auto_increment = 1;
select shw_no, tht_no, cin_no, mov_no, shw_date, shw_starttime, shw_endtime from showinfo;
insert into showinfo values (null, 1, 1, 1, '2021-07-02', '10:00:00', 
addtime('10:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));
insert into showinfo values (null, 1, 1, 1, '2021-07-02', '14:00:00', 
addtime('14:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));
insert into showinfo values (null, 1, 1, 1, '2021-07-02', '20:00:00', 
addtime('20:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));

insert into showinfo values (null, 1, 2, 1, '2021-07-02', '10:00:00', 
addtime('10:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));
insert into showinfo values (null, 1, 2, 1, '2021-07-02', '14:00:00', 
addtime('14:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));
insert into showinfo values (null, 1, 2, 1, '2021-07-02', '20:00:00', 
addtime('20:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));

insert into showinfo values (null, 2, 2, 2, '2021-07-02', '14:00:00', 
addtime('14:00:00', sec_to_time((select mov_runtime from movie where mov_no = 2) * 60)));
insert into showinfo values (null, 2, 2, 2, '2021-07-02', '20:00:00', 
addtime('20:00:00', sec_to_time((select mov_runtime from movie where mov_no = 2) * 60)));

-- 예매
select res_no, shw_no, mem_no, res_price, res_date, res_adult, res_teen, res_pref from reservation;
insert into reservation values (null, 3, 1, 50000, now(), 5, 0, 0);


-- 좌석
select seat_no, res_no, shw_no, seat_rowno, seat_colno from seat;
insert into seat values (null, 1, 3, 3, 4);
insert into seat values (null, 1, 3, 4, 4);
insert into seat values (null, 1, 3, 6, 6);
insert into seat values (null, 1, 3, 8, 10);
insert into seat values (null, 1, 3, 1, 8);


-- 문의
select inq_no, inq_title, inq_user, inq_detail, inq_date, inq_file, inq_answer, inq_ansdate, inq_status from inquiry;
insert into inquiry values (null, '이게 안됨', 'testuser', '많이 안됨', now(), 'inquirytest1.txt', null, null, 0);
insert into inquiry values (null, '저게 안됨', 'testuser2', '더 많이 안됨', now(), 'inquirytest2.txt', '잘 해보세요', now(), 1);