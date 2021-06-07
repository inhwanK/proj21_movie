package proj21_movie.dto;

import java.time.LocalDateTime;

public class Reservation {
	private int resNo;				// 예매 번호
	private ShowInfo shwNo;			// 상영정보 번호
	private Member memNo;			// 회원 번호
	private int resPrice;			// 결제 금액
	private LocalDateTime resDate;	// 예매일
	private int resAdult;			// 인원(어른)
	private int resTeen;			// 인원(청소년)
	private int resPref;			// 인원(우대)

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public ShowInfo getShwNo() {
		return shwNo;
	}

	public void setShwNo(ShowInfo shwNo) {
		this.shwNo = shwNo;
	}

	public Member getMemNo() {
		return memNo;
	}

	public void setMemNo(Member memNo) {
		this.memNo = memNo;
	}

	public int getResPrice() {
		return resPrice;
	}

	public void setResPrice(int resPrice) {
		this.resPrice = resPrice;
	}

	public LocalDateTime getResDate() {
		return resDate;
	}

	public void setResDate(LocalDateTime resDate) {
		this.resDate = resDate;
	}

	public int getResAdult() {
		return resAdult;
	}

	public void setResAdult(int resAdult) {
		this.resAdult = resAdult;
	}

	public int getResTeen() {
		return resTeen;
	}

	public void setResTeen(int resTeen) {
		this.resTeen = resTeen;
	}

	public int getResPref() {
		return resPref;
	}

	public void setResPref(int resPref) {
		this.resPref = resPref;
	}

	@Override
	public String toString() {
		return String.format(
				"Reservation [resNo=%s, shwNo=%s, memNo=%s, resPrice=%s, resDate=%s, resAdult=%s, resTeen=%s, resPref=%s]",
				resNo, shwNo, memNo, resPrice, resDate, resAdult, resTeen, resPref);
	}

}
