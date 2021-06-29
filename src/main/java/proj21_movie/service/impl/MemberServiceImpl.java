package proj21_movie.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import proj21_movie.dto.Member;
import proj21_movie.mapper.MemberMapper;
import proj21_movie.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	static final Log log = LogFactory.getLog(MemberServiceImpl.class);

	@Autowired
	private MemberMapper mapper;

	@Override
	public List<Member> getLists() {
		List<Member> list = mapper.selectMemberByAll();
		log.debug("service - getLists() > " + list.size());
		return list;
	}

	@Override
	public Member getMember(String memEmail) {
		log.debug("service - getMember() > " + memEmail);
		return mapper.selectMemberByEmail(memEmail);
	}

	@Override
	public int registerMember(Member member) {
		log.debug("service - registerMember() > " + member);
		return mapper.insertMember(member);
	}

	@Override
	public int modifyMember(Member member) {
		log.debug("service - modifyMember() > " + member);
		return mapper.updateMember(member);
	}

	@Override
	public int removeMember(String memEmail) {
		log.debug("service - removeMember() > " + memEmail);
		return mapper.deleteMember(memEmail);
	}

	@Override
	public Member selectMemberBymemEmail(String memEmail) {
		log.debug("service - removeMember() > " + memEmail);
		return mapper.selectMemberByEmail(memEmail);
	}

	// 로그인
	@Override
	public Member memberLogin(Member member) throws Exception {
		log.debug("service - memberLogin() > " + member);
		return mapper.memberLogin(member);
	}

	// 아이디 중복체크
	@Override
	public boolean memberIdCheck(String memEmail) {
		boolean idCheck = false;
		System.out.println(memEmail);
		System.out.println("[memberService idCheck]" + mapper.selectIdCheck(memEmail));
		
		if (mapper.selectIdCheck(memEmail) == null) {
			idCheck = true;
		}
		return idCheck;
	}
	
	// 아이디 중복체크 바로 추가
	@Override
	public int addMail(Member member) {
		mapper.insertMember(member);
		mapper.insertUsedMemEmail(member);
		return mapper.insertMember(member);
	}

	// 아이디 중복체크
//	@Override
//	public int idOverlap(Member member) throws Exception {
//		int result = mapper.idOverlap(member);
//		return result;
//	}

}