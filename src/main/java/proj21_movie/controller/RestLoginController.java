package proj21_movie.controller;

import java.net.URI;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import proj21_movie.dto.Member;
import proj21_movie.exception.DuplicateMemberException;
import proj21_movie.service.MemberService;

@Controller
@RequestMapping("/api")
public class RestLoginController {

	@Autowired
	private MemberService service;

	@GetMapping("/login/{memEmail}")
	public ResponseEntity<Object> member(@PathVariable String memEmail, HttpServletResponse response) {
		Member member = service.getMember(memEmail);
		if (member == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(member);
	}

	@GetMapping("/login")
	public ResponseEntity<Object> member(HttpServletResponse response) {
		List<Member> member = service.getLists();
		if (member == null) {
			return ResponseEntity.noContent().build();
		}

		return ResponseEntity.ok(member);
	}
	
	@PostMapping("/login")
	public ResponseEntity<Object> newMember(@RequestBody Member member, Errors errors) {
		if (errors.hasErrors()) {
			return ResponseEntity.badRequest().build();
		} try {
			service.registerMember(member);
			
			URI uri = URI.create("/api/login/" + member.getMemEmail());
			System.out.println("member.getMemEmail() > " + member.getMemEmail());
			return ResponseEntity.created(uri).body(member.getMemEmail());
		} catch (DuplicateMemberException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
	
	@PatchMapping()
	public ResponseEntity<Object> updateMember(@PathVariable String memEmail, @RequestBody Member member) {
		System.out.println("updateMember > " + member);
		return ResponseEntity.ok(service.modifyMember(member));
	}
	
	@DeleteMapping("/login/{memEmail}")
	public ResponseEntity<Object> deleteMember(@PathVariable String memEmail) {
		System.out.println("deleteMember > " + memEmail);
		return ResponseEntity.ok(service.removeMember(memEmail));
	}
}
