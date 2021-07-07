package proj21_movie.dto;

public class AuthInfo {
	// 회원 정보 세션 유지
	private String memEmail; // 회원아이디(이메일)
	private String memName; // 이름

	public AuthInfo(String memEmail, String memName) {
		this.memEmail = memEmail;
		this.memName = memName;
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

	@Override
	public String toString() {
		return String.format("AuthInfo [memEmail=%s, memName=%s]", memEmail, memName);
	}

}
