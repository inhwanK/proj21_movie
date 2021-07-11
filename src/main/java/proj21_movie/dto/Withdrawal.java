package proj21_movie.dto;

public class Withdrawal {
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

	@Override
	public String toString() {
		return String.format("Withdrawal [memPasswd=%s, confmemPasswd=%s]", memPasswd, confmemPasswd);
	}

}
