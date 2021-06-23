package proj21_movie.controller;

import java.io.File;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import proj21_movie.dto.AttachImage;
import proj21_movie.dto.Movie;
import proj21_movie.exception.DuplicateMovieException;
import proj21_movie.service.MovieService;

@RestController
@RequestMapping("/api")
public class RestMovieManagerController {

	@Autowired
	private MovieService service;
	
	@GetMapping("/movies")
	public ResponseEntity<Object> movies(){
		System.out.println("movies()");
		return ResponseEntity.ok(service.getLists());
	}
	
	@GetMapping("/movies/boxOffice")
	public ResponseEntity<Object> boxOffice(){
		return ResponseEntity.ok(service.getMovieBoxOffice());
	}
	
	@GetMapping("/movies/commingSoon")
	public ResponseEntity<Object> commingSoon(){
		return ResponseEntity.ok(service.getMovieCommingSoon());
	}
	
	@GetMapping("/movies/{no}")
	public ResponseEntity<Object> movie(@PathVariable int no, HttpServletResponse response) {
		Movie movie = service.getMovie(new Movie(no));
		if (movie == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(movie);
	}
	
	// 검색
	@GetMapping("/moviesearch")
	public ResponseEntity<Object> movieSearch(@RequestParam(value = "movTitle") String movTitle) {
		List<Movie> movieSearch = service.getMovieByTitle(movTitle);
		return ResponseEntity.status(HttpStatus.OK).body(movieSearch);
	}
	
	@PostMapping("/movies")
	public ResponseEntity<Object> newMovie(@RequestBody Movie movie) {
		System.out.println("newMovie > " + movie);
		try {
			service.registerMovie(movie);
			URI uri = URI.create("/api/movies/" + movie.getMovNo());
			return ResponseEntity.created(uri).body(movie.getMovNo());
			
		} catch (DuplicateMovieException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
	
	// 업로드 파일 처리
	@PostMapping(value="/uploadAjaxAction", produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImage>> uploadAjaxActionPOST(MultipartFile[] uploadFile, HttpServletRequest request) {
		String upload = request.getSession().getServletContext().getRealPath("/").concat("resources");
		String imgUploadPath = upload + File.separator + "images" + File.separator + "movie" + File.separator + "box-office";
		System.out.println(imgUploadPath);
		
		// 폴더 생성
		File uploadPath = new File(imgUploadPath);
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		List<AttachImage> list = new ArrayList<>();
		
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("================================");
			System.out.println("파일 이름 : " + multipartFile.getOriginalFilename());
			System.out.println("파일 타입 : " + multipartFile.getContentType());
			System.out.println("파일 크기 : " + multipartFile.getSize());
			
			// 이미지 정보 객체
//			AttachImage ai = new AttachImage();
			
			// 파일 이름
			String uploadFileName = multipartFile.getOriginalFilename();
//			ai.setFileName(uploadFileName);
//			
//			// uuid 적용 파일 이름
//			String uuid = UUID.randomUUID().toString();
//			ai.setUuid(uuid);
//			
//			uploadFileName = uuid + "_" + uploadFileName;
			
			// 파일 위치, 파일 이름은 합친 File 객체
			File saveFile = new File(uploadPath, uploadFileName);
			
			// 파일 저장
			try {
				multipartFile.transferTo(saveFile);
				
//				// 썸네일 생성
//				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
//				
//				BufferedImage bo_image = ImageIO.read(saveFile);
//				
//				// 썸네일 비율
//				double ratio = 3;
//				int width = (int) (bo_image.getWidth() / ratio);
//				int height = (int) (bo_image.getHeight() / ratio);
//				
//				
//				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
//				
//				Graphics2D graphic = bt_image.createGraphics();
//				
//				graphic.drawImage(bo_image, 0, 0, width, height, null);
//				
//				ImageIO.write(bt_image, "jpg", thumbnailFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
//			list.add(ai);
		} // end of for
		
		ResponseEntity<List<AttachImage>> result = new ResponseEntity<List<AttachImage>>(list, HttpStatus.OK);
		return result;
	}
	
	@PatchMapping("/movies/{no}")
	public ResponseEntity<Object> updateMovie(@PathVariable int no, @RequestBody Movie movie) {
		return ResponseEntity.ok(service.modifyMovie(movie));
	}
	
	@DeleteMapping("/movies/{no}")
	public ResponseEntity<Object> deleteMovie(@PathVariable int no) {
		return ResponseEntity.ok(service.removeMovie(new Movie(no)));
	}
}
