package proj21_movie.service;

import java.time.LocalDate;
import java.time.LocalTime;
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
import proj21_movie.dto.Cinema;
import proj21_movie.dto.Movie;
import proj21_movie.dto.ShowInfo;
import proj21_movie.dto.Theater;
import proj21_movie.mapper.ShowInfoMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ShowInfoServiceTest {

	protected static final Log log = LogFactory.getLog(ShowInfoServiceTest.class);
	
	@Autowired
	private ShowInfoMapper mapper;
	
	static int no = 0;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01GetLists() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<ShowInfo> list = mapper.selectShowInfoAll();
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test02GetShowInfo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		ShowInfo selShowInfo = new ShowInfo(1);
		ShowInfo showInfo = mapper.selectShowInfoByNo(selShowInfo);
		
		Assert.assertNotNull(showInfo);
		
		log.debug(showInfo.toString());
	}

	@Test
	public void test03RegistShowInfo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		ShowInfo newShow = new ShowInfo();
		newShow.setThtNo(new Theater(1));
		newShow.setCinNo(new Cinema(1));
		newShow.setMovNo(new Movie(2));
		newShow.setShwDate(LocalDate.of(2021, 6, 10));
		newShow.setShwStarttime(LocalTime.of(20, 00));
//		newShow.setShwEndtime(LocalTime.of(22, 30));
		
		int res = mapper.insertShowInfo(newShow);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);
		log.debug(newShow.toString());
		
		no = newShow.getShwNo();
	}

	@Test
	public void test04ModifyShowInfo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		ShowInfo show = mapper.selectShowInfoByNo(new ShowInfo(no));
		show.setThtNo(new Theater(2));
		show.setCinNo(new Cinema(2));
		show.setMovNo(new Movie(3));
		show.setShwDate(LocalDate.of(2021, 7, 10));
		show.setShwStarttime(LocalTime.of(21, 00));
		show.setShwEndtime(LocalTime.of(23, 30));
		
		int res = mapper.updateShowInfo(show);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);
	}

	@Test
	public void test05RemoveShowInfo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		ShowInfo showInfo = mapper.selectShowInfoByNo(new ShowInfo(no));
		int res = mapper.deleteShowInfo(showInfo);
		Assert.assertEquals(1, res);
	}

}
