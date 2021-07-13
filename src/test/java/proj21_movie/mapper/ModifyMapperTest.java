package proj21_movie.mapper;

import static org.junit.Assert.*;

import java.time.LocalDate;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
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
public class ModifyMapperTest {
	protected static final Log log = LogFactory.getLog(ModifyMapperTest.class);

	@Autowired
	private MemberMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void authorModifyTest() throws Exception {

		Member member = new Member();

		member.setMemEmail("test5@test.com");
		System.out.println("수정 전...................." + mapper.selectMemberByEmail(member.getMemEmail()));

		member.setMemName("테스트5");
		member.setMemBirthdate(LocalDate.of(2020, 7, 4));
		member.setMemPhone("010-1111-1111");

		mapper.updatemyinfo(member);
		System.out.println("수정 후...................." +  mapper.selectMemberByEmail(member.getMemEmail()));

	}
}
