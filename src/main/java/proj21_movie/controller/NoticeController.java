package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	
	@RequestMapping("/notice")
	public String notice() {
		return "notice/notice";
	}
	
	@RequestMapping("/noticeDetail/{id}")
	public String noticeDetail(/* id 값 넣어주어야 함.*/) {
		// 받은 id 값으로 공지 글 검색.
		return "notice/noticeDetail";
	}
}
