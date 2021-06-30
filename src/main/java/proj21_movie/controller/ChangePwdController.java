package proj21_movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_movie.service.MemberService;

@Controller
public class ChangePwdController {
	
	@Autowired
	private MemberService service;

	// 아이디 찾기 접속(성공)
	@RequestMapping("/find_PW")
	public String findPW() {
		return "login/find_PW";
	}

}
