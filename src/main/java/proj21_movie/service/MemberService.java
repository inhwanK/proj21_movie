package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Member;

@Service
public interface MemberService {
	List<Member> getLists();
	Member getMember(Member member);
	
	int registerMember(Member member);
	int modifyMember(Member member);
	int removeMember(Member member);

}
