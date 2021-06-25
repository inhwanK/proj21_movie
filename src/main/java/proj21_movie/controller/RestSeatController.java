package proj21_movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.service.SeatService;

@RestController
@RequestMapping("/api")
public class RestSeatController {
	
	@Autowired
	private SeatService service;
	
	@GetMapping("/seat/{no}")
	public ResponseEntity<Object> seatList(@PathVariable int no){
		System.out.println("seatList()");
		return ResponseEntity.ok(service.getListByShowInfoNo(no));
	}

}
