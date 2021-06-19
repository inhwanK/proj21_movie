package proj21_movie.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.LoginCommand;
import proj21_movie.dto.Member;
import proj21_movie.mapper.LoginMapper;
import proj21_movie.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper logmapper;
	
	@Autowired
	private Member memb;

	@Override
	public LoginCommand loginCheck(String memEmail, String memPasswd) {
		return logmapper.loginCheck(memEmail, memPasswd);
	}


}
