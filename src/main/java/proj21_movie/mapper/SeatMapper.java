package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Seat;

@Component
public interface SeatMapper {
	List<Seat> selectSeatByShowInfoNo(int showNo);
	Seat selectSeatBySeatNo(Seat seat);
	
	int insertSeat(Seat seat);
	int deleteSeat(int no);
}
