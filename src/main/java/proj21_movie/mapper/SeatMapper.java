package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Seat;

@Component
public interface SeatMapper {
	// 상영정보 번호로 에매된 좌석 받아오기
	List<Seat> selectSeatByShowInfoNo(int showNo);
	
	Seat selectSeatBySeatNo(Seat seat);
	
	int insertSeat(Seat seat);
	int deleteSeat(int no);
	
	// 예매번호로 좌석 받아오기
	List<Seat> selectSeatByResNo(int no);
}
