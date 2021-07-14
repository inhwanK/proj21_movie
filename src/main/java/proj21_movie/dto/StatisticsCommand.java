package proj21_movie.dto;

public class StatisticsCommand {
	private int movNo;
	private String MovTitle;
	private int audience;
	
	public StatisticsCommand() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StatisticsCommand(int movNo, String movTitle, int audience) {
		super();
		this.movNo = movNo;
		MovTitle = movTitle;
		this.audience = audience;
	}

	public int getMovNo() {
		return movNo;
	}

	public void setMovNo(int movNo) {
		this.movNo = movNo;
	}

	public String getMovTitle() {
		return MovTitle;
	}

	public void setMovTitle(String movTitle) {
		MovTitle = movTitle;
	}

	public int getAudience() {
		return audience;
	}

	public void setAudience(int audience) {
		this.audience = audience;
	}

	@Override
	public String toString() {
		return "StatisticsCommand [movNo=" + movNo + ", MovTitle=" + MovTitle + ", audience=" + audience + "]";
	}
	
	
}
