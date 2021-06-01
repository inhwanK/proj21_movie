package proj21_movie.dto;

public class Seat {
	private int seatNo;			// 좌석 기본 번호
	private Reservation resNo;	// 예매 번호
	private ShowInfo shwNo;		// 상영정보 번호
	private int seatRowNo;		// 행 번호
	private int seatColNo;		// 열 번호

	public int getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}

	public Reservation getResNo() {
		return resNo;
	}

	public void setResNo(Reservation resNo) {
		this.resNo = resNo;
	}

	public ShowInfo getShwNo() {
		return shwNo;
	}

	public void setShwNo(ShowInfo shwNo) {
		this.shwNo = shwNo;
	}

	public int getSeatRowNo() {
		return seatRowNo;
	}

	public void setSeatRowNo(int seatRowNo) {
		this.seatRowNo = seatRowNo;
	}

	public int getSeatColNo() {
		return seatColNo;
	}

	public void setSeatColNo(int seatColNo) {
		this.seatColNo = seatColNo;
	}

}
