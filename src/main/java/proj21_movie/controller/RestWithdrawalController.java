package proj21_movie.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj21_movie.dto.AuthInfo;
import proj21_movie.dto.Member;
import proj21_movie.dto.Withdrawal;
import proj21_movie.exception.WrongIdPasswordException;
import proj21_movie.service.MemberService;

@RestController
@RequestMapping("/api")
public class RestWithdrawalController {

	@Autowired
	private MemberService service;

//	@GetMapping
//	public String delete(@ModelAttribute("Withdrawal") Withdrawal wit) {
//		return "mypage/withdrawal";
//	}

//	@PostMapping
//	public String Delete(@ModelAttribute("Withdrawal") Withdrawal wit, Errors errors, HttpSession session,
//			HttpServletResponse response, RedirectAttributes redirectAttributes) throws Exception {
//
//		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
//		Member member = new Member();
//		member.setMemEmail(authInfo.getMemEmail());
//		member.setMemPasswd(wit.getMemPasswd());
//		Member newmember = service.checkIDPW(member, wit);
//
//		service.withdrawal(newmember);
		
//		return "redirect:/main";
//	}
}