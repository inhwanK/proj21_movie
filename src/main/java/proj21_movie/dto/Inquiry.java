package proj21_movie.dto;

import java.time.LocalDateTime;

public class Inquiry {
	private int inqNo; // 문의번호
	private String inqTitle; // 문의제목
	private String inqUser; // 작성자
	private String inqDetail; // 문의내용
	private LocalDateTime inqDate; // 문의일
	private String inqFile; // 첨부파일
	private String inqAnswer; // 답변내용
	private LocalDateTime inqAnsDate; // 답변일
	private boolean inqStatus; // 답변상태

	public int getInqNo() {
		return inqNo;
	}

	public void setInqNo(int inqNo) {
		this.inqNo = inqNo;
	}

	public String getInqTitle() {
		return inqTitle;
	}

	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}

	public String getInqUser() {
		return inqUser;
	}

	public void setInqUser(String inqUser) {
		this.inqUser = inqUser;
	}

	public String getInqDetail() {
		return inqDetail;
	}

	public void setInqDetail(String inqDetail) {
		this.inqDetail = inqDetail;
	}

	public LocalDateTime getInqDate() {
		return inqDate;
	}

	public void setInqDate(LocalDateTime inqDate) {
		this.inqDate = inqDate;
	}

	public String getInqFile() {
		return inqFile;
	}

	public void setInqFile(String inqFile) {
		this.inqFile = inqFile;
	}

	public String getInqAnswer() {
		return inqAnswer;
	}

	public void setInqAnswer(String inqAnswer) {
		this.inqAnswer = inqAnswer;
	}

	public LocalDateTime getInqAnsDate() {
		return inqAnsDate;
	}

	public void setInqAnsDate(LocalDateTime inqAnsDate) {
		this.inqAnsDate = inqAnsDate;
	}

	public boolean isInqStatus() {
		return inqStatus;
	}

	public void setInqStatus(boolean inqStatus) {
		this.inqStatus = inqStatus;
	}

}
