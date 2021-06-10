package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Notice;

@Component
public interface NoticeMapper {
	
	Notice selectNoticeByNo(int notNo);
	List<Notice> selectNoticeByTitle(String notTitle);
	List<Notice> selectNoticeAll(); // 불필요할 것도 같음.
	List<Notice> selectNoticeByPage(int selectPage);
	
	int countNotice();
	
	int updateNotice(Notice notice);
	int insertNotice(Notice notice);
	int deleteNotice(int notNo);
	
}
