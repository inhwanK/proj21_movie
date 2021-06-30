package proj21_movie.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
	// 아이디 중복 검사
	public int idCheck(String memEmail) throws Exception;
	// 아이디 찾기
	public Member findId(Member member);
	// 비밀번호 찾기
//	public void find_pw(HttpServletResponse response, Member member) throws Exception;
}