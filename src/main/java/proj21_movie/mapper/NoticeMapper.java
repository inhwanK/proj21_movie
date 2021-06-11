package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Notice;

@Component
public interface NoticeMapper {
	
	Notice selectNoticeByNo(int notNo); // 기본키로 검색.
	
	List<Notice> selectNoticeByTitle(String notTitle); // 이름으로 검색. 검색 기능할 때 구현.
	
	List<Notice> selectNoticeAll(); // 공지 다 검색
	
	List<Notice> selectNoticeByPage(int selectPage); // 페이지마다 10개씩 검색. 
	
	int setAutoIncrement();
	
	int countNotice(); // 페이징을 위해 데이터 수 검색.
			
	int updateNotice(Notice notice);
	int insertNotice(Notice notice);
	
	int deleteNotice(int notNo);
	int deleteNoticeAuto();
	
}
