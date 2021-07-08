package proj21_movie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Member;
import proj21_movie.service.MemberService;

@RestController
@RequestMapping("/api")
public class RestWithdrawalController {

	@Autowired
	private MemberService service;

	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public String deleteGET(HttpSession session) throws Exception {
		System.out.println("C: 회원정보 삭제 GET");
		// 세션제어
		String memEmail = (String) session.getAttribute("memEmail");
		if (memEmail == null) {
			return "redirect:/main";
		}
		return "mypage/withdrawal";
	}

	@RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
	public String deletePOST(Member member, HttpSession session) throws Exception {
		System.out.println("C: 회원정보 삭제 POST");
		// 1. 파라미터값 저장
		System.out.println("C: deleteForm전달정보 " + member);
		// 2. 전달받은 정보를 가지고 삭제 동작 처리이동
		// 3. service 객체 - 동작
		service.withdrawal(member);
		// 4. 세션초기화
		session.invalidate();
		// 5. 페이지 이동
		return "redirect:/main";
	}

}
