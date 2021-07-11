package proj21_movie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Member;
import proj21_movie.service.MemberService;

@RestController
@RequestMapping("/api")
public class RestMyInfoController {

	@Autowired
	private MemberService service;

	// 회원정보 수정 뷰
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {

		return "mypage/myinfo";

	}

	// 회원정보 수정 (수정 처리)
	@RequestMapping(value = "/myinfo", method = RequestMethod.POST)
	public String registerUpdate(Member member, HttpSession session) throws Exception {

		service.modifyMember(member);
		session.invalidate();

		return "redirect:/";

	}

}