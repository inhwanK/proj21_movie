package proj21_movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_movie.dto.Member;
import proj21_movie.exception.MemberNotFoundException;
import proj21_movie.mapper.MemberMapper;

@Service
public class ChangePasswordService {
	
	@Autowired
	private MemberMapper membermapper;

	@Transactional
	public void changePassword(String memEmail, String oldPwd, String newPwd) {
		Member member = membermapper.selectMemberByEmail(memEmail);
		if (member == null) {
			throw new MemberNotFoundException();
		}
		member.changePassword(oldPwd, newPwd);
		membermapper.updateMember(member);
	}
}