package proj21_movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_movie.dto.Comment;
import proj21_movie.dto.Movie;
import proj21_movie.service.CommentService;

@Controller
@RequestMapping("/api")
public class RestCommentController {
	
	@Autowired
	private CommentService service;
	
	@GetMapping("/comments")
	public ResponseEntity<Object> comments () {
		System.out.println("cinemas()");
		return ResponseEntity.ok(service.getLists());
	}
	
	@GetMapping("/comments/user/{comUser}")	// json으로 받기는 아직 못 함..
	public ResponseEntity<Object> commentUser (@PathVariable String comUser, HttpServletResponse response) throws IOException {
		List<Comment> comment = service.getCommentByUser(comUser);
		if (comment == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.status(HttpStatus.OK).body(comment);
	}
	
	@GetMapping("/comments/movie/{movNo}")
	public ResponseEntity<Object> commentMovie(@PathVariable int movNo, HttpServletResponse response) {
		List<Comment> comment = service.getCommentByMovNo(new Movie(movNo));
		if (comment == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(comment);
	}
	
	@GetMapping("/comments/avgstar/{movNo}")	// json으로 받기는 아직 못함
	public ResponseEntity<Object> commentAvgStar(@PathVariable int movNo, HttpServletResponse response) {
		Comment comment = service.getCommentAvgStar(new Comment(movNo));
		if (comment == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(comment);
	}
}
