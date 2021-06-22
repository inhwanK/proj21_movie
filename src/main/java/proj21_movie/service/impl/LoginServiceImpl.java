package proj21_movie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import proj21_movie.dto.RegisterRequest;
import proj21_movie.mapper.LoginMapper;
import proj21_movie.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginMapper logmapper;

	@Override
	public RegisterRequest regireqt(String memEmail, String memPasswd) {
		return logmapper.login(memEmail, memPasswd);
	}

}