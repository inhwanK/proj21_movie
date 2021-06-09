select user(), database();

desc theater;

desc showinfo;

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