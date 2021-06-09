package proj21_movie.dto;

public class Cinema {
	private int cinNo;			// 상영관 번호
	private int cinRow;			// 상영관 행
	private int cinCol;			// 상영관 열
	private int cinSeat;		// 상영관 좌석
	private String cinType;		// 상영관 타입
	private int cinAdultPrice;	// 어른요금
	private int cinTeenPrice;	// 청소년요금
	private int cinPrefPrice;	// 우대요금
	
	public Cinema() {
		
	}

	public Cinema(int cinNo) {
		this.cinNo = cinNo;
	}

	public int getCinNo() {
		return cinNo;
	}

	public void setCinNo(int cinNo) {
		this.cinNo = cinNo;
	}

	public int getCinRow() {
		return cinRow;
	}

	public void setCinRow(int cinRow) {
		this.cinRow = cinRow;
	}

	public int getCinCol() {
		return cinCol;
	}

	public void setCinCol(int cinCol) {
		this.cinCol = cinCol;
	}

	public int getCinSeat() {
		return cinSeat;
	}

	public void setCinSeat(int cinSeat) {
		this.cinSeat = cinSeat;
	}

	public String getCinType() {
		return cinType;
	}

	public void setCinType(String cinType) {
		this.cinType = cinType;
	}

	public int getCinAdultPrice() {
		return cinAdultPrice;
	}

	public void setCinAdultPrice(int cinAdultPrice) {
		this.cinAdultPrice = cinAdultPrice;
	}

	public int getCinTeenPrice() {
		return cinTeenPrice;
	}

	public void setCinTeenPrice(int cinTeenPrice) {
		this.cinTeenPrice = cinTeenPrice;
	}

	public int getCinPrefPrice() {
		return cinPrefPrice;
	}

	public void setCinPrefPrice(int cinPrefPrice) {
		this.cinPrefPrice = cinPrefPrice;
	}

	@Override
	public String toString() {
		return String.format(
				"Cinema [cinNo=%s, cinRow=%s, cinCol=%s, cinSeat=%s, cinType=%s, cinAdultPrice=%s, cinTeenPrice=%s, cinPrefPrice=%s]",
				cinNo, cinRow, cinCol, cinSeat, cinType, cinAdultPrice, cinTeenPrice, cinPrefPrice);
	}

	
}
