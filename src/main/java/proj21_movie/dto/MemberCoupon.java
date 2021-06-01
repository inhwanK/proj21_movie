package proj21_movie.dto;

import java.time.LocalDateTime;

public class MemberCoupon {
	private int mcNo;					// 회원보유쿠폰 번호
	private Member memNo;				// 회원 번호
	private Coupon couNo;				// 쿠폰 번호
	private LocalDateTime mcGetdate;	// 쿠폰 획득일
	private LocalDateTime mcExpdate;	// 쿠폰 만료일

	public int getMcNo() {
		return mcNo;
	}

	public void setMcNo(int mcNo) {
		this.mcNo = mcNo;
	}

	public Member getMemNo() {
		return memNo;
	}

	public void setMemNo(Member memNo) {
		this.memNo = memNo;
	}

	public Coupon getCouNo() {
		return couNo;
	}

	public void setCouNo(Coupon couNo) {
		this.couNo = couNo;
	}

	public LocalDateTime getMcGetdate() {
		return mcGetdate;
	}

	public void setMcGetdate(LocalDateTime mcGetdate) {
		this.mcGetdate = mcGetdate;
	}

	public LocalDateTime getMcExpdate() {
		return mcExpdate;
	}

	public void setMcExpdate(LocalDateTime mcExpdate) {
		this.mcExpdate = mcExpdate;
	}

}
