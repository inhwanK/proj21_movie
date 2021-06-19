package proj21_movie.service;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Member;

@Service
public interface MemberDetailService {
	Member showMemberByMemEmail(String memEmail);
}
