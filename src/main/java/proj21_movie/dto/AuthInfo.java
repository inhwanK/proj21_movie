package proj21_movie.dto;

import java.time.LocalDate;

public class AuthInfo {
	// 회원 정보 세션 유지
	private String memEmail; // 회원아이디(이메일)
	private String memName; // 이름
	private String memPasswd; // 비밀번호
	private LocalDate memBirthdate; // 생년월일
	private String memPhone; // 연락처

	public AuthInfo(String memEmail, String memName, String memPasswd, LocalDate memBirthdate, String memPhone) {
		this.memEmail = memEmail;
		this.memName = memName;
		this.memPasswd = memPasswd;
		this.memBirthdate = memBirthdate;
		this.memPhone = memPhone;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPasswd() {
		return memPasswd;
	}

	public void setMemPasswd(String memPasswd) {
		this.memPasswd = memPasswd;
	}

	public LocalDate getMemBirthdate() {
		return memBirthdate;
	}

	public void setMemBirthdate(LocalDate memBirthdate) {
		this.memBirthdate = memBirthdate;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	@Override
	public String toString() {
		return String.format("AuthInfo [memEmail=%s, memName=%s, memPasswd=%s, memBirthdate=%s, memPhone=%s]", 
				memEmail, memName, memPasswd, memBirthdate, memPhone);
	}

}
