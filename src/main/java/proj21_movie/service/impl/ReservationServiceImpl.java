package proj21_movie.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.Member;
import proj21_movie.dto.Reservation;
import proj21_movie.mapper.ReservationMapper;
import proj21_movie.service.ReservationService;

@Service
public class ReservationServiceImpl implements ReservationService {
	static final Log log= LogFactory.getLog(ReservationServiceImpl.class);
	
	@Autowired
	private ReservationMapper mapper;
	
	@Override
	public List<Reservation> getLists() {
		List<Reservation> list = mapper.selectReservationAll();
		log.debug("service - getLists() > " + list.size());
		return list;
	}

	@Override
	public List<Reservation> getReservationByUser(Member member) {
		List<Reservation> list = mapper.selectReservationByUser(member);
		log.debug("service - getReservationByUser() > " + list.size());
		return list;
	}

	@Override
	public int registReservation(Reservation reservation) {
		log.debug("service - registReservation() > " + reservation);
		return mapper.insertReservation(reservation);
	}

	@Override
	public int removeReservation(Reservation reservation) {
		log.debug("service - removeReservation() > " + reservation);
		return mapper.deleteReservation(reservation);
	}

	@Override
	public Reservation getReservationInfoByNo(int no) {
		log.debug("service - getReservationInfoByNo() > " + no);
		return mapper.selectReservationByNo(no);
	}

}
