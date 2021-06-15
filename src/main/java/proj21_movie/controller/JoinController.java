package proj21_movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_movie.service.MemberService;

@Controller
public class JoinController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("/join")
	public String join() {
		return "join/join";
	}
}
