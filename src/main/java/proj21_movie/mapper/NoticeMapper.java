package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Notice;

@Component
public interface NoticeMapper {
	
	Notice selectNoticeByNo(int notNo);
	Notice selectNoticeByTitle(String notTitle);
	List<Notice> selectNoticeAll();

	
	int updateNotice(Notice notice);
	int insertNotice(Notice notice);
	int deleteNotice(int notNo);
	
}
