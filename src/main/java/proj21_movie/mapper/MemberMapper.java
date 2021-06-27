package proj21_movie.mapper;

import java.util.List;
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
	
	//로그인
    public Member memberLogin(Member member);
    // 아이디 중복 검사
 	public int idCheck(String memEmail);

}
