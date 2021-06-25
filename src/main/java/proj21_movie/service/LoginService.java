package proj21_movie.service;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Member;
import proj21_movie.dto.RegisterRequest;

@Service
public interface LoginService {
	//로그인
    public Member LoginCommand(Member member) throws Exception;
    
    RegisterRequest logincheck(String memEmail, String memPasswd);
}