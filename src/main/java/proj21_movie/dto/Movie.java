package proj21_movie.dto;

import java.time.LocalDate;

public class Movie {
	private int movNo;				// 영화번호
	private String movTitle;		// 제목
	private int movGrade;			// 등급
	private String movGenre;		// 장르
	private int movRuntime;			// 런타임(분)
	private String movDirector;		// 감독명
	private String movActor;		// 배우명
	private String movDetail;		// 주요정보(내용, 줄거리)
	private LocalDate movOpendate;	// 개봉일
	private LocalDate movEnddate;	// 종료일
	private double movAvgstar;		// 평균 별점
	private String movPoster;		// 메인 포스터
	
	public Movie() {
	}
	
	public Movie(int movNo) {
		this.movNo = movNo;
	}
	
	public Movie(String movTitle, int movGrade, String movGenre, int movRuntime, String movDirector, String movActor,
			String movDetail, LocalDate movOpendate, LocalDate movEnddate, double movAvgstar, String movPoster) {
		this.movTitle = movTitle;
		this.movGrade = movGrade;
		this.movGenre = movGenre;
		this.movRuntime = movRuntime;
		this.movDirector = movDirector;
		this.movActor = movActor;
		this.movDetail = movDetail;
		this.movOpendate = movOpendate;
		this.movEnddate = movEnddate;
		this.movAvgstar = movAvgstar;
		this.movPoster = movPoster;
	}

	public Movie(int movNo, String movTitle, int movGrade, String movGenre, int movRuntime, String movDirector,
			String movActor, String movDetail, LocalDate movOpendate, LocalDate movEnddate, double movAvgstar,
			String movPoster) {
		this.movNo = movNo;
		this.movTitle = movTitle;
		this.movGrade = movGrade;
		this.movGenre = movGenre;
		this.movRuntime = movRuntime;
		this.movDirector = movDirector;
		this.movActor = movActor;
		this.movDetail = movDetail;
		this.movOpendate = movOpendate;
		this.movEnddate = movEnddate;
		this.movAvgstar = movAvgstar;
		this.movPoster = movPoster;
	}

	public int getMovNo() {
		return movNo;
	}

	public void setMovNo(int movNo) {
		this.movNo = movNo;
	}

	public String getMovTitle() {
		return movTitle;
	}

	public void setMovTitle(String movTitle) {
		this.movTitle = movTitle;
	}

	public int getMovGrade() {
		return movGrade;
	}

	public void setMovGrade(int movGrade) {
		this.movGrade = movGrade;
	}

	public String getMovGenre() {
		return movGenre;
	}

	public void setMovGenre(String movGenre) {
		this.movGenre = movGenre;
	}

	public int getMovRuntime() {
		return movRuntime;
	}

	public void setMovRuntime(int movRuntime) {
		this.movRuntime = movRuntime;
	}

	public String getMovDirector() {
		return movDirector;
	}

	public void setMovDirector(String movDirector) {
		this.movDirector = movDirector;
	}

	public String getMovActor() {
		return movActor;
	}

	public void setMovActor(String movActor) {
		this.movActor = movActor;
	}

	public String getMovDetail() {
		return movDetail;
	}

	public void setMovDetail(String movDetail) {
		this.movDetail = movDetail;
	}

	public LocalDate getMovOpendate() {
		return movOpendate;
	}

	public void setMovOpendate(LocalDate movOpendate) {
		this.movOpendate = movOpendate;
	}

	public LocalDate getMovEnddate() {
		return movEnddate;
	}

	public void setMovEnddate(LocalDate movEnddate) {
		this.movEnddate = movEnddate;
	}

	public double getMovAvgstar() {
		return movAvgstar;
	}

	public void setMovAvgstar(double movAvgstar) {
		this.movAvgstar = movAvgstar;
	}

	public String getMovPoster() {
		return movPoster;
	}

	public void setMovPoster(String movPoster) {
		this.movPoster = movPoster;
	}

	@Override
	public String toString() {
		return String.format(
				"Movie [movNo=%s, movTitle=%s, movGrade=%s, movGenre=%s, movRuntime=%s, movDirector=%s, movActor=%s, movDetail=%s, movOpendate=%s, movEnddate=%s, movAvgstar=%s, movPoster=%s]",
				movNo, movTitle, movGrade, movGenre, movRuntime, movDirector, movActor, movDetail, movOpendate,
				movEnddate, movAvgstar, movPoster);
	}

}
