package proj21_movie.mapper;

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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class MemberMapperTest {
	protected static final Log log = LogFactory.getLog(MemberMapperTest.class);

	@Autowired
	private MemberMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01selectMemberByAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Member> list = mapper.selectMemberByAll();

		Assert.assertNotNull(list);
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test02selectMemberByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Member member = mapper.selectMemberByNo(1);
		Assert.assertNotNull(member);
		log.debug(member.toString());
	}

	@Test
	public void test03selectMemberByEmail() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		String memEmail = "test1@test.com";

		Member member = mapper.selectMemberByEmail(memEmail);
		Assert.assertNotNull(member);

		log.debug(member.toString());
	}

	@Test
	public void test04insertMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Member newMember = new Member("test4@test.com", "1234", LocalDate.of(2020, 7, 4), "테스트4", "01033430343");

		int res = mapper.insertMember(newMember);
		Assert.assertEquals(1, res);
		log.debug("res memEmail >> " + res);

		mapper.deleteMember(newMember.getMemEmail());
	}

	@Test
	public void test05updateMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Member newMember = new Member("test4_2@test.com", "1234", LocalDate.of(2020, 6, 22), "테스트4_2", "01022313232");
		mapper.insertMember(newMember);

		newMember.setMemEmail("test4_2@test.com");
		newMember.setMemPasswd("1122");
		newMember.setMemBirthdate(LocalDate.of(2020, 6, 22));
		newMember.setMemName("테스트4_2");
		newMember.setMemPhone("010-2231-3232");
		int res = mapper.updateMember(newMember);
		Assert.assertEquals(1, res);

		mapper.deleteMember(newMember.getMemEmail());
	}

	@Test
	public void test06deleteMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Member newMember = new Member("test4_2@test.com", "1122", LocalDate.of(2020, 6, 22), "테스트4_2", "01022313232");
		mapper.insertMember(newMember);

		newMember.setMemEmail("test4_2@test.com");
		int res = mapper.deleteMember(newMember.getMemEmail());
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test07memberIdChk() throws Exception{
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		String id = "test1@test.com";	// 존재하는 아이디
		String id2 = "test123";	// 존재하지 않는 아이디
		mapper.idCheck(id);
		mapper.idCheck(id2);
	}
}
