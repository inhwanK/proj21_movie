package proj21_movie.dto;

import java.time.LocalDate;

public class Member {
	private int memNo; // 회원번호
	private String memEmail; // 회원아이디(이메일)
	private String memPasswd; // 비밀번호
	private LocalDate memBirthdate; // 생년월일
	private String memName; // 이름
	private String memPhone; // 연락처
	
	public Member() {}

	public Member(int memNo) {
		this.memNo = memNo;
	}

	public Member(String memEmail, String memPasswd, LocalDate memBirthdate, String memName, String memPhone) {
		this.memEmail = memEmail;
		this.memPasswd = memPasswd;
		this.memBirthdate = memBirthdate;
		this.memName = memName;
		this.memPhone = memPhone;
	}

	public Member(int memNo, String memEmail, String memPasswd, LocalDate memBirthdate, String memName,
			String memPhone) {
		this.memNo = memNo;
		this.memEmail = memEmail;
		this.memPasswd = memPasswd;
		this.memBirthdate = memBirthdate;
		this.memName = memName;
		this.memPhone = memPhone;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
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
	
	public boolean matchPassword(String memPasswd) {
        return this.memPasswd.equals(memPasswd);
    }

	@Override
	public String toString() {
		return String.format("Member [memNo=%s, memEmail=%s, memPasswd=%s, memBirthdate=%s, memName=%s, memPhone=%s]",
				memNo, memEmail, memPasswd, memBirthdate, memName, memPhone);
	}

}
