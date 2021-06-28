package proj21_movie.dto;

import java.time.LocalDateTime;

public class Reserving {
	private int ingNo; // 기본번호
	private int memNo; // 회원번호
	private int shwNo; // 상영정보번호
	private int ingPrice; // 결제금액
	private LocalDateTime ingDate; // 결제일
	private String ingSeat; // 선택좌석
	private int ingAdult; // 인원(어른)
	private int ingTeen; // 인원(청소년)
	private int ingPref; // 인원(우대)

	public Reserving() {
	}

	public int getIngNo() {
		return ingNo;
	}

	public void setIngNo(int ingNo) {
		this.ingNo = ingNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getShwNo() {
		return shwNo;
	}

	public void setShwNo(int shwNo) {
		this.shwNo = shwNo;
	}

	public int getIngPrice() {
		return ingPrice;
	}

	public void setIngPrice(int ingPrice) {
		this.ingPrice = ingPrice;
	}

	public LocalDateTime getIngDate() {
		return ingDate;
	}

	public void setIngDate(LocalDateTime ingDate) {
		this.ingDate = ingDate;
	}

	public String getIngSeat() {
		return ingSeat;
	}

	public void setIngSeat(String ingSeat) {
		this.ingSeat = ingSeat;
	}

	public int getIngAdult() {
		return ingAdult;
	}

	public void setIngAdult(int ingAdult) {
		this.ingAdult = ingAdult;
	}

	public int getIngTeen() {
		return ingTeen;
	}

	public void setIngTeen(int ingTeen) {
		this.ingTeen = ingTeen;
	}

	public int getIngPref() {
		return ingPref;
	}

	public void setIngPref(int ingPref) {
		this.ingPref = ingPref;
	}

	@Override
	public String toString() {
		return String.format(
				"Reserving [ingNo=%s, memNo=%s, shwNo=%s, ingPrice=%s, ingDate=%s, ingSeat=%s, ingAdult=%s, ingTeen=%s, ingPref=%s]",
				ingNo, memNo, shwNo, ingPrice, ingDate, ingSeat, ingAdult, ingTeen, ingPref);
	}

}
