package proj21_movie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.Member;
import proj21_movie.dto.RegisterRequest;
import proj21_movie.exception.DuplicateMemberException;
import proj21_movie.mapper.MemberMapper;
import proj21_movie.service.MemberRegisterService;

@Service
public class MemberRegisterServiceImpl implements MemberRegisterService {
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public String regist(RegisterRequest req) {
		Member member = memberMapper.selectMemberByEmail(req.getMemEmail());
		if (member != null) {
			throw new DuplicateMemberException("dup email" + req.getMemEmail());
		}
		Member newMember = new Member(req.getMemEmail(), req.getMemPasswd(), req.getMemBirthdate(), req.getMemName(), req.getMemPhone());
		memberMapper.insertMember(newMember);
		
		return newMember.getMemEmail();
	}

}
