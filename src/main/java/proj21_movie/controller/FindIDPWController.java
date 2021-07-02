package proj21_movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import proj21_movie.dto.Member;
import proj21_movie.service.MemberService;

@Controller
public class FindIDPWController {

	@Autowired
	private MemberService service;

	// 찾기 메인
	@RequestMapping("/find_main")
	public String findmain() {
		return "login/find_main";
	}

	// 아이디 찾기 접속(성공)
	@RequestMapping("/find_ID")
	public String findid() {
		return "login/find_ID";
	}

	// 패스워드 찾기 접속(성공)
	@RequestMapping("/find_PW")
	public String findpw() {
		return "login/find_PW";
	}

	// 아이디 찾기 실행
	@RequestMapping(value = "find_id", method = RequestMethod.POST)
	public String findIdAction(Member member, Model model) {
		Member memb = service.findId(member);

		if (memb == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("memEmail", memb.getMemEmail());
		}
		return "login/find_ID";
	}

	
	// 비밀번호 찾기 실행(비로그인) 작성중
//	// 비밀번호 찾기 처리 (1) 이메일 발송
//	@RequestMapping(value = "find_pass.do", method = RequestMethod.POST)
//	public ModelAndView find_pass(HttpServletRequest request, String user_id, String e_mail,
//			HttpServletResponse response_email) throws IOException {
//
//		// 랜덤한 난수 (인증번호)를 생성해서 이메일로 보내고 그 인증번호를 입력하면 비밀번호를 변경할 수 있는 페이지로 이동시킴
//
//		Random r = new Random();
//		int dice = r.nextInt(157211) + 48271;
//
//		String setfrom = "dlgkstjq623@gmail.com";
//		String tomail = request.getParameter("e_mail"); // 받는 사람의 이메일
//		String title = "비밀번호 찾기 인증 이메일 입니다."; // 제목
//		String content =
//
//				System.getProperty("line.separator") +
//
//						System.getProperty("line.separator") +
//
//						"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
//
//						+ System.getProperty("line.separator") +
//
//						System.getProperty("line.separator") +
//
//						"비밀번호 찾기 인증번호는 " + dice + " 입니다. "
//
//						+ System.getProperty("line.separator") +
//
//						System.getProperty("line.separator") +
//
//						"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
//
//		try {
//
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//
//			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
//			messageHelper.setTo(tomail); // 받는사람 이메일
//			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
//			messageHelper.setText(content); // 메일 내용
//
//			mailSender.send(message);
//
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//
//		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
//		mv.setViewName("/member/pass_email"); // 뷰의이름
//		mv.addObject("dice", dice);
//		mv.addObject("e_mail", e_mail);
//
//		System.out.println("mv : " + mv);
//
//		response_email.setContentType("text/html; charset=UTF-8");
//		PrintWriter out_email = response_email.getWriter();
//		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
//		out_email.flush();
//
//		return mv;
//
//	}
//
//	// 인증번호를 입력한 후에 확인 버튼을 누르면 자료가 넘어오는 컨트롤러
//	@RequestMapping(value = "pass_injeung.do{dice},{e_mail}", method = RequestMethod.POST)
//	public ModelAndView pass_injeung(String pass_injeung, @PathVariable String dice, @PathVariable String e_mail,
//			HttpServletResponse response_equals) throws IOException {
//
//		System.out.println("마지막 : pass_injeung : " + pass_injeung);
//
//		System.out.println("마지막 : dice : " + dice);
//
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("/member/pass_change");
//
//		mv.addObject("e_mail", e_mail);
//
//		if (pass_injeung.equals(dice)) {
//
//			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 비밀번호 변경창으로 이동시킨다
//
//			mv.setViewName("member/pass_change");
//
//			mv.addObject("e_mail", e_mail);
//
//			// 만약 인증번호가 같다면 이메일을 비밀번호 변경 페이지로 넘기고, 활용할 수 있도록 한다.
//
//			response_equals.setContentType("text/html; charset=UTF-8");
//			PrintWriter out_equals = response_equals.getWriter();
//			out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
//			out_equals.flush();
//
//			return mv;
//
//		} else if (pass_injeung != dice) {
//
//			ModelAndView mv2 = new ModelAndView();
//
//			mv2.setViewName("member/pass_email");
//
//			response_equals.setContentType("text/html; charset=UTF-8");
//			PrintWriter out_equals = response_equals.getWriter();
//			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
//			out_equals.flush();
//
//			return mv2;
//
//		}
//
//		return mv;
//
//	}
//
//	// 변경할 비밀번호를 입력한 후에 확인 버튼을 누르면 넘어오는 컨트롤러
//	@RequestMapping(value = "pass_change.do{e_mail}", method = RequestMethod.POST)
//	public ModelAndView pass_change(@PathVariable String e_mail, HttpServletRequest request, MemberDTO dto,
//			HttpServletResponse pass) throws Exception {
//
//		String member_pass = request.getParameter("member_pass");
//
//		String e_mail1 = e_mail;
//
//		dto.setE_mail(e_mail1);
//		dto.setMember_pass(member_pass);
//
//		// 값을 여러개 담아야 하므로 해쉬맵을 사용해서 값을 저장함
//
//		Map<String, Object> map = new HashMap<>();
//
//		map.put("e_mail", dto.getE_mail());
//		map.put("member_pass", dto.getMember_pass());
//
//		memberservice.pass_change(map, dto);
//
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("member/find_pass_result");
//
//		return mv;
//
//	}

}
