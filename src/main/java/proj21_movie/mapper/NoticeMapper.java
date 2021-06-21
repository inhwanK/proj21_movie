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
	
	// 페이지마다 10개씩 검색.
	// 파라미터가 여러개일 경우 @Param 으로 파라미터를 특정시켜줘야 하는 듯.  
	List<Notice> selectNoticeByPage(@Param("selectPage") int selectPage, @Param("totalNumber") int totalNumber);  
	
	// 이름으로 검색. 검색 기능할 때 구현.
	List<Notice> selectNoticeByTitle(String notTitle); 
	
	// 테스트 tearDown에 사용되는 auto_increment 초기화.
	int setAutoIncrement(); 
	
	// 페이징을 위해 데이터 수 검색.
	int countNotice(); 
	
	int updateNotice(Notice notice);
	int insertNotice(Notice notice);
	int deleteNotice(int notNo);
}
