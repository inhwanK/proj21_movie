package proj21_movie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.Notice;
import proj21_movie.mapper.NoticeMapper;
import proj21_movie.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper mapper;
	
	
	@Override
	public List<Notice> showNoticeList() {
		return mapper.selectNoticeAll();
	}

	@Override
	public Notice showNoticeDetail(int notNo) {
		return mapper.selectNoticeByNo(notNo);
	}

	@Override
	public List<Notice> showNoticeListByPage(String notTitle, int selectPage) {
		int totalNumber = mapper.countNotice(notTitle);
		return mapper.selectNoticeByPage(selectPage, totalNumber);
	}
	@Override
	public List<Notice> showNoticeByTitle(String notTitle, int selectPage) {
		return mapper.selectNoticeByTitle(notTitle, selectPage);
	}

	@Override
	public int removeNotice(int notNo) {
		return mapper.deleteNotice(notNo);
	}

	@Override
	public int modifyNotice(Notice notice) {
		return mapper.updateNotice(notice);
	}

	@Override
	public int registNotice(Notice notice) {
		return mapper.insertNotice(notice);
	}

	@Override
	public int getNumberOfNotices(String notTitle) {
		return mapper.countNotice(notTitle);
	}

	
	
}
