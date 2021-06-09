package proj21_movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Notice;
import proj21_movie.service.NoticeService;

@RestController
public class NoticeRestController {

	@Autowired
	private NoticeService service;
	
	@GetMapping("/api/notice")
	public ResponseEntity<Object> notice() {
		List<Notice> listNotice = service.showNoticeList();
		return ResponseEntity.status(HttpStatus.OK).body(listNotice); /* "notice/notice"; */
	}
	
	@GetMapping("/api/notice/{notNo}")
	public ResponseEntity<Object> noticeNo(@PathVariable("notNo") int notNo) {
		Notice notice = service.showNoticeDetail(notNo);
		return ResponseEntity.status(HttpStatus.OK).body(notice); /* "notice/notice"; */
	}
	
}
