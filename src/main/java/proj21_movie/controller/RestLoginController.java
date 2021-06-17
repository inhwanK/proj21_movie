package proj21_movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.LoginCommand;
import proj21_movie.service.MemberService;

@RestController
@RequestMapping("/api")
public class RestLoginController {

//	@Autowired
//	private MemberService service;

	//로그인 기능(구현중)	
//	public String loginform(@ModelAttribute("login") LoginCommand)
}