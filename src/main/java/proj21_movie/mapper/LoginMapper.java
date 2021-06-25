package proj21_movie.mapper;

import org.springframework.stereotype.Component;
import proj21_movie.dto.Member;

@Component
public interface LoginMapper {
	//로그인
    public Member LoginCommand(Member member);
}