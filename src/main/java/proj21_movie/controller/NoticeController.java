package proj21_movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	
	@GetMapping("/notice")
	public ModelAndView notice(@RequestParam(value = "notNo") int notNo,  HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("notice/noticeDetail","notNo",notNo);
		return mav;
	}
}
