package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Notice;

@Service
public interface NoticeService {
	
	List<Notice> showNoticeList();
	List<Notice> showNoticeListByPage(String notTitle, int selectPage); 
	List<Notice> showNoticeByTitle(String notTitle, int selectPage); 
	List<Notice> showNoticeRecent();
	List<Notice> showNoticeByDate(String notDate);
	
	Notice showNoticeDetail(int notNo);
	
	int getNumberOfNotices(String notTitle);
	
	int removeNotice(int notNo);
	int modifyNotice(Notice notice);
	int registNotice(Notice notice);
	
}
