package proj21_movie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import proj21_movie.dto.Notice;

@Component
public interface NoticeMapper {
	
	 // 기본키로 검색.
	Notice selectNoticeByNo(int notNo);	
	
	// 공지 다 검색
	List<Notice> selectNoticeAll(); 
	List<Notice> selectNoticeRecent();
	List<Notice> selectNoticeByDate(String notDate);
	
	/*
	 * 페이지마다 10개씩 검색. Mybatis는 기본적으로 파라미터를 하나만 받게 되어있음. 
	 * map을 사용해서 넣거나 param1,param2 ... 라는 이름으로 받아줘야함.
	 * @Param 으로 파라미터 이름을 특정시켜주면 간단하게 xml에서 그 이름 그대로 사용가능.
	 */
	List<Notice> selectNoticeByPage(@Param("selectPage") int selectPage, @Param("totalNumber") int totalNumber);  
	
	// 이름으로 검색.
	List<Notice> selectNoticeByTitle(@Param("notTitle") String notTitle, @Param("selectPage") int selectPage); 
	
	// 테스트 tearDown에 사용되는 auto_increment 초기화.
	int setAutoIncrement(); 
	
	// 페이징을 위해 데이터 수 검색.
	int countNotice(String notTitle); 
	
	int updateNotice(Notice notice);
	int insertNotice(Notice notice);
	int deleteNotice(int notNo);
}
