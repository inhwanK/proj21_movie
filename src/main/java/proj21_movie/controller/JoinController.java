package proj21_movie.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_movie.dto.Member;
import proj21_movie.dto.RegisterRequest;
import proj21_movie.exception.DuplicateMemberException;
import proj21_movie.service.MemberRegisterService;

@Controller
public class JoinController {

	@Autowired
	private MemberRegisterService memRservice;

	
	//약관 접속하기 (작동)
	@RequestMapping("/join")
	public String join() {
		return "join/join";
	}
	
	//회원가입 접속하기 (작동)
	@RequestMapping("/joinform")
	public String joinform() {
		return "join/joinform";
	}
	
	//가입성공 접속하기 (작동)
	@RequestMapping("/joinsuccess")
	public String joinsuccess() {
		return "join/joinsuccess";
	}

	//약관동의 (작동)
	@PostMapping("/joinform")
	public String joinCookie(HttpServletRequest request) {
		String agreeParam = request.getParameter("agree");
		if (agreeParam == null || !agreeParam.equals("true")) {
			return "join/join";
		}
		return "join/joinform";
	}
	
	//회원가입 (테스트중)
	public void setMemberRegisterService(MemberRegisterService memberRegisterService) {
		this.memRservice = memberRegisterService;
	}
	
	@PostMapping("/joinsuccess")
	public String joinformwrite(RegisterRequest regReq) {
		try {
			memRservice.regist(regReq);
			return "/joinsuccess";
		} catch (DuplicateMemberException ex) {
			return "/joinform";
		}
	}

	
// 임시분리	
/*
	@PostMapping("/join/{memEmail}")
	public ResponseEntity<Object> member(@PathVariable String memEmail, HttpServletResponse response) {
		Member member = service.getMember(memEmail);
		if (member == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(member);
	}
	
	@GetMapping("/joinsuccess")
	public ResponseEntity<Object> member(HttpServletResponse response) {
		List<Member> member = service.getLists();
		if (member == null) {
			return ResponseEntity.noContent().build();
		}
		return ResponseEntity.ok(member);
	}
	
	@PatchMapping("/join/{memEmail}")
	public ResponseEntity<Object> updateMember(@PathVariable String memEmail, @RequestBody Member member) {
		System.out.println("updateMember > " + member);
		return ResponseEntity.ok(service.modifyMember(member));
	}
	
	@PostMapping("/join/")
	public ResponseEntity<Object> newMember(@RequestBody Member member, Errors errors) {
		if (errors.hasErrors()) {
			return ResponseEntity.badRequest().build();
		} try {
			service.registerMember(member);
			
			URI uri = URI.create("/api/join/" + member.getMemEmail());
			System.out.println("member.getMemEmail() > " + member.getMemEmail());
			return ResponseEntity.created(uri).body(member.getMemEmail());
		} catch (DuplicateMemberException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
	
	@DeleteMapping("/join/{memEmail}")
	public ResponseEntity<Object> deleteMember(@PathVariable String memEmail) {
		System.out.println("deleteMember > " + memEmail);
		return ResponseEntity.ok(service.removeMember(memEmail));
	}
*/
}