package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
}
