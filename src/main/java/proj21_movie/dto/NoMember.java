package proj21_movie.dto;

import java.time.LocalDate;

public class NoMember {
	private int nomNo;					// 비회원번호
	private String nomPhone;			// 연락처
	private String nomPasswd;			// 비밀번호
	private String nomName;				// 이름
	private LocalDate nomBirthdate;		// 생년월일

	public int getNomNo() {
		return nomNo;
	}

	public void setNomNo(int nomNo) {
		this.nomNo = nomNo;
	}

	public String getNomPhone() {
		return nomPhone;
	}

	public void setNomPhone(String nomPhone) {
		this.nomPhone = nomPhone;
	}

	public String getNomPasswd() {
		return nomPasswd;
	}

	public void setNomPasswd(String nomPasswd) {
		this.nomPasswd = nomPasswd;
	}

	public String getNomName() {
		return nomName;
	}

	public void setNomName(String nomName) {
		this.nomName = nomName;
	}

	public LocalDate getNomBirthdate() {
		return nomBirthdate;
	}

	public void setNomBirthdate(LocalDate nomBirthdate) {
		this.nomBirthdate = nomBirthdate;
	}

}
