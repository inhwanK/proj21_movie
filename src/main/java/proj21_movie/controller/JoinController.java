package proj21_movie.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sun.corba.se.spi.activation.Repository;

import proj21_movie.dto.Member;
import proj21_movie.dto.RegisterRequest;
import proj21_movie.exception.DuplicateMemberException;
import proj21_movie.mapper.MemberMapper;
import proj21_movie.service.MemberRegisterService;
import proj21_movie.service.MemberService;

@Controller
public class JoinController {

	//약관 접속하기 (작동)
	@RequestMapping("/join")
	public String join() {
		return "join/join";
	}
	
	//회원가입 접속하기 (작동)
	@RequestMapping("/joinform")
	public String joinform() {
		return "join/joinform";
	}
	
	//가입성공 접속하기 (작동)
	@RequestMapping("/joinsuccess")
	public String joinsuccess() {
		return "join/joinsuccess";
	}
	
	// 리다이렉트(작동)
	@GetMapping("/joinform")
	public String joinformGet() {
		return "redirect:/join";
	}

	//약관동의 (작동)
	@PostMapping("/joinform")
	public String joinCookie(HttpServletRequest request) {
		String agreeParam = request.getParameter("agree");
		if (agreeParam == null || !agreeParam.equals("true")) {
			return "join/join";
		}
		return "join/joinform";
	}

}