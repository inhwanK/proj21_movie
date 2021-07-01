package proj21_movie.controller;

import java.io.File;
import java.net.URI;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import proj21_movie.dto.Inquiry;
import proj21_movie.exception.DuplicateMovieException;
import proj21_movie.service.InquiryService;

@RestController
@RequestMapping("/api")
public class RestInquiryController {
	
	@Autowired
	private InquiryService service;
	
	@GetMapping("/inquirylist")
	public ResponseEntity<Object> getIquiryList(){
		List<Inquiry> listInquiry = service.getLists();
		return ResponseEntity.status(HttpStatus.OK).body(listInquiry); 
	}
	
	@GetMapping("/inquiryStatus")
	public ResponseEntity<Object> getInquiryListByAnsStatus(int inqStatus){
		List<Inquiry> listInquiry = service.getInquiryByAnsStatus(inqStatus);
		return ResponseEntity.status(HttpStatus.OK).body(listInquiry);
	}
	
	
	@GetMapping("/inquiry")
	public ResponseEntity<Object> getInquiry(int inqNo){
		Inquiry inquiry = service.getInquiryByNo(inqNo);
		return ResponseEntity.status(HttpStatus.OK).body(inquiry);
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
	
	@PatchMapping("/inquiry")
	public ResponseEntity<Object> answerInquiry(@RequestBody Inquiry inquiry){
		System.out.println(inquiry);
		return ResponseEntity.ok(service.answerInquiry(inquiry));
	}
	
	@DeleteMapping("/inquiry")
	public ResponseEntity<Object> deleteInauiry(int inqNo){
		return ResponseEntity.ok(service.removeInquiry(inqNo));
	}
	
	@PostMapping("/inquiryFileUpload") 
	public void uploadInquiryFile(MultipartFile uploadFile, HttpServletRequest request) {
		String upload = request.getSession().getServletContext().getRealPath("resources");
		String uploadFolder = upload + File.separator + "attachments" + File.separator + "inquiry";
		System.out.println(uploadFolder);
		
		
		// 중복처리 고민중.
		String uploadFileName = uploadFile.getOriginalFilename();
		System.out.println(uploadFile);

		System.out.println(uploadFileName);
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1); // 이거 왜있는지 모르겠음... 추후 삭제
		File saveFile = new File(uploadFolder, uploadFileName);
		System.out.println(uploadFileName);
		try {
			uploadFile.transferTo(saveFile);
		} catch (Exception e) {
			System.out.println("에러");
		}
		
	}
	
	

}
