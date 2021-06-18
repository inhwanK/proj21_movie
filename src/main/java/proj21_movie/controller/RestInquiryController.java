package proj21_movie.controller;

import java.io.File;
import java.net.URI;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@PostMapping("/inquiryFileUpload")
	public void uploadInquiryFile(MultipartFile[] uploadFile, HttpServletRequest request) {
		String upload = request.getSession().getServletContext().getRealPath("/").concat("resources");
		String uploadFolder = upload + File.separator + "images" + File.separator + "inquiry";
		
		System.out.println(uploadFolder);
		
		for(MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
			}catch(Exception e) {
				System.out.println("에러");
			}
		}
		
	}
}
