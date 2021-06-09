package proj21_movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Theater;
import proj21_movie.service.TheaterService;


@RestController
@RequestMapping("/api")
public class RestTheaterController {
	
	@Autowired
	private TheaterService service;
	
	@GetMapping("/theater")
	public ResponseEntity<Object> theaters () {
		List<Theater> theater = service.getLists();
		if (theater == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.status(HttpStatus.OK).body(theater);
	}
	
	@GetMapping("/theater/{thtNo}")
	public ResponseEntity<Object> theaterNo (@PathVariable int thtNo, HttpServletResponse response) throws IOException {
		Theater theater = service.getTheater(thtNo);
		if (theater == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.status(HttpStatus.OK).body(theater);
	}

}
