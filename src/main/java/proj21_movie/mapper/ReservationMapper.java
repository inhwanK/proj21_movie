package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Member;
import proj21_movie.dto.Reservation;

@Component
public interface ReservationMapper {

	List<Reservation> selectReservationAll();
	List<Reservation> selectReservationByUser(Member member);
	
	int insertReservation(Reservation reservation);
	int deleteReservation(Reservation reservation);
	
	// 예매번호로 정보 가져오기
	Reservation selectReservationByNo(int no);
}
