package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InquiryController {

	@GetMapping("/inquiry")
	public String inquiry() {
		return "inquiry/inquiryForm";
	}
	
	@GetMapping("/inquirySuccess")
	public String inquiryCheck() {
		return "inquiry/inquirySuccess";
	}
	
	@GetMapping("/inquiryManager")
	public String inquiryManager() {
		return "manager/inquiryManager/inquiryManaging";
	}
	
	@GetMapping("/answerInquiry")
	public ModelAndView answerInquiry(int inqNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("inqNo", inqNo);
		mav.setViewName("manager/inquiryManager/answerInquiry");
		return mav;
	}
}
