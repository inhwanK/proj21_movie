package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Member;
import proj21_movie.dto.Reservation;

@Service
public interface ReservationService {

	List<Reservation> getLists();
	List<Reservation> getReservationByUser(Member member);
	
	int registReservation(Reservation reservation);
	int removeReservation(Reservation reservation);
}
