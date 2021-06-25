package proj21_movie.dto;

public class LoginCommand {
	private String memEmail;
	private String memPasswd;
	private boolean rememEmail;

	public LoginCommand() {}

	public LoginCommand(String memEmail, String memPasswd, boolean rememEmail) {
		this.memEmail = memEmail;
		this.memPasswd = memPasswd;
		this.rememEmail = rememEmail;
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

	public boolean isRememEmail() {
		return rememEmail;
	}

	public void setRememEmail(boolean rememEmail) {
		this.rememEmail = rememEmail;
	}

	@Override
	public String toString() {
		return String.format("LoginCommand [memEmail=%s, memPasswd=%s, rememEmail=%s]", memEmail, memPasswd, rememEmail);
	}

	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}

}
