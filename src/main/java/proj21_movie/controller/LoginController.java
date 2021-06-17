package proj21_movie.controller;

import javax.servlet.http.Cookie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_movie.dto.LoginCommand;
import proj21_movie.service.AuthService;

@Controller
public class LoginController {

	@Autowired
	private AuthService authService;
	
	//로그인 화면 연결(성공)
	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}
	
	//아이디 저장(구현중)
	@GetMapping
	public String from(LoginCommand loginCommand, @CookieValue(value = "REMEMBER", required = false) Cookie rCookie) {
		if (rCookie != null) {
			loginCommand.setMemEmail(rCookie.getValue());
			loginCommand.setRememEmail(true);
		}
		return "login/login";
	}

}
