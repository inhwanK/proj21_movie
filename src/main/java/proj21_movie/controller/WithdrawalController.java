package proj21_movie.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import proj21_movie.dto.Member;
import proj21_movie.service.MemberService;

@Controller
public class WithdrawalController {

	@Autowired
	private MemberService service;

	// 삭제페이지
	@RequestMapping("/withdrawal")
	public String withdrawal() {
		return "mypage/withdrawal";
	}

	// 삭제성공페이지
	@RequestMapping("/withdrawalsuccess")
	public String withdrawalsuccess() {
		return "mypage/withdrawalsuccess";
	}

	// 삭제구현(성공)
	@RequestMapping(value = "withdrawal.do", method = RequestMethod.POST)
	public String withdrawal_form(@ModelAttribute Member member, HttpSession session, HttpServletResponse response) throws Exception{
		if(service.withdrawal(member, response)) {
			session.invalidate();
		}
		
		return "redirect:/withdrawalsuccess";
	}

}