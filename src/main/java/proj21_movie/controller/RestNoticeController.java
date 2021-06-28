package proj21_movie.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import proj21_movie.dto.Notice;
import proj21_movie.service.NoticeService;

@RestController
@RequestMapping("/api")
public class RestNoticeController {

	@Autowired
	private NoticeService service;

	@GetMapping("/noticelist") // 리스트 전체 빼오기. 관리자 페이지에서 사용.
	public ResponseEntity<Object> getNoticeList() {
		List<Notice> listNotice = service.showNoticeList();
		return ResponseEntity.status(HttpStatus.OK).body(listNotice);
	}
	
	
	// noticeDetail, 관리자 수정에 사용됨.
	@GetMapping("/notice")
	public ResponseEntity<Object> getNoticeByNo(int notNo) {
		Notice notice = service.showNoticeDetail(notNo);
		return ResponseEntity.status(HttpStatus.OK).body(notice);
	}


	// noticeList.jsp 클라이언트에서 이미 변수명과 값이 맞춰져서 오기 때문에 
	// 정상적인 접근이라면 @RequestParam 은 굳이 필요햐지 않은 것으로 판단됨.
	// 단, api에 직접 접근한다면 필요한 사항임.
	@GetMapping("/noticesearch")
	public ResponseEntity<Object> getNoticeTitleByPage(
			@RequestParam(defaultValue = "1")  int selectPage, 
			@RequestParam(defaultValue = "") String notTitle){
		
		List<Notice> listNotice = service.showNoticeByTitle(notTitle, selectPage);
		return ResponseEntity.status(HttpStatus.OK).body(listNotice);
	}
	
	@PatchMapping("/notice")
	public ResponseEntity<Object> patchNotice(@RequestBody Notice notice){
		System.out.println(notice);
		
		return ResponseEntity.ok(service.modifyNotice(notice));
	}
}
