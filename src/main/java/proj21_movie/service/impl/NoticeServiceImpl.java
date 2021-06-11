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
	public List<Notice> showNoticeListByPage(int selectPage) {
		int totalNumber = mapper.countNotice();
		return mapper.selectNoticeByPage(selectPage, totalNumber);
	}
	@Override
	public List<Notice> showNoticeByTitle(String notTitle) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int removeNotice(int notNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int regidateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTotalNotice() {
		return mapper.countNotice();
	}

	
	
}
