package proj21_movie.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import proj21_movie.dto.Member;

@Component
public interface MemberMapper {
	Member selectMemberByNo(int memNo);
	List<Member> selectMemberByAll();

	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(String memEmail);
	int countMember();

	Member selectMemberByEmail(String memEmail);

	// 로그인
	public Member memberLogin(Member member);
	// 아이디 중복 검사
	public int idCheck(String memEmail);
	// 아이디 찾기
	public Member findId(Member member);
	
	/* 비밀번호 찾기(비로그인) */
	// 회원조회
	public String selectMember(Member member);
	// 패스워드 변경
	public int pwUpdate_M(Member member);
	
	
	//////////////////////
	// 패스워드 체크
	public int passCheck(Member vo);
	// 탈퇴
	public void remove(Member member) throws Exception;
	
	// 회원수정
	public void update(Member member) throws Exception;
}
