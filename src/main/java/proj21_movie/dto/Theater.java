package proj21_movie.dto;

public class Theater {
	private int thtNo;			// 극장번호
	private String thtName;		// 극장명
	private String thtAddress;	// 주소
	private double thtLat;		// 위도
	private double thtLong;		// 경도
	private String thtSubs;		// 부대시설(이미지 이름)
	private String thtDetail;	// 극장설명
	
	public Theater() {
		
	}

	public Theater(int thtNo) {
		this.thtNo = thtNo;
	}

	public int getThtNo() {
		return thtNo;
	}

	public void setThtNo(int thtNo) {
		this.thtNo = thtNo;
	}

	public String getThtName() {
		return thtName;
	}

	public void setThtName(String thtName) {
		this.thtName = thtName;
	}

	public String getThtAddress() {
		return thtAddress;
	}

	public void setThtAddress(String thtAddress) {
		this.thtAddress = thtAddress;
	}

	public double getThtLat() {
		return thtLat;
	}

	public void setThtLat(double thtLat) {
		this.thtLat = thtLat;
	}

	public double getThtLong() {
		return thtLong;
	}

	public void setThtLong(double thtLong) {
		this.thtLong = thtLong;
	}

	public String getThtSubs() {
		return thtSubs;
	}

	public void setThtSubs(String thtSubs) {
		this.thtSubs = thtSubs;
	}

	public String getThtDetail() {
		return thtDetail;
	}

	public void setThtDetail(String thtDetail) {
		this.thtDetail = thtDetail;
	}

	@Override
	public String toString() {
		return String.format(
				"Theater [thtNo=%s, thtName=%s, thtAddress=%s, thtLat=%s, thtLong=%s, thtSubs=%s, thtDetail=%s]", thtNo,
				thtName, thtAddress, thtLat, thtLong, thtSubs, thtDetail);
	}

}
