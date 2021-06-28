package proj21_movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_movie.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;

	@GetMapping("/notice")
	public ModelAndView notice(int notNo) { // @RequestParam 삭제함.
		ModelAndView mav = new ModelAndView("notice/noticeDetail", "notNo", notNo);
		return mav;
	}
	
	// 처음 공지사항 페이지를 여는 메서드. 이기 때문에
	// defaultValue 옵션이 필요함.
	@GetMapping("/noticelist") 
	public ModelAndView noticeList(
			@RequestParam(defaultValue = "1")  int selectPage, 
			@RequestParam(defaultValue = "")  String notTitle) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalNotice", service.getNumberOfNotices(notTitle)); // 페이지 개수 세기.
		mav.addObject("selectPage", selectPage); // 선택된 페이지 값.
		mav.addObject("notTitle", notTitle);
		mav.setViewName("notice/noticeList");
		return mav;
	}
	
	@GetMapping("/noticeManager")
	public String noticeManager() {
		return "manager/noticeManager/noticeManaging";
	}
	
	@GetMapping("/updateNotice")
	public ModelAndView updateNotice(int notNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notNo", notNo);
		mav.setViewName("manager/noticeManager/updateNotice");
		return mav;
	}
	
	
}
