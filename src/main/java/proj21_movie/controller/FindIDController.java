package proj21_movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import proj21_movie.dto.Member;
import proj21_movie.service.MemberService;

@Controller
public class FindIDController {

	@Autowired
	private MemberService service;

	// 아이디 패스워드 찾기 접속(성공)
	@RequestMapping("/find_IDPW")
	public String findid() {
		return "login/find_IDPW";
	}

	// 아이디 찾기 실행
	@RequestMapping(value = "find_ID", method = RequestMethod.POST)
	public String findIdAction(Member member, Model model) {
		Member memb = service.findId(member);

		if (memb == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("memEmail", memb.getMemEmail());
		}
		return "login/find_IDPW";
	}

}
