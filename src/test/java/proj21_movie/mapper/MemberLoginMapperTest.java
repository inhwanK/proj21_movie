package proj21_movie.mapper;

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
public class MemberLoginMapperTest {
	
	@Autowired
	private LoginMapper mapper;

	@Test
    public void memberLogin() throws Exception{
        
        Member member = new Member();    // Member 변수 선언 및 초기화
        
        /* 올바른 아이디 비번 입력경우 */
        member.setMemEmail("test1@test.com");
        member.setMemPasswd("1234");
        
        mapper.LoginCommand(member);
        System.out.println("결과 값 : " + member);    
    }
 


}
