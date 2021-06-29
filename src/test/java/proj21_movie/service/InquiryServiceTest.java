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
import proj21_movie.dto.Inquiry;
import proj21_movie.mapper.InquiryMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class InquiryServiceTest {
	
	protected static final Log log = LogFactory.getLog(ShowInfoServiceTest.class);
	
	@Autowired
	private InquiryMapper mapper;
	
	static int no = 0;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01GetLists() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Inquiry> list = mapper.selectInquiryAll();
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test03GetInquiryByUser() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Inquiry> list = mapper.selectInquiryByUser("testuser");
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test02RegistInquiry() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Inquiry inquiry = new Inquiry();
		inquiry.setInqUser("testuser");
		inquiry.setInqTitle("문의제목");
		inquiry.setInqDetail("문의내용");
		inquiry.setInqFile("inq_test.txt");
		
		int res = mapper.insertInquiry(inquiry);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);
		
		no = inquiry.getInqNo();
		
	}

	@Test
	public void test04ModifyInquiry() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Inquiry inquiry = new Inquiry(no);
		inquiry.setInqAnswer("답변테스트");
		
		int res = mapper.updateInquiry(inquiry);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);
	}

	@Test
	public void test05RemoveInquiry() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		int res = mapper.deleteInquiry(no);
		Assert.assertEquals(1, res);
	}

}
