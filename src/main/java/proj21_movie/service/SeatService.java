package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Seat;

@Service
public interface SeatService {
	List<Seat> getListByShowInfoNo(Seat seat);
	
	int registSeat(Seat seat);
	int removeSeat(int no);
	
}
