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
	
	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}
	
	@GetMapping
	public String from(LoginCommand loginCommand, @CookieValue(value = "REMEMBER", required = false) Cookie rCookie) {
		if (rCookie != null) {
			loginCommand.setMemEmail(rCookie.getValue());
			loginCommand.setRememEmail(true);
		}

		return "/login";
	}

}
