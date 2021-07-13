package proj21_movie.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import proj21_movie.dto.Member;
import proj21_movie.mapper.MemberMapper;
import proj21_movie.service.MemberService;

@RestController
@RequestMapping("/api")
public class RestWithdrawalController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private MemberMapper mapper;
	
	@RequestMapping(value = "withdrawalsuccess.do")
	public String secessionProc(Member member, HttpSession session) {
		session.setAttribute("member", member);
		
		service.removeMember(member.getMemEmail());
		session.invalidate();
		return "/main";
	}

	@RequestMapping(value = "withdrawal.do", method = RequestMethod.POST)
	@ResponseBody
	public String passCheck(Member vo) {
		int result = service.passCheck(vo);
		return Integer.toString(result);
	}

}