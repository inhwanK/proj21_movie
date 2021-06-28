package proj21_movie.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.Reserving;
import proj21_movie.mapper.ReservingMapper;
import proj21_movie.service.ReservingService;

@Service
public class ReservingServiceImpl implements ReservingService {
	static final Log log= LogFactory.getLog(ReservingServiceImpl.class);

	@Autowired
	private ReservingMapper mapper;
	
	@Override
	public List<Reserving> getListByShowNo(int no) {
		List<Reserving> list = mapper.selectReservingByShowNo(no);
		log.debug("service - getListByShowNo() > " + list.size());
		return list;
	}

	@Override
	public Reserving getReservingByIngNo(int no) {
		log.debug("service - getReservingByIngNo() > " + no);
		return mapper.selectReservingByIngNo(no);
	}

	@Override
	public int registReserving(Reserving reserving) {
		log.debug("service - registReserving() > " + reserving);
		return mapper.insertReserving(reserving);
	}

	@Override
	public int removeReserving(int no) {
		log.debug("service - removeReserving() > " + no);
		return mapper.deleteReserving(no);
	}

}
