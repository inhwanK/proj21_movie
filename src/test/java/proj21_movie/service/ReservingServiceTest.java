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
import proj21_movie.dto.Reserving;
import proj21_movie.mapper.ReservingMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ReservingServiceTest {
	protected static final Log log = LogFactory.getLog(ReservingServiceTest.class);
	
	@Autowired
	private ReservingMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	static int no = 0;
	
	@Test
	public void test03GetListByShowNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		List<Reserving> list = mapper.selectReservingByShowNo(1);
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test02GetReservingByIngNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Reserving reserving = mapper.selectReservingByIngNo(no);
		Assert.assertNotNull(reserving);
		
		log.debug(reserving.toString());
	}

	@Test
	public void test01RegistReserving() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Reserving reserving = new Reserving();
		reserving.setShwNo(1);
		reserving.setMemNo(1);
		reserving.setIngPrice(30000);
		reserving.setIngAdult(1);
		reserving.setIngTeen(1);
		reserving.setIngPref(1);
		reserving.setIngSeat("A3 A4 A5");
		
		int res = mapper.insertReserving(reserving);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);
		log.debug(reserving.toString());
		
		no = reserving.getIngNo();
	}

	@Test
	public void test04RemoveReserving() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		int res = mapper.deleteReserving(no);
		Assert.assertEquals(1, res);
	}

}
