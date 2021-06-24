package proj21_movie.service;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Member;

@Service
public interface LoginService {
	//로그인
    public Member LoginCommand(Member member) throws Exception;
}