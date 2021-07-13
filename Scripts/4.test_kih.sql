select user(), database();

SELECT * 
FROM notice
order by not_no desc limit 10;

insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values ('물의를 일으켜 죄송합니다.', '고개숙여 사과 드리지 않겠습니다.', now());

update notice 
set not_title = 'insertnotice 공지 수정' , not_detail = 'inserttest 글 세부내용 수정' , not_file = 'inserttest 글 파일 경로'
where not_no = 21;

-- 게시글 delete 할 때 auto_increment 값을 초기화해야 not_no 값이 정리가 됨.
-- auto_increment 초기화 하는 쿼리. 
alter table notice auto_increment = 1;

--  기본키 재정렬하는 쿼리.
set @count=0;
update notice set not_no = @count:=@count+1;


-- 쿼리 수정 필요.
select max(not_no) from notice;
select count(*) from notice;
select * from notice where not_no = 21;

SELECT * 
FROM notice
where not_no > (select count(*) from notice) - 20
order by not_no asc limit 10;

select count(*)
      from notice;
      
     
SELECT * 
      FROM notice
      where not_no between 1 and 20
      order by not_no desc;
      
     
select * from inquiry;

select * from notice;

delete 
from notice
where not_no = 23;

insert into notice(not_title,not_detail,not_date) values ('공지테스트 10개이상', '공지테스트 10 개 이상 내용', now());
-- 제목에 '공'이 들어가는 모든 공지사항 검색
select * 
from notice 
where not_title like concat('%','공','%')
order by not_no desc;


-- 검색기능 쿼리. 아직 적용안함.
@rownum:=@rownum+1 as a ;

SELECT @rownum:=@rownum+1 as a,not_no, not_title, not_date
FROM notice
where ((@rownum:=0)=0) and (not_title like concat('%','10','%'))
order by not_no desc;

select a.*
from
(SELECT @rownum:=@rownum+1 as a,not_no, not_title, not_date
FROM notice
where ((@rownum:=0)=0) and (not_title like concat('%','공','%'))
order by not_no desc) a
where a between 1 and 10;


set @rownum:=0;

-- 서브 쿼리 (@rownum:=0)=0 
select not_no ,not_title ,not_date, rownum
from 
(select not_no, not_title, not_date, @rownum:=@rownum+1 as rownum
from notice
where (@rownum:=0)=0 and not_title like concat('%','공','%')
order by not_no desc) as search
having rownum >= 21 and rownum <= 30;

-- 서브 쿼리 (@rownum:=0)=0 
select not_no ,not_title ,not_date ,rownum 
from 
(select not_no, not_title, not_date, @rownum:=@rownum+1 as rownum
from notice
where (@rownum:=0)=0 and not_title like concat('%','공','%')
order by not_no desc) as search
having rownum >= (#{selectPage}-1)*10 + 1 and rownum <= #{selectPage} * 10;


select not_no, not_title, not_date
from notice
where  not_title like concat('%','이상','%')
order by not_no desc;

select * from inquiry;
show tables;

select * from `member`;

select * from inquiry;

-- 특정 날짜 공지 모두 가지고 오기.
select not_no ,not_title ,not_date
from notice
where not_date like concat('2021-07-02%');

-- 최근 공지 20개만 가지고 오기.
select not_no ,not_title ,not_date
from notice
order by not_date desc
limit 5;

select *
from reservation;

select *
from member;

select *
from showinfo;

insert into reservation values(null, 3, 1, 60000,20210111,5,0,0);
insert into reservation values(null, 3, 1, 100000,20210709,5,0,0);

-- 실시간 총 매출.
select sum(res_price)
from reservation;

-- 매출 현황.

-- 최근 일주일 간 
select sum(res_price), res_date , curdate() 
from reservation
where res_date between DATE_ADD(curdate(),interval -1 WEEK ) AND curdate()
group by res_date; 

set @fromdate = curdate()-7;
set @todate = curdate();

 


select curdate() - INTERVAL (a.a) DAY as Date
    from (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6) as a;

select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6;

-- 최근 7일간 일일 매출.
select Date.date as 날짜, 매출
from (select curdate() - interval (last_week.week_interval) + 1 day as date
	from (select 0 as week_interval
		union all select 1 
		union all select 2 
		union all select 3 
		union all select 4 
		union all select 5 
		union all select 6) as last_week) as Date left join (select sum(res_price) as 매출, res_date from reservation group by res_date) as res 
		on res.res_date like concat(Date.date,'%')
order by 날짜 asc;
	
	select sum(res_price), res_date from reservation group by res_date;

select *
from (select 0 as week_interval
		union all select 1 
		union all select 2 
		union all select 3 
		union all select 4 
		union all select 5 
		union all select 6) last_week;

select Date.date as 날짜, 관람인원
from (select curdate() - interval (last_week.week_interval) + 1 day as date
	from (select 0 as week_interval
		union all select 1 
		union all select 2 
		union all select 3 
		union all select 4 
		union all select 5 
		union all select 6) as last_week) as Date left join (select res_adult + res_teen + res_pref as 관람인원,res_date from reservation group by res_date) as res 
		on res.res_date like concat(Date.date,'%')
order by 날짜 asc;
select res_adult + res_teen + res_pref as 관람인원 from reservation ;
select * from reservation;
select date(res_date) as date, sum(res_price)
  from reservation
 group by date;


-- 월별 통계
select res_date, sum(res_price) as 매출, sum(res_adult + res_teen + res_pref) as 관람인원
  from reservation
 group by month(res_date)
 order by res_date asc;

select Date.date as 날짜, 관람인원
from (select month(curdate()) - interval (last_month.month_interval) + 1 day as date
	from (select 0 as month_interval
		union all select 1 
		union all select 2 
		union all select 3 
		union all select 4 
		union all select 5 
		union all select 6) as last_month) as Date left join (select sum(res_price) as 매출,res_adult + res_teen + res_pref as 관람인원,res_date from reservation group by res_date) as res 
		on res.res_date like concat(Date.date,'%')
order by 날짜 asc;

select