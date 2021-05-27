select user(), database();

-- 관리자
select adm_no, adm_id, adm_passwd from admin;
insert into admin values (null, 'admin', password(1234));

-- 회원
select mem_no, mem_email, mem_passwd, mem_birthdate, mem_name, mem_phone, mem_point, mem_grade from member;
insert into member values (null, 'test@test.com', password(1234), '1990-06-01', '테스트', '010-1234-1234', 0, '실버');
insert into member values (null, 'test2@test.com', password(1234), '2005-06-01', '테스트2', '010-4321-4321', 5000, 'VIP');
insert into member values (null, 'test3@test.com', password(1234), '1999-06-01', '테스트3', '010-1342-4312', 2000, '골드');

-- 비회원
select nom_no, nom_phone, nom_passwd, nom_name, nom_birthdate from no_member;
insert into no_member values (null, '010-1111-1111', password(1234), '비회원1', '1995-04-24');
insert into no_member values (null, '010-2222-2222', password(1234), '비회원2', '2010-04-24');
insert into no_member values (null, '010-3333-3333', password(1234), '비회원3', '2004-04-24');

-- 공지
select not_no, not_passwd, not_title, not_detail, not_date, not_file from notice;
insert into notice values (null, password(1234), '공지테스트1', '공지테스트1내용', now(), null);
insert into notice values (null, password(1234), '공지테스트2', '공지테스트2내용', now(), null);
insert into notice values (null, password(1234), '공지테스트3', '공지테스트3내용', now(), null);

-- 이벤트
select ev_no, ev_passwd, ev_title, ev_detail, ev_startdate, ev_enddate, ev_date, ev_file from event;
insert into event values (null, password(1234), '이벤트테스트1', '이벤트테스트1내용', '2021-05-01', '2021-05-10', now(), null);
insert into event values (null, password(1234), '이벤트테스트2', '이벤트테스트2내용', '2021-05-20', '2021-06-30', now(), null);
insert into event values (null, password(1234), '이벤트테스트3', '이벤트테스트3내용', '2021-06-20', '2021-07-10', now(), null);

-- 영화
select mov_no, mov_title, mov_grade, mov_genre, mov_runtime, mov_director, mov_actor, mov_detail, mov_teaser, mov_opendate, mov_enddate, mov_avgstar, mov_poster from movie;
insert into movie values (null, '크루엘라', 12, '드라마, 범죄, 코미디', 133, '크레이그 질레스피', '엠마 스톤, 엠마 톰슨, 마크 스트롱, 폴 월터 하우저', '잘가, 에스텔라. 난 이제 크루엘라야!', 'https://youtu.be/yfSMTFzw-Kw', '2021-05-26', '2021-07-26', 9.66, null);
insert into movie values (null, '분노의 질주:더 얼티메이트', 12, '액션', 133, '저스틴 린', '빈 디젤, 존 시나, 성 강', '기다림은 끝났다! 전 세계가 기다려온 단 하나의 액션블록버스터!', 'https://youtu.be/L9Y-hn2COm0', '2021-04-26', '2021-05-30', 8.06, null);
insert into movie values (null, '파이프라인', 15, '범죄', 108, '유하', '서인국, 이수혁, 음문석', '목표는 하나, 목적은 여섯! 화끈하게 뚫고, 완벽하게 빼돌려라!', 'https://youtu.be/KbFhzL1b8iQ', '2021-04-25', '2021-06-25', 6.45, null);
insert into movie values (null, '스파이럴', 18, '스릴러', 93, '대런 린 보우즈만', '크리스 록, 사무엘 L.잭슨, 마리솔 니콜스', '경찰서로 배달된 의문의 소포. 그리고 시작된 경찰 연쇄살인. 또 다른 살인이 시작되기 전 단서를 찾고 사건을 해결하라!', 'https://youtu.be/bQm0_3lgfvo', '2021-05-12', '2021-07-12', 7.75, null);

-- 영화 사진
select mp_no, mov_no, mp_pic from movie_pic;
insert into movie_pic values (null, 1, 'test');
insert into movie_pic values (null, 1, 'test2');
insert into movie_pic values (null, 2, 'test');
insert into movie_pic values (null, 3, 'test');
insert into movie_pic values (null, 4, 'test');

-- 한줄평
select mov_no, com_user, com_content, com_star, com_date from comment;

-- 극장
select tht_no, tht_name, tht_address, tht_lat, tht_long, tht_subs, tht_detail from theater;
insert into theater values (null, '대구이시아', '대구광역시 동구 봉무동 팔공로49길 51', 35.92078372990312, 128.6356898243599, 'test', '[ 대구 프리미엄 영화관 ] 전 좌석 리클라이너 설치, 프라이빗한 모션베드 단독룸 보유, 전관 레이저 영사기 대구 최초 도입! 생생하고 선명한 화질');
insert into theater values (null, '대구신세계(동대구)', '대구 동구 동부로 149 신세계백화점 8~9층 메가박스 대구신세계지점', 35.878055790480275, 128.62843124026253, 'test', '메가박스가 대구 지역 최초로 고화질 영상과 생생한 사운드를 선사하는 기술 특화관 MX관. 전 좌석 가죽시트와 JBL사운드에서 즐기는 일반관으로 총 6개의 상영관을 오픈합니다.');
insert into theater values (null, '북대구(칠곡)', ' 대구광역시 북구 동암로 100', 35.944270157017534, 128.56170906909924, 'test', '인구 25만의 자족신도시 대구 칠곡 최초의 멀티플렉스. 쇼핑, 영화, 외식까지 한 번에 즐기는 칠곡 문화의 중심');

-- 상영관
select cin_no, cin_row, cin_col, cin_seat, cin_type, cin_adultprice, cin_teenprice, cin_prefprice from cinema;

-- 상영정보
select shw_no, tht_no, cin_no, mov_no, shw_date, shw_starttime, shw_endtime from showinfo;

-- 좌석
select seat_no, res_no, shw_no, seat_rowno, seat_colno from seat;

-- 예매
select res_no, shw_no, mem_no, nom_no, res_price, res_usepoint, res_date, res_adult, res_teen, res_pref from reservation;

-- 쿠폰
select cou_no, cou_name, cou_detail, cou_dc, cou_expire from coupon;

-- 회원 보유 쿠폰
select mc_no, mem_no, cou_no, mc_getdate, mc_expdate from member_coupon;

-- 문의
select inq_no, inq_title, inq_user, inq_detail, inq_date, inq_file, inq_re_ref, inq_re_lev, inq_re_seq, inq_readcount from inquiry;