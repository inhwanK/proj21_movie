select user(), database();




SELECT * 
FROM notice
order by not_no desc limit 10;

insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values ('공지테스트 10개이상', '공지테스트 10 개 이상 내용', now());

update notice 
set not_title = 'insertnotice 공지 수정' , not_detail = 'inserttest 글 세부내용 수정' , not_file = 'inserttest 글 파일 경로'
where not_no = 5;

-- 게시글 delete 할 때 auto_increment 값을 초기화해야 not_no 값이 정리가 됨.
-- auto_increment 초기화 하는 쿼리. 
alter table notice auto_increment = 1;

--  기본키 재정렬하는 쿼리.
set @count=0;
update notice set not_no = @count:=@count+1;


-- 쿼리 수정 필요.
SELECT not_no, not_title, not_date 
FROM notice
where not_no between (select count(*) from notice) - ((10 * 2)-1) and (select count(*) from notice) - (10 * 1);

select max(not_no) from notice;
select count(*) from notice;
select * from notice;