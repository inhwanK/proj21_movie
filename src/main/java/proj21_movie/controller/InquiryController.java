package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InquiryController {

	@RequestMapping("/inquiry")
	public String inquiry() {
		return "inquiry/inquiryForm";
	}
	
	@RequestMapping("/inquirycheck")
	public String inquiryCheck() {
		return "inquiry/inquiryCheck";
	}
}
