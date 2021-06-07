package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	
	@RequestMapping("/notice")
	public String notice() {
		return "notice/notice";
	}
}
