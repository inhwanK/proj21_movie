package proj21_movie.service;

import java.util.List;
import org.springframework.stereotype.Service;
import proj21_movie.dto.Member;
import proj21_movie.mapper.MemberMapper;

@Service
public interface MemberService {

	Member getMember(String memEmail);

	List<Member> getLists();

	int registerMember(Member member);

	int modifyMember(Member member);

	int removeMember(String memEmail);

	Member selectMemberBymemEmail(String memEmail);

	// 로그인
	public Member memberLogin(Member member) throws Exception;

	// 아이디 중복체크
//	public int idOverlap(Member member) throws Exception;
	
	// 아이디 중복체크
	public boolean memberIdCheck(String memEmail);
	// 아이디 중복체크후 바로 등록
	public int addMail(Member member);

}