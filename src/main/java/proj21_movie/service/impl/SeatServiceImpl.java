package proj21_movie.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.Seat;
import proj21_movie.mapper.SeatMapper;
import proj21_movie.service.SeatService;

@Service
public class SeatServiceImpl implements SeatService {
	static final Log log= LogFactory.getLog(ReservationServiceImpl.class);
	
	@Autowired
	private SeatMapper mapper;

	@Override
	public List<Seat> getListByShowInfoNo(Seat seat) {
		List<Seat> list = mapper.selectSeatByShowInfoNo(seat);
		log.debug("service - getListByShowInfoNo() > " + list.size());
		return list;
	}

	@Override
	public int registSeat(Seat seat) {
		log.debug("service - registSeat() > " + seat);
		return mapper.insertSeat(seat);
	}

	@Override
	public int removeSeat(int no) {
		log.debug("service - removeSeat() > " + no);
		return mapper.deleteSeat(no);
	}

}
