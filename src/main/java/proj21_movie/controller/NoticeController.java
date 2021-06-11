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
	public ModelAndView notice(@RequestParam(value = "notNo") int notNo) {
		ModelAndView mav = new ModelAndView("notice/noticeDetail", "notNo", notNo);
		return mav;
	}
	
	@GetMapping("/noticelist") 
	public ModelAndView noticeList(@RequestParam(required = false, defaultValue = "1") int selectPage) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalNotice", service.getTotalNotice()); // 페이지 개수 세기.
		mav.addObject("selectPage", selectPage); // 선택된 페이지 값.
		mav.setViewName("notice/noticeList");
		return mav;
	}
}
