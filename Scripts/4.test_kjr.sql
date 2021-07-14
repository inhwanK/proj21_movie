select user(), database();

-- 영화(movie) ------------------------------------------------------
select mov_no, mov_title, mov_grade, mov_genre, mov_runtime, mov_director, mov_actor, 
		mov_detail, mov_opendate, mov_enddate, mov_avgstar, mov_poster 
from movie;

alter table movie auto_increment = 5;

insert into movie values 
(0, 'test movie', 12, '액션', 120, '감독', '배우들', '상세설명', '2021-06-07', '2021-06-10', 3.5, 'poster.jpg');

delete from movie where mov_no > 4;

update movie 
set mov_title = 'test movie2', mov_grade = '15', mov_genre = '액션2'
where mov_no = 11;

-- 상영정보 -------------------------------------------------------------------------
select * from showinfo;
select s.shw_no, s.shw_date, s.shw_starttime, s.shw_endtime, 
	t.tht_no, t.tht_name, 
	c.cin_no, 
	m.mov_no, m.mov_title 
from showinfo s join theater t on s.tht_no = t.tht_no 
	join cinema c on s.cin_no = c.cin_no  
	join movie m on s.mov_no = m.mov_no;
	
select shw_no, shw_date, shw_starttime, shw_endtime, tht_no, tht_name, cin_no, mov_no, mov_title
from vw_full_showinfo;

select * from showinfo;

delete from showinfo where shw_no > 4;
alter table showinfo auto_increment = 5;


-- 문의 ---------------------------------------------------------------------------
select inq_no, inq_title, inq_user, inq_detail, inq_date, inq_file, inq_answer, inq_ansdate, inq_status from inquiry;



-- 한줄평 --------------------------------------------------------------------------
select com_no, mov_no, com_user, com_content, com_star, com_date from comment;

select c.com_no, m.mov_no, m.mov_title, c.com_user, c.com_content, c.com_star, c.com_date 
from comment c join movie m on c.mov_no = m.mov_no;

select c.com_no, m.mov_no, m.mov_title, c.com_user, c.com_content, c.com_star, c.com_date 
from comment c join movie m on c.mov_no = m.mov_no
where c.com_user = 'test1@test.com';

select * from comment;

insert into comment values 
(null, 4, 'test2@test.com', '감상평테스트', 3, now());

update comment 
	set mov_no = 5, com_user = 'test22@test.com', com_content = '감상평테스트2', com_star = 4, com_date = now()
	where com_no = 4;
	


-- 예매(reservation) -------------------------------------------------------------------
select res_no, shw_no, mem_no, res_price, res_date, res_adult, res_teen, res_pref from reservation;
select * from member;
select * from showinfo;
update showinfo set shw_no = 2 where shw_no = 28;


-- 상영정보에서 상영관의 기본요금 가져오기
select s.shw_no, c.cin_no, c.cin_type, c.cin_adultprice, c.cin_teenprice, c.cin_prefprice 
from showinfo s, cinema c 
where s.cin_no = c.cin_no;

select * from showinfo;
select mov_runtime from movie where mov_no = 2;
insert into showinfo 
values (null, 3, 3, 3, '2021-06-05', '10:00:00'
		, addtime('10:00:00', sec_to_time(130*60)));

-- starttime만 입력하면 해당 영화의 runtime을 찾은뒤 starttime에 더하여 endtime 입력
-- addtime(shw_starttime, sec_to_time(mov_runtime*60))
insert into showinfo 
values (null, 3, 3, 3, '2021-06-05', '10:00:00'
		, addtime('10:00:00', sec_to_time((select mov_runtime from movie where mov_no = 3) * 60)));


-- 상영 영화 날짜로 검색 ----------------------------------------------------------------------------
select * from showinfo;
select shw_no, shw_date, shw_starttime, shw_endtime, tht_no, tht_name, cin_no, cin_type, mov_no, mov_title
		from vw_full_showinfo
		where shw_date = '20210621';
select * from movie;
insert into showinfo(shw_no, tht_no, cin_no, mov_no, shw_date, shw_starttime, shw_endtime) 
values (null, 1, 1, 1, '2021-06-23', '14:00:00', 
addtime('14:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));

select shw_starttime 
from vw_full_showinfo 
where tht_no = 2 and mov_no = 2 and shw_date = '20210621'
order by shw_starttime;

select *
from vw_full_showinfo 
where tht_no = 1 and mov_no = 1 and shw_date = '20210622' and shw_starttime = '10:00';


-- 좌석 선택 페이지에서 필요한 것 --------------------------------------------------------------------
select * from member;
select * from showinfo;
select * from movie;
select * from theater;
select * from cinema;
select * from seat;
select * from reservation;

insert into reservation(res_no, shw_no, mem_no, res_price, res_date, res_adult, res_teen, res_pref) values 
(null, 42, 1, 20000, now(), 2, 0, 0);

insert into seat(seat_no, res_no, shw_no, seat_rowno, seat_colno) values 
(null, 7, 42, 1, 2);

-- 좌석 ---------------------------------------------------------------------------
select s.shw_no, s.shw_date, s.shw_starttime, s.shw_endtime, 
	t.tht_no, t.tht_name, 
	c.cin_no, c.cin_row, c.cin_col, c.cin_seat, c.cin_type, c.cin_adultprice, c.cin_teenprice, c.cin_prefprice,
	m.mov_no, m.mov_title,
	se.res_no, se.seat_rowno, se.seat_colno 
from showinfo s join theater t on s.tht_no = t.tht_no 
	join cinema c on s.cin_no = c.cin_no  
	join movie m on s.mov_no = m.mov_no
	join seat se on se.shw_no = s.shw_no ;

select seat_no, res_no, shw_no, seat_rowno, seat_colno 
from seat
where shw_no = 46;

select * from showinfo order by shw_no desc;
select * from vw_full_showinfo where shw_no = 7;
select * from reservation;
select * from seat;
select * from cinema;

select * from showinfo where shw_no = 46;

insert into reservation(res_no, shw_no, mem_no, res_price, res_date, res_adult, res_teen, res_pref) values 
(null, 12, 1, 20000, now(), 1, 0, 0);

insert into seat(seat_no, res_no, shw_no, seat_rowno, seat_colno) values 
(null, 7, 12, 5, 5);

select * from vw_full_showinfo;

select shw_no, shw_date, shw_starttime, shw_endtime, tht_no, tht_name, cin_no, cin_type, mov_no, mov_title
		from vw_full_showinfo
		where shw_date = '20210628'
			and mov_no = 1
			and tht_no = 1
			and shw_starttime > if ('20210628' > now(), 0, now())
		order by cin_no asc, shw_starttime asc;


-- 예매 진행중 -----------------------------------------------------------------------
select * from reserving;
select * from reservation;
select * from seat;
select * from showinfo;

select * from seat where shw_no = 22;
select * from reserving where shw_no = 22;
delete from reserving where ing_no = 8;


select r.res_no, r.mem_no, r.res_price, r.res_date, r.res_adult, r.res_teen, r.res_pref, 
		r.shw_no, s.shw_date, s.shw_starttime, s.shw_endtime, 
		s.tht_no, t.tht_name,
		s.mov_no, m.mov_title, 
		c.cin_no, c.cin_type 
from reservation r join showinfo s on r.shw_no = s.shw_no 
	join theater t on s.tht_no = t.tht_no 
	join movie m on s.mov_no = m.mov_no
	join cinema c on s.cin_no = c.cin_no 
where r.res_no = 28;

select * from seat where res_no = 28;

select * from movie;
select mov_no, mov_title, mov_grade, mov_genre, mov_runtime, mov_director, mov_actor, mov_detail, mov_opendate, mov_enddate, mov_avgstar, mov_poster from movie
where mov_enddate > date_add(now(), interval -1 day); 

select * from movie;

select * from showinfo;

select distinct shw_starttime
from vw_full_showinfo
where tht_no = 1 and cin_no = 1 and shw_date = '2021-07-02'
order by shw_starttime;

select * from reservation;

select * from showinfo;

insert into reservation values (null, 1, 1, 18000, now(), 1, 1, 0);
insert into reservation values (null, 1, 1, 23000, now(), 1, 1, 1);
insert into reservation values (null, 22, 1, 23000, now(), 1, 1, 1);


select r.res_no, r.mem_no, r.res_price, r.res_date, r.res_adult, r.res_teen, r.res_pref, 
				r.shw_no, s.shw_date, s.shw_starttime, s.shw_endtime, 
				s.tht_no, t.tht_name,
				s.mov_no, m.mov_title, m.mov_poster, 
				c.cin_no, c.cin_type 
		from reservation r join showinfo s on r.shw_no = s.shw_no 
			join theater t on s.tht_no = t.tht_no 
			join movie m on s.mov_no = m.mov_no
			join cinema c on s.cin_no = c.cin_no 
		where r.mem_no = 1
		order by r.res_no desc;

	
-- comment 유저명으로 찾기
select c.com_no, m.mov_no, m.mov_title, m.mov_poster, c.com_user, c.com_content, c.com_star, c.com_date 
from comment c join movie m on c.mov_no = m.mov_no 
where com_user = 'test1@test.com'
order by c.com_no desc;

select * from comment;

select * from movie;



-- 유저명으로 문의조회
select * 
from inquiry 
where inq_user = 'test1@test.com'
order by inq_no desc;


-- --------------------------------------------------------------------------------
select * from member;
select * from movie;
select * from reservation;
select * from showinfo;

-- 7월 7일. 크루엘라. 1번 극장
select shw_no, tht_no, cin_no, mov_no, shw_date, shw_starttime, shw_endtime from showinfo;
insert into showinfo values (null, 1, 1, 1, '2021-07-07', '10:00:00', 
addtime('10:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));

-- 7월 7일. 크루엘라. 2번 극장
select shw_no, tht_no, cin_no, mov_no, shw_date, shw_starttime, shw_endtime from showinfo;
insert into showinfo values (null, 2, 1, 1, '2021-07-07', '10:00:00', 
addtime('10:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));

-- 7월 7일. 크루엘라. 3번 극장
select shw_no, tht_no, cin_no, mov_no, shw_date, shw_starttime, shw_endtime from showinfo;
insert into showinfo values (null, 3, 1, 1, '2021-07-07', '10:00:00', 
addtime('10:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));

select * from movie;

delete from movie where mov_no > 0;

select shw_no, tht_no, cin_no, mov_no, shw_date, shw_starttime, shw_endtime from showinfo;
insert into showinfo values (null, 1, 3, 1, '2021-07-16', '10:00:00', 
addtime('10:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));
insert into showinfo values (null, 1, 3, 1, '2021-07-16', '14:00:00', 
addtime('14:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));
insert into showinfo values (null, 1, 3, 1, '2021-07-16', '20:00:00', 
addtime('20:00:00', sec_to_time((select mov_runtime from movie where mov_no = 1) * 60)));

select * from inquiry;

select * from member;