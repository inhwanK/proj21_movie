package proj21_movie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.AuthInfo;
import proj21_movie.dto.Member;
import proj21_movie.exception.WrongIdPasswordException;
import proj21_movie.mapper.MemberMapper;
import proj21_movie.service.AuthService;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private MemberMapper memMapper;
	
	@Override
	public AuthInfo authenicate(String memEmail, String memPasswd) {
		Member member = memMapper.selectMemberByEmail(memEmail);
		if (member == null) {
			throw new WrongIdPasswordException();
		}
		
		if (!member.matchPassword(memPasswd)) {
			throw new WrongIdPasswordException();
		}
		return new AuthInfo(member.getMemEmail(), member.getMemName());
	}
	
}
