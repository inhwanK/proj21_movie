select user(), database();

desc theater;

-- 극장 
select tht_no, tht_name, tht_address, tht_lat, tht_long, tht_subs, tht_detail 
	from theater;

select tht_no, tht_name, tht_address, tht_lat, tht_long, tht_subs, tht_detail 
	from theater 
 where tht_no = 2;
		
insert into theater values (
			null, 
			'대구신세계(동대구)', 
			'대구 동구 동부로 149 신세계백화점 8~9층 메가박스 대구신세계지점', 
			35.877686, 
			128.6294, 
			'일반상영관', 
			'메가박스가 대구 지역 최초로 고화질 영상과 생생한 사운드를 선사하는 기술 특화관 MX관. 전 좌석 가죽시트와 JBL사운드에서 즐기는 일반관으로 총 6개의 상영관을 오픈합니다.'
);

insert into theater values (
			null,
			'대구이시아', 
			'대구광역시 동구 봉무동 팔공로49길 51', 
			35.92078372990312, 
			128.6356898243599, 
			'test', 
			'[ 대구 프리미엄 영화관 ] 전 좌석 리클라이너 설치, 프라이빗한 모션베드 단독룸 보유, 전관 레이저 영사기 대구 최초 도입! 생생하고 선명한 화질'
);

insert into theater values (
			null, 
			'북대구(칠곡)', 
			'대구광역시 북구 동암로 100', 
			35.944270157017534, 
			128.56170906909924, 
			'test', 
			'인구 25만의 자족신도시 대구 칠곡 최초의 멀티플렉스. 쇼핑, 영화, 외식까지 한 번에 즐기는 칠곡 문화의 중심'
);

-- 상영관 
select cin_no, cin_row, cin_col, cin_seat, cin_type, cin_adultprice, cin_teenprice, cin_prefprice 
	from cinema;

select cin_no, cin_row, cin_col, cin_seat, cin_type, cin_adultprice, cin_teenprice, cin_prefprice 
	from cinema
 where cin_no = 1;

insert into cinema values (null, 10, 10, cin_row * cin_col, '2D', 10000, 8000, 5000);
insert into cinema values (null, 8, 9, cin_row * cin_col, '3D', 15000, 13000, 10000);
insert into cinema values (null, 6, 8, cin_row * cin_col, '4D', 20000, 18000, 15000);
			
