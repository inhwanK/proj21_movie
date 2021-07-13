package proj21_movie.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Member;
import proj21_movie.service.MemberService;

@RestController
@RequestMapping("/api")
public class RestMyInfoController {

	@Autowired
	private MemberService service;

	// 비밀번호 업데이트(일단성공)
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String UpdateView() throws Exception {

		return "mypage/myinfo";
	}

	@RequestMapping(value = "/myinfo/info.set", method = RequestMethod.POST)
	public String Update(Member member, HttpSession session) throws Exception {

		service.update(member);
		session.invalidate();

		return "redirect:/";
	}

}