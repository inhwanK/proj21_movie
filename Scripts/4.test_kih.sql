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
insert into