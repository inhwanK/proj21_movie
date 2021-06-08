package proj21_movie.mapper;

import java.util.List;

import proj21_movie.dto.Member;

public interface MemberMapper {
	List<Member> selectMemberByAll();
	Member selectMemberByNo(Member member);
	
	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(Member member);

}
