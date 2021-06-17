package proj21_movie.mapper;

import java.util.List;

import proj21_movie.dto.Member;

public interface MemberMapper {
	List<Member> selectMemberByAll();
	Member selectMemberByNo(int memNo);
	Member selectMemberByEmail(String memEmail);
	
	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(String memEmail);
}
