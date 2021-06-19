package proj21_movie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.Member;
import proj21_movie.mapper.MemberMapper;
import proj21_movie.service.MemberDetailService;

@Service
public class MemberDetailServiceImpl implements MemberDetailService {
	
	@Autowired
	private MemberMapper membMapper;
	
	@Override
	public Member showMemberByMemEmail(String memEmail) {
		return membMapper.selectMemberByEmail(memEmail);
	}

}
