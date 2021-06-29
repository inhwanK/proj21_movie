package proj21_movie.controller;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.ReserveCommand;
import proj21_movie.dto.Reserving;
import proj21_movie.exception.DuplicateMovieException;
import proj21_movie.service.ReservingService;

@RestController
@RequestMapping("/api")
public class RestReservingController {

	@Autowired
	private ReservingService service;
	
	@PostMapping("/reserving")
	public ResponseEntity<Object> reserving(@RequestBody Reserving reserving) {
		try {
			service.registReserving(reserving);
			
			URI uri = URI.create("/api/reserving/" + reserving.getIngNo());
			return ResponseEntity.created(uri).body(reserving.getIngNo());
		} catch(DuplicateMovieException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
	
	@GetMapping("/reserving/{no}")
	public ResponseEntity<Object> getReserving(@PathVariable int no) {
		Reserving reserving = service.getReservingByIngNo(no);
		if (reserving == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(reserving);
	}
	
	@GetMapping("/reservingByShowNo/{no}")
	public ResponseEntity<Object> getReservingByShowNo(@PathVariable int no) {
		return ResponseEntity.ok(service.getListByShowNo(no));
	}
	
	@PostMapping("/trReserving")
	public ResponseEntity<Object> trReserving(@RequestBody ReserveCommand command) {
		System.out.println("확인 >> " + command);
		return ResponseEntity.ok(service.trReserving(command));
	}
	
	@DeleteMapping("delReserving/{no}")
	public ResponseEntity<Object> deleteReserving(@PathVariable int no) {
		return ResponseEntity.ok(service.removeReserving(no));
	}
	
}
