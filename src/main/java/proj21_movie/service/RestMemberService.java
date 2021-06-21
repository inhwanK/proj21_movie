package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Member;
import proj21_movie.dto.RegisterRequest;

@Service
public interface RestMemberService {
	List<Member> showMembers();
	Member showMemberById(Long memId);
	Long regist(RegisterRequest req);

}
