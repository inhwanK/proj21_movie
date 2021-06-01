package proj21_movie.dto;

public class MoviePic {
	private int mpNo;		// 영화사진 번호
	private Movie movNo;	// 영화번호
	private byte[] mpPic;	// 스틸컷들

	public int getMpNo() {
		return mpNo;
	}

	public void setMpNo(int mpNo) {
		this.mpNo = mpNo;
	}

	public Movie getMovNo() {
		return movNo;
	}

	public void setMovNo(Movie movNo) {
		this.movNo = movNo;
	}

	public byte[] getMpPic() {
		return mpPic;
	}

	public void setMpPic(byte[] mpPic) {
		this.mpPic = mpPic;
	}

}
