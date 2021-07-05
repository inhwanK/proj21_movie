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
import proj21_movie.dto.Admin;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class AdminLoginMapperTest {
	
	@Autowired
	private AdminMapper admapper;

	@Test
	public void AdminLogin() throws Exception{
		Admin admin = new Admin();
		
		// 올바른 아이디 비번 입력경우
		admin.setAdmId("admin");
		admin.setAdmPasswd("1234");
        
        // 틀린 비번 입력경우
//        member.setMemEmail("test13@test.com");
//        member.setMemPasswd("12345");
        
        admapper.getAdmin(admin);
        System.out.println("결과 값 : " + admapper.getAdmin(admin));    
	}
}
