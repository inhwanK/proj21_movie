package proj21_movie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Member;
import proj21_movie.service.MemberService;

@RestController
@RequestMapping("/api")
public class RestWithdrawalController {

	@Autowired
	private MemberService service;

	// 회원탈퇴(로그인성공으로 넘어가고있음...)
	@RequestMapping(value = "login.do")
	public String secessionProc(Member member, HttpSession session) {
		service.secession(member, session);
		session.invalidate();
		
		return "redirect:/login";
	}

	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value = "passCheck.do", method = RequestMethod.POST)
	public String passCheck(Member member) {

		int result = service.passCheck(member);
		return Integer.toString(result);
	}

}
