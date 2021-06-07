package proj21_movie.dto;

public class Admin {
	private int admNo;			// 관리자번호
	private String admId;		// 아이디
	private String admPasswd;	// 비밀번호

	public int getAdmNo() {
		return admNo;
	}

	public void setAdmNo(int admNo) {
		this.admNo = admNo;
	}

	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

	public String getAdmPasswd() {
		return admPasswd;
	}

	public void setAdmPasswd(String admPasswd) {
		this.admPasswd = admPasswd;
	}

	@Override
	public String toString() {
		return String.format("Admin [admNo=%s, admId=%s, admPasswd=%s]", admNo, admId, admPasswd);
	}
	
}
