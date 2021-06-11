package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage/mypage";
	}
}
