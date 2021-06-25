package proj21_movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Notice;
import proj21_movie.service.NoticeService;

@RestController
@RequestMapping("/api")
public class RestNoticeController {

	@Autowired
	private NoticeService service;

	@GetMapping("/notice") // 리스트 전체 빼오는 건데 . 곧 삭제 예정.
	public ResponseEntity<Object> getNoticeList() {
		List<Notice> listNotice = service.showNoticeList();
		return ResponseEntity.status(HttpStatus.OK).body(listNotice);
	}

	@GetMapping("/notice/{notNo}")
	public ResponseEntity<Object> getNoticeByNo(@PathVariable("notNo") int notNo) {
		Notice notice = service.showNoticeDetail(notNo);
		return ResponseEntity.status(HttpStatus.OK).body(notice);
	}


	@GetMapping("/noticesearch")
	public ResponseEntity<Object> getNoticeTitleByPage(
			@RequestParam(value = "selectPage", defaultValue = "1") int selectPage, 
			@RequestParam(value = "notTitle", defaultValue = "") String notTitle){
		
		List<Notice> listNotice = service.showNoticeByTitle(notTitle, selectPage);
		return ResponseEntity.status(HttpStatus.OK).body(listNotice);
	}



}
