package proj21_movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Notice;
import proj21_movie.service.NoticeService;

@RestController
@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@GetMapping("/api/notice")
	public ResponseEntity<Object> noticeJ() {
		List<Notice> listNotice = service.showNoticeList();
		return ResponseEntity.status(HttpStatus.OK).body(listNotice); /* "notice/notice"; */
	}
	
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
