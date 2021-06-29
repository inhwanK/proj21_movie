package proj21_movie.service;

import java.time.LocalDate;
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
import proj21_movie.mapper.MemberMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MemberServiceTest {
	protected static final Log log = LogFactory.getLog(MemberServiceTest.class);

	@Autowired
	private MemberMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01getLists() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Member> list = mapper.selectMemberByAll();
		Assert.assertNotNull(list);

		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test02getMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Member member = mapper.selectMemberByNo(1);
		Assert.assertNotNull(member);
		log.debug(member.toString());
	}

	@Test
	public void test03registerMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Member newMember = new Member("test4@test.com", "1234", LocalDate.of(2020, 7, 4), "테스트4", "01033430343");

		int res = mapper.insertMember(newMember);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);

		mapper.deleteMember(newMember.getMemEmail());
	}

	@Test
	public void test04modifyMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Member newMember = new Member("test4_2@test.com", "1234", LocalDate.of(2020, 6, 22), "테스트4_2", "01022313232");
		mapper.insertMember(newMember);

		newMember.setMemEmail("test4_2@test.com");
		newMember.setMemPasswd("1234");
		newMember.setMemBirthdate(LocalDate.of(2020, 6, 22));
		newMember.setMemName("테스트4_2");
		newMember.setMemPhone("010-2231-3232");

		int res = mapper.updateMember(newMember);
		Assert.assertEquals(1, res);
		log.debug("res > " + res);

		mapper.deleteMember(newMember.getMemEmail());
	}

	@Test
	public void test05removeMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Member newMember = new Member("test4_2@test.com", "1234", LocalDate.of(2020, 6, 22), "테스트4_2", "01022313232");

		mapper.insertMember(newMember);
		int res = mapper.deleteMember(newMember.getMemEmail());
		Assert.assertEquals(1, res);
		log.debug("res > " + res);
	}
	
}
