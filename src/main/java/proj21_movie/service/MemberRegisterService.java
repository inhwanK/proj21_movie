package proj21_movie.service;

import org.springframework.stereotype.Service;

import proj21_movie.dto.RegisterRequest;

@Service
public interface MemberRegisterService {
	String regist(RegisterRequest req);
}
