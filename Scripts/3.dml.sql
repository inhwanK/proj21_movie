select user(), database();

-- 관리자
select adm_no, adm_id, adm_passwd from admin;
insert into admin values (null, 'admin', password(1234));

-- 회원
select mem_no, mem_email, mem_passwd, mem_birthdate, mem_name, mem_phone from member;
insert into member values (null, 'test1@test.com', password(1234), '1990-06-01', '테스트1', '010-1234-1234');
insert into member values (null, 'test2@test.com', password(1234), '2005-06-01', '테스트2', '010-4321-4321');
insert into member values (null, 'test3@test.com', password(1234), '1999-06-01', '테스트3', '010-1342-4312');

-- 공지
select not_no, not_title, not_detail, not_date, not_file from notice;
insert into notice values (null, '공지테스트1', '공지테스트1내용', now(), null);
insert into notice values (null, '공지테스트2', '공지테스트2내용', now(), null);
insert into notice values (null, '공지테스트3', '공지테스트3내용', now(), 'test.txt');

-- 영화
select mov_no, mov_title, mov_grade, mov_genre, mov_runtime, mov_director, mov_actor, mov_detail, mov_opendate, mov_enddate, mov_avgstar, mov_poster from movie;
insert into movie values (null, '크루엘라', 12, '드라마, 범죄, 코미디', 133, '크레이그 질레스피', '엠마 스톤, 엠마 톰슨, 마크 스트롱, 폴 월터 하우저', '잘가, 에스텔라. 난 이제 크루엘라야!', '2021-05-26', '2021-07-26', 4.66, '크루엘라.jpg');
insert into movie values (null, '분노의 질주:더 얼티메이트', 12, '액션', 133, '저스틴 린', '빈 디젤, 존 시나, 성 강', '기다림은 끝났다! 전 세계가 기다려온 단 하나의 액션블록버스터!', '2021-04-26', '2021-05-30', 4.06, '분노의질주.jpg');
insert into movie values (null, '파이프라인', 15, '범죄', 108, '유하', '서인국, 이수혁, 음문석', '목표는 하나, 목적은 여섯! 화끈하게 뚫고, 완벽하게 빼돌려라!', '2021-04-25', '2021-06-25', 3.45, '파이프라인.jpg');
insert into movie values (null, '스파이럴', 18, '스릴러', 93, '대런 린 보우즈만', '크리스 록, 사무엘 L.잭슨, 마리솔 니콜스', '경찰서로 배달된 의문의 소포. 그리고 시작된 경찰 연쇄살인. 또 다른 살인이 시작되기 전 단서를 찾고 사건을 해결하라!', '2021-05-12', '2021-07-12', 2.75, '스파이럴.jpg');

-- 영화 사진
select mp_no, mov_no, mp_pic from movie_pic;
insert into movie_pic values (null, 1, 'test_pic1');
insert into movie_pic values (null, 1, 'test_pic2');
insert into movie_pic values (null, 2, 'test_pic3');
insert into movie_pic values (null, 3, 'test_pic4');
insert into movie_pic values (null, 4, 'test_pic5');

-- 한줄평
select mov_no, com_user, com_content, com_star, com_date from comment;
insert into comment values (1, 'test1@test.com', '재미있음', 4, now());
insert into comment values (2, 'test1@test.com', '그저그럼', 3, now());
insert into comment values (3, 'test1@test.com', '노잼', 2, now());

-- 극장
select tht_no, tht_name, tht_address, tht_lat, tht_long, tht_subs, tht_detail from theater;
insert into theater values (null, '대구이시아', '대구광역시 동구 봉무동 팔공로49길 51', 35.92078372990312, 128.6356898243599, 'test', '[ 대구 프리미엄 영화관 ] 전 좌석 리클라이너 설치, 프라이빗한 모션베드 단독룸 보유, 전관 레이저 영사기 대구 최초 도입! 생생하고 선명한 화질');
insert into theater values (null, '대구신세계(동대구)', '대구 동구 동부로 149 신세계백화점 8~9층 메가박스 대구신세계지점', 35.878055790480275, 128.62843124026253, 'test', '메가박스가 대구 지역 최초로 고화질 영상과 생생한 사운드를 선사하는 기술 특화관 MX관. 전 좌석 가죽시트와 JBL사운드에서 즐기는 일반관으로 총 6개의 상영관을 오픈합니다.');
insert into theater values (null, '북대구(칠곡)', ' 대구광역시 북구 동암로 100', 35.944270157017534, 128.56170906909924, 'test', '인구 25만의 자족신도시 대구 칠곡 최초의 멀티플렉스. 쇼핑, 영화, 외식까지 한 번에 즐기는 칠곡 문화의 중심');

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
select shw_no, tht_no, cin_no, mov_no, shw_date, shw_starttime, shw_endtime from showinfo;
insert into showinfo values (null, 1, 1, 1, '2021-06-01', '14:00:00', '16:13:00');
insert into showinfo values (null, 2, 2, 2, '2021-06-02', '14:00:00', '16:13:00');
insert into showinfo values (null, 3, 3, 3, '2021-06-03', '14:00:00', '16:13:00');
insert into showinfo values (null, 1, 2, 4, '2021-06-04', '14:00:00', '16:13:00');
-- 상영정보 입력시 시작시간 설정 후 해당 영화의 런타임을 가져와서 시작시간에 더하여 shw_endtime에 넣어줄 것 
-- delete from showinfo where shw_no = 1;
-- alter table showinfo auto_increment = 1;

-- 예매
select res_no, shw_no, mem_no, res_price, res_date, res_adult, res_teen, res_pref from reservation;
insert into reservation values (null, 1, 1, 10000, now(), 1, 0, 0);
insert into reservation values (null, 1, 2, 18000, now(), 1, 1, 0);

-- 좌석
select seat_no, res_no, shw_no, seat_rowno, seat_colno from seat;
insert into seat values (null, 1, 1, 5, 5);
insert into seat values (null, 2, 1, 1, 1);
insert into seat values (null, 2, 1, 1, 2);

-- 문의
select inq_no, inq_title, inq_user, inq_detail, inq_date, inq_file, inq_answer, inq_ansdate, inq_status from inquiry;
insert into inquiry values (null, '이게 안됨', 'testuser', '많이 안됨', now(), 'inquirytest1.txt', null, null, 0);
insert into inquiry values (null, '저게 안됨', 'testuser2', '더 많이 안됨', now(), 'inquirytest2.txt', '잘 해보세요', now(), 1);