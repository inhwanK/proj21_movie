select user(), database();

select mem_no, mem_email, mem_passwd, mem_birthdate, mem_name, mem_phone
  from member; 

insert into member values
(4, 'test4@test.com', password(1234), '2000-03-15', '테스트4', '010-3343-0343');

update `member` 
   set mem_email = 'test4_2@test.com', 
       mem_passwd = password(1234), 
       mem_birthdate = '2000-06-22',
       mem_name = '테스트4_2',
       mem_phone = '010-2231-3232'
 where mem_no = 4;

delete from `member` where mem_no = 5;

select mem_email, mem_passwd, count(*) 
  from member
 where mem_email and mem_passwd;

-- 회원 탈퇴
select mem_email, mem_passwd
  from `member`
 where mem_email = 'test4@test.com'
   and mem_passwd = password(1234);
  
select * from member;
					
delete 
  from member
 where mem_email = 'test5@test.com';

delete 
  from member
 where mem_email = 'test4@test.com'
   and mem_passwd = password(1234);

select mem_no, mem_email, password(mem_passwd), mem_birthdate, mem_name, mem_phone
  from member
 where mem_email = 'test4@test.com'
   and mem_passwd;

select mem_no, mem_email, password(mem_passwd), mem_birthdate, mem_name, mem_phone
  from member
 where mem_email = 'test4@test.com'; 

update `member` 
   set mem_passwd = password(1111), 
       mem_birthdate = '2000-06-22',
       mem_name = '테스트5',
       mem_phone = '010-2231-3232'
 where mem_email = 'test5@test.com';


update member
   set mem_birthdate = '2000-06-22',
       mem_name = '테스트5_2',
       mem_phone = '010-2231-3232'
 where mem_email = 'test5@test.com'
   and mem_passwd = password(1111);
 