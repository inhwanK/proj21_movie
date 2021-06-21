package proj21_movie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.LoginCommand;
import proj21_movie.mapper.LoginMapper;
import proj21_movie.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper logmapper;

	@Override
	public LoginCommand loginCheck(String memEmail, String memPasswd) {
		return logmapper.loginCheck(memEmail, memPasswd);
	}


}
