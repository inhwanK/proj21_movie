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
import proj21_movie.dto.Theater;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TheaterServiceTest {
	protected static final Log log = LogFactory.getLog(TheaterServiceTest.class);

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
	
	@Autowired
	private TheaterService service;

	@Test
	public void test01GetLists() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		List<Theater> list = service.getLists();
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test02GetTheater() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Theater theater = service.getTheater(2);
		Assert.assertNotNull(theater);
		
		log.debug(theater.toString());
	}
	
	@Test
	public void test03GetTheaterName() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Theater theater = service.getTheaterName("대구신세계%");
		Assert.assertNotNull(theater);
		
		log.debug(theater.toString());
	}
	
	
}
