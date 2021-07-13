package proj21_movie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj21_movie.dto.Member;
import proj21_movie.service.MemberService;

@Controller
public class MyinfoController {

	@Autowired
	private MemberService service;

	// 페이지 연결
	@RequestMapping("/myinfo")
	public String myInfo() {
		return "mypage/myinfo";
	}

	// 회원정보 수정 구현
	@RequestMapping(value = "myinfo", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {

		return "mypage/myinfo";
	}

	@RequestMapping(value = "myinfo.do", method = RequestMethod.POST)
	public String registerUpdate(Member member, HttpSession session) throws Exception {

		service.updatemyinfo(member);
		session.invalidate();

		return "mypage/myinfo.do";
	}

}
