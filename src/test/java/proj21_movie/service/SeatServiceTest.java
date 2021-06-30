package proj21_movie.service;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_movie.config.ContextRoot;
import proj21_movie.dto.Reservation;
import proj21_movie.dto.Seat;
import proj21_movie.dto.ShowInfo;
import proj21_movie.mapper.SeatMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class SeatServiceTest {
	
	protected static final Log log = LogFactory.getLog(ShowInfoServiceTest.class);
	
	@Autowired SeatMapper mapper;
	
	static int no = 0;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01GetListByShowInfoNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
//		Seat seat = new Seat();
//		seat.setShwNo(new ShowInfo(1));
		List<Seat> list = mapper.selectSeatByShowInfoNo(1);
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test02RegistSeat() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Seat newSeat = new Seat();
		newSeat.setResNo(new Reservation(2));
		newSeat.setShwNo(new ShowInfo(2));
		newSeat.setSeatRowNo(3);
		newSeat.setSeatColNo(3);
		
		int res = mapper.insertSeat(newSeat);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);
		log.debug(newSeat.toString());
		
		no = newSeat.getSeatNo();
	}

	@Test
	public void test04RemoveSeat() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		int res = mapper.deleteSeat(no);
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test03GetListByResNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		List<Seat> list = mapper.selectSeatByResNo(2);
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

}
