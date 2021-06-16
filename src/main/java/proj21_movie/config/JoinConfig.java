package proj21_movie.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import proj21_movie.controller.JoinController;
import proj21_movie.service.MemberRegisterService;

@Configuration
public class JoinConfig {
	
	@Autowired
	private MemberRegisterService memverRegSvc;
	
	@Bean
	public JoinController joinController() {
		JoinController controller = new JoinController();
		controller.setMemberRegisterService(memverRegSvc);
		return controller;
	}

}
