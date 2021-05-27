grant all 
   on proj21_movie.* 
   to 'user_proj21_movie'@'localhost' identified by 'rootroot';

-- file 권한(backup, load) -- root만 권한 부여 가능
GRANT File 
   ON *.* 
   TO 'user_proj21_movie'@'localhost';