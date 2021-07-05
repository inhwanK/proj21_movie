package proj21_movie.controller;

import java.net.URI;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Member;
import proj21_movie.exception.DuplicateMemberException;
import proj21_movie.service.MemberService;

@RestController
@RequestMapping("/api")
public class RestJoinController {
	private static final Logger logger = LoggerFactory.getLogger(RestJoinController.class);

	@Autowired
	private MemberService service;

	// get
	@GetMapping("/joinform/{memEmail}")
	public ResponseEntity<Object> member(@PathVariable String memEmail, HttpServletResponse response) {
		Member member = service.getMember(memEmail);
		if (member == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(member);
	}

	// list
	@GetMapping("/joinform")
	public ResponseEntity<Object> member(HttpServletResponse response) {
		List<Member> member = service.getLists();
		if (member == null) {
			return ResponseEntity.noContent().build();
		}
		return ResponseEntity.ok(member);
	}

	// Register
	@PostMapping("/joinform/")
	public ResponseEntity<Object> newMember(@RequestBody Member member, Errors errors) {
		if (errors.hasErrors()) {
			return ResponseEntity.badRequest().build();
		}
		try {
			service.registerMember(member);

			URI uri = URI.create("/api/joinform/" + member.getMemEmail());
			System.out.println("member.getMemEmail() > " + member.getMemEmail());
			return ResponseEntity.created(uri).body(member.getMemEmail());
		} catch (DuplicateMemberException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}

	// Modify
	@PatchMapping("/joinform/{memEmail}")
	public ResponseEntity<Object> updateMember(@PathVariable String memEmail, @RequestBody Member member) {
		System.out.println("updateMember > " + member);
		return ResponseEntity.ok(service.modifyMember(member));
	}

	// Delete
	@DeleteMapping("/joinform/{memEmail}")
	public ResponseEntity<Object> deleteMember(@PathVariable String memEmail) {
		System.out.println("deleteMember > " + memEmail);
		return ResponseEntity.ok(service.removeMember(memEmail));
	}
	
	// 아이디 중복체크
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChk(String memEmail) throws Exception {

		logger.info("memberIdChk() 진입");
		int result = service.idCheck(memEmail);
		logger.info("결과값 = " + result);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재

		} else {
			return "success"; // 중복 아이디 x
		}

	}
}