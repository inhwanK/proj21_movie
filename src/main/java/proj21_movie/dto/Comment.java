package proj21_movie.dto;

import java.time.LocalDateTime;

public class Comment {
	private Movie movNo;			// 영화번호
	private String comUser;			// 작성자명
	private String comContent;		// 댓글내용
	private int comStar;			// 별점
	private LocalDateTime comDate;	// 작성일

	public Movie getMovNo() {
		return movNo;
	}

	public void setMovNo(Movie movNo) {
		this.movNo = movNo;
	}

	public String getComUser() {
		return comUser;
	}

	public void setComUser(String comUser) {
		this.comUser = comUser;
	}

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public int getComStar() {
		return comStar;
	}

	public void setComStar(int comStar) {
		this.comStar = comStar;
	}

	public LocalDateTime getComDate() {
		return comDate;
	}

	public void setComDate(LocalDateTime comDate) {
		this.comDate = comDate;
	}

	@Override
	public String toString() {
		return String.format("Comment [movNo=%s, comUser=%s, comContent=%s, comStar=%s, comDate=%s]", movNo, comUser,
				comContent, comStar, comDate);
	}

	
}
