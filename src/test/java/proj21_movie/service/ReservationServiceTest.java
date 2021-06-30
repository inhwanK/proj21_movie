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
import proj21_movie.dto.Member;
import proj21_movie.dto.Reservation;
import proj21_movie.dto.ShowInfo;
import proj21_movie.mapper.ReservationMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ReservationServiceTest {
	protected static final Log log = LogFactory.getLog(ReservationServiceTest.class);

	@Autowired
	private ReservationMapper mapper;
	
	static int no = 0;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01GetLists() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");	
		List<Reservation> list = mapper.selectReservationAll();
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test02GetReservationByUser() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Reservation> list = mapper.selectReservationByUser(new Member(1));
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test03RegistReservation() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Reservation reservation = new Reservation();
		reservation.setMemNo(new Member(2));
		reservation.setShwNo(new ShowInfo(2));
		reservation.setResAdult(1);
		reservation.setResTeen(1);
		reservation.setResPref(1);
		reservation.setResPrice(23000);
		
		int res = mapper.insertReservation(reservation);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);
		
		no = reservation.getResNo();
		System.out.println(no);
	}

	@Test
	public void test05RemoveReservation() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Reservation reservation = new Reservation();
		reservation.setResNo(no);
		
		int res = mapper.deleteReservation(reservation);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);
	}

	@Test
	public void test04GetReservationInfoByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Reservation reservation = mapper.selectReservationByNo(no);
		Assert.assertNotNull(reservation);
		log.debug(reservation.toString());
	}
}
