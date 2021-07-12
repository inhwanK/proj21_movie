package proj21_movie.mapper;

import static org.junit.Assert.fail;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
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
import proj21_movie.dto.Statistics;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class StatisticsMapperTest {
	protected static final Log log = LogFactory.getLog(StatisticsMapperTest.class);
	
	@Autowired
	private StatisticsMapper mapper;

	@Test
	public void testSelectTotalSales() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectSalesByLatestDate() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Statistics> sales = mapper.selectSalesByLatestDate();
		System.out.println(sales);
		Assert.assertNotNull(sales);
	}

}
