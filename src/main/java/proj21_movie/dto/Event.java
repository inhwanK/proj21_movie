package proj21_movie.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Event {
	private int evNo;				// 이벤트 번호
	private String evPasswd;		// 비밀번호
	private String evTitle;			// 제목
	private String evDetail;		// 내용
	private LocalDate evStartdate;	// 시작일
	private LocalDate evEnddate;	// 종료일
	private LocalDateTime evDate;	// 등록일
	private char[] evFile;			// 첨부파일
	
	public int getEvNo() {
		return evNo;
	}

	public void setEvNo(int evNo) {
		this.evNo = evNo;
	}

	public String getEvPasswd() {
		return evPasswd;
	}

	public void setEvPasswd(String evPasswd) {
		this.evPasswd = evPasswd;
	}

	public String getEvTitle() {
		return evTitle;
	}

	public void setEvTitle(String evTitle) {
		this.evTitle = evTitle;
	}

	public String getEvDetail() {
		return evDetail;
	}

	public void setEvDetail(String evDetail) {
		this.evDetail = evDetail;
	}

	public LocalDate getEvStartdate() {
		return evStartdate;
	}

	public void setEvStartdate(LocalDate evStartdate) {
		this.evStartdate = evStartdate;
	}

	public LocalDate getEvEnddate() {
		return evEnddate;
	}

	public void setEvEnddate(LocalDate evEnddate) {
		this.evEnddate = evEnddate;
	}

	public LocalDateTime getEvDate() {
		return evDate;
	}

	public void setEvDate(LocalDateTime evDate) {
		this.evDate = evDate;
	}

	public char[] getEvFile() {
		return evFile;
	}

	public void setEvFile(char[] evFile) {
		this.evFile = evFile;
	}

}
