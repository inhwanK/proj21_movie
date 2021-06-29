package proj21_movie.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_movie.dto.Member;
import proj21_movie.dto.Reservation;
import proj21_movie.dto.ReserveCommand;
import proj21_movie.dto.Reserving;
import proj21_movie.dto.Seat;
import proj21_movie.dto.ShowInfo;
import proj21_movie.mapper.ReservationMapper;
import proj21_movie.mapper.ReservingMapper;
import proj21_movie.mapper.SeatMapper;
import proj21_movie.service.ReservingService;

@Service
public class ReservingServiceImpl implements ReservingService {
	static final Log log= LogFactory.getLog(ReservingServiceImpl.class);

	@Autowired
	private ReservingMapper ingMapper;
	
	@Autowired
	private ReservationMapper resMapper;
	
	@Autowired
	private SeatMapper seatMapper;
	
	@Override
	public List<Reserving> getListByShowNo(int no) {
		List<Reserving> list = ingMapper.selectReservingByShowNo(no);
		log.debug("service - getListByShowNo() > " + list.size());
		return list;
	}

	@Override
	public Reserving getReservingByIngNo(int no) {
		log.debug("service - getReservingByIngNo() > " + no);
		return ingMapper.selectReservingByIngNo(no);
	}

	@Override
	public int registReserving(Reserving reserving) {
		log.debug("service - registReserving() > " + reserving);
		return ingMapper.insertReserving(reserving);
	}

	@Override
	public int removeReserving(int no) {
		log.debug("service - removeReserving() > " + no);
		return ingMapper.deleteReserving(no);
	}

	// 트랜잭션 -> 예매 insert, 좌석 insert, 예매진행중(임시테이블) delete
	@Override
	@Transactional
	public int trReserving(ReserveCommand command) {
		int memNo = command.getMemNo();
		int shwNo = command.getShwNo();
		int reservingNo = command.getReservingNo();
		int price = command.getPrice();
		int cntAdult = command.getCntAdult();
		int cntTeen = command.getCntTeen();
		int cntPref = command.getCntPref();
		List<Integer> row = command.getRow();
		List<Integer> col = command.getCol();
		
		// 예매 정보 등록
		Reservation reservation = new Reservation();
		reservation.setMemNo(new Member(memNo));
		reservation.setShwNo(new ShowInfo(shwNo));
		reservation.setResPrice(price);
		reservation.setResAdult(cntAdult);
		reservation.setResTeen(cntTeen);
		reservation.setResPref(cntPref);
		
		int res = resMapper.insertReservation(reservation);
		System.out.println("예매등록 >> " + reservation.getResNo());
		
		// 좌석 정보 등록
		Seat seat = new Seat();
		seat.setResNo(reservation);
		seat.setShwNo(new ShowInfo(shwNo));
		for (int i = 0; i < row.size(); i++) {
			seat.setSeatRowNo(row.get(i));
			seat.setSeatColNo(col.get(i));
			res += seatMapper.insertSeat(seat);
			System.out.println("row >> " + row.get(i) + ", col >> " + col.get(i));
		}
		System.out.println("좌석등록");
		
		// 임시테이블에서 데이터 삭제
		res += ingMapper.deleteReserving(reservingNo);
		System.out.println("임시테이블에서 데이터 삭제");
		
		return res;
	}

}
