package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.ReserveCommand;
import proj21_movie.dto.Reserving;

@Service
public interface ReservingService {
	List<Reserving> getListByShowNo(int no);
	Reserving getReservingByIngNo(int no);
	int registReserving(Reserving reserving);
	int removeReserving(int no);
	
	// 트랜잭션 -> 예매 insert, 좌석 insert, 예매진행중(임시테이블) delete
	int trReserving(ReserveCommand command);
}
