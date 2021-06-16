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
import proj21_movie.config.ContextSqlSession;
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
		
//		Member selMember = new Member(1);
		String memEmail = "test1@test.com";
		Member member = mapper.selectMemberByEmail(memEmail);
		Assert.assertNotNull(member);

		log.debug(member.toString());
	}

	@Test
	public void test04insertMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Member newMember = new Member("test4@test.com", "1234", LocalDate.of(2020, 7, 4), "테스트4", "010-3343-0343");

		int res = mapper.insertMember(newMember);
		Assert.assertEquals(1, res);
		log.debug("res id >> " + res);
		
		mapper.deleteMember(newMember.getMemEmail());
	}

	@Test
	public void test05updateMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Member newMember = new Member("test4_2@test.com", "1234", LocalDate.of(2020, 6, 22), "테스트4_2", "010-2231-3232");
		mapper.insertMember(newMember);

		newMember.setMemPasswd("1122");
		int res = mapper.updateMember(newMember);
		Assert.assertEquals(1, res);

		mapper.deleteMember(newMember.getMemEmail());
	}

	@Test
	public void test06deleteMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Member newMember = new Member("test4_2@test.com", "1122", LocalDate.of(2020, 6, 22), "테스트4_2", "010-2231-3232");
		mapper.insertMember(newMember);

		int res = mapper.deleteMember(newMember.getMemEmail());
		Assert.assertEquals(1, res);
	}
	
}
