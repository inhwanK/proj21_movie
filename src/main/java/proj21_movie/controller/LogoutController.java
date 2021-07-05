package proj21_movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogoutController {

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:/main";

	}
}
