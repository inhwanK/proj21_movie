package proj21_movie.dto;

import java.time.LocalDateTime;

public class Notice {
	private int notNo;				// 공지번호
	private String notTitle;		// 제목
	private String notDetail;		// 내용
	private LocalDateTime notDate;	// 등록일
	private String notFile;			// 첨부파일
	
	public int getNotNo() {
		return notNo;
	}

	public void setNotNo(int notNo) {
		this.notNo = notNo;
	}

	public String getNotTitle() {
		return notTitle;
	}

	public void setNotTitle(String notTitle) {
		this.notTitle = notTitle;
	}

	public String getNotDetail() {
		return notDetail;
	}

	public void setNotDetail(String notDetail) {
		this.notDetail = notDetail;
	}

	public LocalDateTime getNotDate() {
		return notDate;
	}

	public void setNotDate(LocalDateTime notDate) {
		this.notDate = notDate;
	}

	public String getNotFile() {
		return notFile;
	}

	public void setNotFile(String notFile) {
		this.notFile = notFile;
	}

	@Override
	public String toString() {
		return String.format("Notice [notNo=%s, notTitle=%s, notDetail=%s, notDate=%s, notFile=%s]", notNo, notTitle,
				notDetail, notDate, notFile);
	}

}
