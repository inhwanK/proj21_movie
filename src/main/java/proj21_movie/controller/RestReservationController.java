package proj21_movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Movie;
import proj21_movie.dto.Reservation;
import proj21_movie.service.ReservationService;

@RestController
@RequestMapping("/api")
public class RestReservationController {

	@Autowired
	private ReservationService service;
	
	@GetMapping("/reservation/{no}")
	public ResponseEntity<Object> getReservation(@PathVariable int no) {
		Reservation reservation = service.getReservationInfoByNo(no);
		if (reservation == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(reservation);
	}
	
	@GetMapping("/reservationByMember/{memNo}")
	public ResponseEntity<Object> getReservationByMember(@PathVariable int memNo) {
		return ResponseEntity.ok(service.getReservationListByMemNo(memNo));
	}
	
	@DeleteMapping("/reservation/{resNo}")
	public ResponseEntity<Object> deleteMovie(@PathVariable int resNo) {
		return ResponseEntity.ok(service.removeReservation(new Reservation(resNo)));
	}
}
