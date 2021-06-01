package proj21_movie.dto;

import java.time.LocalDateTime;

public class Reservation {
	private int resNo;				// 예매 번호
	private ShowInfo shwNo;			// 상영정보 번호
	private Member memNo;			// 회원 번호
	private NoMember nomNo;			// 비회원 번호
	private int resPrice;			// 결제 금액
	private int resUsepoint;		// 사용포인트
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

	public NoMember getNomNo() {
		return nomNo;
	}

	public void setNomNo(NoMember nomNo) {
		this.nomNo = nomNo;
	}

	public int getResPrice() {
		return resPrice;
	}

	public void setResPrice(int resPrice) {
		this.resPrice = resPrice;
	}

	public int getResUsepoint() {
		return resUsepoint;
	}

	public void setResUsepoint(int resUsepoint) {
		this.resUsepoint = resUsepoint;
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

}
