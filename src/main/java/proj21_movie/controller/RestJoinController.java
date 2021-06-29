package proj21_movie.controller;

import java.net.URI;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	// 아이디 중복검사
	@GetMapping("/memberIdCheck")
	public String memberIdCheck() {
		System.out.println("[MemberController GET memberIdCheck]");
		return "/memberIdCheck";
	}
	
	@PostMapping("/memberIdCheck")
	public String memberIdCheck2(Model model,
			@RequestParam(value = "memEmail", required = true) String memEmail) {
		System.out.println("[MemberController POST memEmail]");
		System.out.println("[MemberController POST memEmail] memEmail" + memEmail);
		
		boolean idCheck = service.memberIdCheck(memEmail);
		System.out.println("[MemberController POST memberIdCheck] boolean idCheck" + idCheck);
		String alert = null;
		String path = "redirect:/joinform?memEmail=" + memEmail;
		
		if (idCheck == true) {
			System.out.println("사용가능한 메일입니다.");
		} else {
			System.out.println("이미 사용중인 메일입니다.");
			alert = "이미 사용중인 메일입니다.";
			path = "/memberIdCheck";
		}
		model.addAttribute("alert", alert);
			return path;
	}
	
	// 중복검사 후 바로 아이디 받아오기
	@GetMapping("/joinsuccess")
	public String addMail(Model model,
			@RequestParam(value = "memEmail", required = true) String memEmail) {
		System.out.println("[MemberController GET addMail]");
		model.addAttribute("memEmail", memEmail);
		return "/joinsuccess";
	}
	
	@PostMapping("/joinsuccess")
	public String addMail2(Member member) {
		System.out.println("[MemberController POST addMail]");
		service.addMail(member);
		return "redirect:/main";
		
	}
	
	
	
	
	
	///////////////////////////////////////////////////////
//	@ResponseBody
//	@RequestMapping(value = "idOverlap", method = RequestMethod.POST)
//	public int idOverlap(Member member) throws Exception {
//		int result = service.idOverlap(member);
//		return result;
//	}
//
//	@RequestMapping(value = "joinform", method = RequestMethod.POST)
//	public String registerPOST(Member member, RedirectAttributes ra) throws Exception {
//		logger.info("registerPOST");
//
//		int result = service.idOverlap(member);
//
//		System.out.println("중복은 1 아니면 0 = " + result);
//		if (result == 1) {
//			ra.addFlashAttribute("result", "registerFalse");
//			return "join/joinform";
//			
//		} else if (result == 0) {
//			service.registerMember(member);
//			ra.addFlashAttribute("result", "registerOK");
//		}
//
//		return "redirect:/";
//	}
}
