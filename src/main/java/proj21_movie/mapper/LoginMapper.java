package proj21_movie.mapper;

import org.springframework.stereotype.Component;
import proj21_movie.dto.Member;
import proj21_movie.dto.RegisterRequest;

@Component
public interface LoginMapper {
	//로그인
    public Member LoginCommand(Member member);
    
    RegisterRequest logincheck(String memEmail, String memPasswd);

	public void logincheck(Member member);
}