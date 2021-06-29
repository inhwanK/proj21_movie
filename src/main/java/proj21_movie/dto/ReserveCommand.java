package proj21_movie.dto;

import java.util.List;

public class ReserveCommand {
	private int memNo;
	private int shwNo;
	private int reservingNo;
	private int price;
	private int cntAdult;
	private int cntTeen;
	private int cntPref;
	private List<Integer> row;
	private List<Integer> col;

	public ReserveCommand() {
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

	public int getReservingNo() {
		return reservingNo;
	}

	public void setReservingNo(int reservingNo) {
		this.reservingNo = reservingNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCntAdult() {
		return cntAdult;
	}

	public void setCntAdult(int cntAdult) {
		this.cntAdult = cntAdult;
	}

	public int getCntTeen() {
		return cntTeen;
	}

	public void setCntTeen(int cntTeen) {
		this.cntTeen = cntTeen;
	}

	public int getCntPref() {
		return cntPref;
	}

	public void setCntPref(int cntPref) {
		this.cntPref = cntPref;
	}

	public List<Integer> getRow() {
		return row;
	}

	public void setRow(List<Integer> row) {
		this.row = row;
	}

	public List<Integer> getCol() {
		return col;
	}

	public void setCol(List<Integer> col) {
		this.col = col;
	}

	@Override
	public String toString() {
		return String.format(
				"ReserveCommand [memNo=%s, shwNo=%s, reservingNo=%s, price=%s, cntAdult=%s, cntTeen=%s, cntPref=%s, row=%s, col=%s]",
				memNo, shwNo, reservingNo, price, cntAdult, cntTeen, cntPref, row, col);
	}

}
