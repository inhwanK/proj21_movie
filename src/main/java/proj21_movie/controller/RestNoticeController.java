package proj21_movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Notice;
import proj21_movie.service.NoticeService;

@RestController
@RequestMapping("/api")
public class RestNoticeController {

	@Autowired
	private NoticeService service;
	
	@GetMapping("/notice")
	public ResponseEntity<Object> getNoticeList() {
		List<Notice> listNotice = service.showNoticeList();
		return ResponseEntity.status(HttpStatus.OK).body(listNotice); 
	}
	
	@GetMapping("/notice/{notNo}")
	public ResponseEntity<Object> getNoticeByNo(@PathVariable("notNo") int notNo) {
		Notice notice = service.showNoticeDetail(notNo);
		return ResponseEntity.status(HttpStatus.OK).body(notice);
	}
	
	@GetMapping("/noticelist/{selectPage}")
	public ResponseEntity<Object> getNoticeByPage(@PathVariable("selectPage") int selectPage) {
		List<Notice> listNotice = service.showNoticeListByPage(selectPage); // 범위 지정해야함.
		return ResponseEntity.status(HttpStatus.OK).body(listNotice);
	}
}
