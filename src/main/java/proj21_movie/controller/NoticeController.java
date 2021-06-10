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

//	@GetMapping("/noticelist")
//	public ModelAndView noticeList(@RequestParam(value = "selectPage") int selectPage) {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("totalNotice", service.getTotalNotice());
//		mav.addObject("selectPage", selectPage);
//
//		mav.setViewName("notice/noticeList");
//		return mav;
//	}
	
	@GetMapping("/noticelist") 
	public ModelAndView noticeList(@RequestParam(value = "selectPage") int selectPage) {
		// required = false 써서 파라미터 없으면 1 페이지에 알아서 매핑되도록 해야함.
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalNotice", service.getTotalNotice());
		mav.addObject("selectPage", selectPage);
		mav.setViewName("notice/noticeList");
		return mav;
	}
}
