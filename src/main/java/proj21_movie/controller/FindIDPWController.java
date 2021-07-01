package proj21_movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import proj21_movie.dto.Member;
import proj21_movie.service.MemberService;

@Controller
public class FindIDPWController {

	@Autowired
	private MemberService service;
	
	// 찾기 메인
	@RequestMapping("/find_main")
	public String findmain() {
		return "login/find_main";
	}

	// 아이디 찾기 접속(성공)
	@RequestMapping("/find_ID")
	public String findid() {
		return "login/find_ID";
	}
	
	// 패스워드 찾기 접속(성공)
	@RequestMapping("/find_PW")
	public String findpw() {
		return "login/find_PW";
	}

	// 아이디 찾기 실행
	@RequestMapping(value = "find_id", method = RequestMethod.POST)
	public String findIdAction(Member member, Model model) {
		Member memb = service.findId(member);

		if (memb == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("memEmail", memb.getMemEmail());
		}
		return "login/find_ID";
	}

}
