package proj21_movie.dto;

public class Withdrawal {
	private String memEmail; // 회원아이디(이메일)
	private String memPasswd; // 비밀번호
	private String confmemPasswd; // 비밀번호 확인

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

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	
	public void setMemEmail(String memEmail, String memPasswd, String confmemPasswd) {
		this.memEmail = memEmail;
	}

	@Override
	public String toString() {
		return String.format("Withdrawal [memPasswd=%s, confmemPasswd=%s, memEmail=%s]", memPasswd, confmemPasswd, memEmail);
	}

}
