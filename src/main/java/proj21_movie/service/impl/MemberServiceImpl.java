package proj21_movie.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

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

	// 아이디 중복확인
	@Override
	public int idCheck(String memEmail) throws Exception {
		log.debug("service - idCheck() > " + memEmail);
		return mapper.idCheck(memEmail);
	}

	// 아이디찾기
	@Override
	public Member findId(Member member) {
		log.debug("service - findId() > " + member);
		return mapper.findId(member);
	}

	// 비밀번호 찾기
	@Override
	public String selectMember(Member member) {
		log.debug("service - selectMember() > " + member);
		return mapper.selectMember(member);
	}

	// 비밀번호 변경
	@Override
	public int pwUpdate_M(Member member) {
		log.debug("service - pwUpdate_M() > " + member);
		return mapper.pwUpdate_M(member);
	}

	// 패스워드 체크
	@Override
	public Member readMemberWithIDPW(String memEmail, String memPasswd) throws Exception {
		System.out.println("S : 컨트롤러에서 호출받으면 필요한 정보를 받아서 DAO로 전달");
		Member member = null;
		try {
			member = mapper.readMemberWithIDPW(member.getMemEmail(), member.getMemPasswd());
		} catch (Exception e) {
			e.printStackTrace();
			member = null; // 실행하다 문제가 생겼을때 해당 데이터를 보내지않겠다는 의미 = 예외처리
		}
		return member; // null이 반환되면 앞의 코드가 문제가 있다는 것을 바로 알수있다.
	}

	// 회원 탈퇴
	@Override
	public void withdrawal(Member member) throws Exception {
		try {
			mapper.withdrawal(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}