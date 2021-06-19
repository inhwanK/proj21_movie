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
	
	Member selectMemberByEmail(String memEmail);
}
