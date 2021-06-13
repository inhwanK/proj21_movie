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