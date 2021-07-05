package proj21_movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj21_movie.dto.LoginCommand;
import proj21_movie.dto.Member;
import proj21_movie.service.MemberService;

@RestController
@RequestMapping("/api")
public class RestMyInfoController {
	
	@Autowired
	private MemberService memService;
	
	// 회원정보 수정 패스워드 체크
	@ResponseBody
	@RequestMapping(value="myinfo", method = RequestMethod.POST)
	public String passChk(Member member, LoginCommand loginCommand, HttpServletRequest request, 
			RedirectAttributes rttr) throws Exception {
		System.out.println("login 메서드 진입");
		System.out.println("전달된 데이터 : " + member);
		
		HttpSession session = request.getSession();
		int result = memService.passChk(member);

		if (result == 0) { // 일치하지 않는 비밀번호를 입력한 경우
			return "mypage/checkpassword";
		}   
		
		session.setAttribute("memPasswd", result);
		return "mypage/myinfo";
	}
	
	
	
	// (회원정보수정)페이지 전체수정
	@RequestMapping(value="/myinfo", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception{
		return "mypage/myinfo";
	}

	@RequestMapping(value="/updateMember", method = RequestMethod.POST) // 나중에 value 인포 액션값
	public String registerUpdate(Member member, HttpSession session) throws Exception{
		
		memService.modifyMember(member);
		session.invalidate();
		
		
		return "redirect:/login";
	}
}
