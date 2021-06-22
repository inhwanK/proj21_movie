package proj21_movie.service;

import org.springframework.stereotype.Service;

import proj21_movie.dto.RegisterRequest;

@Service
public interface LoginService {
	RegisterRequest regireqt(String memEmail, String memPasswd);
}