package proj21_movie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Member;
import proj21_movie.service.MemberService;

@RestController
@RequestMapping("/api")
public class RestMyInfoController {
	
	@Autowired
	private MemberService memService;
	
	// 페이지 전체수정
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
