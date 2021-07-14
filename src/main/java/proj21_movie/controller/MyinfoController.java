package proj21_movie.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj21_movie.dto.Member;
import proj21_movie.service.MemberService;

@Controller
public class MyinfoController {

	@Autowired
	private MemberService service;

	// 페이지 연결
	@RequestMapping("/myinfo")
	public String myinfo() {
		return "mypage/myinfo";
	}

	// 회원정보 수정 구현
	@RequestMapping(value = "updateinfo", method = RequestMethod.POST)
	public String updatemyinfo(@RequestParam("memEmail") String memEmail, HttpServletRequest request, HttpSession session) throws Exception{
	
		System.out.println("memEmail >> " + memEmail);
		
		Member member = service.getMember(memEmail);
		System.out.println(member);
		
		String passwd = request.getParameter("memPasswd");
		String name = request.getParameter("memName");
		String birthdate = request.getParameter("memBirthdate");
		String phone = request.getParameter("memPhone");
		
		LocalDate parseDate = LocalDate.parse(birthdate, DateTimeFormatter.ISO_DATE);
		
		member.setMemPasswd(passwd);
		member.setMemName(name);
		member.setMemBirthdate(parseDate);
		member.setMemPhone(phone);
		
//		Member selectMember = service.memberLogin(member);
//		
//		if (selectMember == null) {
//			System.out.println("일치하지 않음");
//			return "redirect:/myinfo";
//		} 
		
		service.updatemyinfo(member);
		session.setAttribute("member", member);
		
		return "redirect:/mypage";
	}

}
