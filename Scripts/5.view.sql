-- 상영정보 view (상영정보, 극장, 상영관, 영화 join)
create or replace view vw_full_showinfo 
as 
select s.shw_no, s.shw_date, s.shw_starttime, s.shw_endtime, 
	t.tht_no, t.tht_name, 
	c.cin_no, c.cin_row, c.cin_col, c.cin_seat, c.cin_type, c.cin_adultprice, c.cin_teenprice, c.cin_prefprice,
	m.mov_no, m.mov_title 
from showinfo s join theater t on s.tht_no = t.tht_no 
	join cinema c on s.cin_no = c.cin_no  
	join movie m on s.mov_no = m.mov_no;

select * from vw_full_showinfo;
