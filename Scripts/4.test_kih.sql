select user(), database();




SELECT * FROM notice;

insert into notice(not_title,not_detail,not_date) values('테스트 공지','테스트 공지 내용',now());
insert into notice(not_title,not_detail,not_date) values ('공지테스트3', '공지테스트3내용', now());