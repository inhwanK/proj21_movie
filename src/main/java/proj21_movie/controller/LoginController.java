package proj21_movie.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import proj21_movie.dto.AuthInfo;
import proj21_movie.dto.LoginCommand;
import proj21_movie.dto.Member;
import proj21_movie.dto.RegisterRequest;
import proj21_movie.exception.WrongIdPasswordException;
import proj21_movie.mapper.LoginMapper;
import proj21_movie.mapper.MemberMapper;
import proj21_movie.service.AuthService;
import proj21_movie.service.LoginService;
import proj21_movie.service.impl.AuthServiceImpl;
import proj21_movie.validator.LoginCommandValidator;

@Controller
public class LoginController {
	@Autowired
	private AuthService authService;

	@Autowired
	private LoginService logService;

	@Autowired
	private MemberMapper memMapper;

	@Autowired
	private LoginMapper logMapper;

	// 로그인 화면 연결(성공)
	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}

	// 임시 로그인성공 화면 연결(성공)
	@RequestMapping("/loginSuccess")
	public String loginSuccess() {
		return "login/loginSuccess";
	}

	// 임시 로그인실패(성공)
	@RequestMapping("/loginfail")
	public String loginfail() {
		return "login/loginfail";
	}

	@GetMapping("/login")
	public String form(LoginCommand loginCommand, @CookieValue(value = "REMEMBER", required = false) Cookie rCookie) {
		if (rCookie != null) {
			loginCommand.setMemEmail(rCookie.getValue());
			loginCommand.setRememEmail(true);
		}

		return "login/login";
	}


//	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	@ResponseBody 
	@PostMapping("/login")
	public String submit(LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletResponse response) {

		new LoginCommandValidator().validate(loginCommand, errors);
		if (errors.hasErrors())
			return "login/login";
		
		try {
			AuthInfo authInfo = authService.authenicate(loginCommand.getMemEmail(), loginCommand.getMemPasswd());
			session.setAttribute("authInfo", authInfo);

			// 이메일 기억하기 쿠키 적용
			Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getMemEmail());
			rememberCookie.setPath("/");
			if (loginCommand.isRememEmail()) {
				rememberCookie.setMaxAge(60 * 60 * 24 * 7);// 초 * 분 * 시 * 일 7일 유효기간
			} else {
				rememberCookie.setMaxAge(0); // 쿠키 삭제
			}
			response.addCookie(rememberCookie);

			return "login/loginSuccess";
		} catch (WrongIdPasswordException ex) {
			errors.reject("idPasswordNotMatching");
			return "login/loginfail";
		}
	}

}