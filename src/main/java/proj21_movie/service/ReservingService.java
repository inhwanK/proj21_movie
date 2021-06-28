package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Reserving;

@Service
public interface ReservingService {
	List<Reserving> getListByShowNo(int no);
	Reserving getReservingByIngNo(int no);
	int registReserving(Reserving reserving);
	int removeReserving(int no);
}
