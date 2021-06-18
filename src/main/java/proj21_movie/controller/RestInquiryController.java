package proj21_movie.controller;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Inquiry;
import proj21_movie.exception.DuplicateMovieException;
import proj21_movie.service.InquiryService;

@RestController
@RequestMapping("/api")
public class RestInquiryController {
	
	@Autowired
	private InquiryService service;
	
	@GetMapping("/inquiry")
	public ResponseEntity<Object> getIquiryList(){
		List<Inquiry> listInquiry = service.getLists();
		return ResponseEntity.status(HttpStatus.OK).body(listInquiry); 
	}
	
	
	@PostMapping("/inquiry")
	public ResponseEntity<Object> newInquiry(@RequestBody Inquiry inquiry){
		System.out.println("newInquiry > " + inquiry);
		try {
			service.registInquiry(inquiry);
			URI uri = URI.create("/api/inquiry/" + inquiry.getInqNo());
			return ResponseEntity.created(uri).body(inquiry.getInqNo());
			
		} catch (DuplicateMovieException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}

	}
}
