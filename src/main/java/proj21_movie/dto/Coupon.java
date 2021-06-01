package proj21_movie.dto;

public class Coupon {
	private int couNo;			// 쿠폰번호
	private String couName;		// 쿠폰이름
	private String couDetail;	// 쿠폰내용
	private double couDc;		// 할인율
	private int couExpire;		// 유효기간(일)

	public int getCouNo() {
		return couNo;
	}

	public void setCouNo(int couNo) {
		this.couNo = couNo;
	}

	public String getCouName() {
		return couName;
	}

	public void setCouName(String couName) {
		this.couName = couName;
	}

	public String getCouDetail() {
		return couDetail;
	}

	public void setCouDetail(String couDetail) {
		this.couDetail = couDetail;
	}

	public double getCouDc() {
		return couDc;
	}

	public void setCouDc(double couDc) {
		this.couDc = couDc;
	}

	public int getCouExpire() {
		return couExpire;
	}

	public void setCouExpire(int couExpire) {
		this.couExpire = couExpire;
	}

}
