package proj21_movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj21_movie.dto.Member;
import proj21_movie.service.AuthService;
import proj21_movie.service.MemberService;

@Controller
public class LoginController {
	
	@Autowired
	private AuthService authService;

	@Autowired
	private MemberService memService;

	// 로그인 화면 연결(성공)
	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}

	// 임시 로그인성공 화면 연결(성공)
	@RequestMapping("/loginSuccess")
	public String loginSuccess() {
		return "login/loginSuccess";
	}

	// 임시 로그인실패(성공)
	@RequestMapping("/loginfail")
	public String loginfail() {
		return "login/loginfail";
	}

	// 로그인(성공)
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, Member member, RedirectAttributes rttr) throws Exception {

//        System.out.println("login 메서드 진입");
//        System.out.println("전달된 데이터 : " + member);

		HttpSession session = request.getSession();
		Member mem = memService.memberLogin(member);
		if (mem == null) { // 일치하지 않는 아이디, 비밀번호 입력 경우

			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/loginfail";
		}
		session.setAttribute("member", mem); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
		return "redirect:/loginSuccess";
	}

}