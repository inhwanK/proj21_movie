package proj21_movie.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class Sample {
	@PostMapping("/api/uploadAjaxAction22323123")
	public void uploadAjaxAction(MultipartFile[] uploadFile, HttpServletRequest request) {
		
		String upload = request.getSession().getServletContext().getRealPath("/").concat("resources");
		String uploadFolder = upload + File.separator + "images" + File.separator + "movie" + File.separator + "box-office";
		
//		String uploadFolder = "C:\\upload";
		
		for (MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.getMessage();
			}
		}
	}
}
