package proj21_movie.dto;

import java.time.LocalDate;

public class RegisterRequest {
	private String memEmail; // 회원아이디(이메일)
	private String memPasswd; // 비밀번호
	private String confmemPasswd; // 비밀번호 확인
	private LocalDate memBirthdate; // 생년월일
	private String memName; // 이름
	private String memPhone; // 연락처
	
	public boolean isPasswordEqualToConfirmPassword() {
		return memPasswd.equals(confmemPasswd);
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemPasswd() {
		return memPasswd;
	}

	public void setMemPasswd(String memPasswd) {
		this.memPasswd = memPasswd;
	}

	public String getConfmemPasswd() {
		return confmemPasswd;
	}

	public void setConfmemPasswd(String confmemPasswd) {
		this.confmemPasswd = confmemPasswd;
	}

	public LocalDate getMemBirthdate() {
		return memBirthdate;
	}

	public void setMemBirthdate(LocalDate memBirthdate) {
		this.memBirthdate = memBirthdate;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	@Override
	public String toString() {
		return String.format("RegisterRequest [memEmail=%s, memPasswd=%s, confmemPasswd=%s, memBirthdate=%s, memName=%s, memPhone=%s]", 
				memEmail, memPasswd, confmemPasswd, memBirthdate, memName, memPhone);
	}
	
	
}