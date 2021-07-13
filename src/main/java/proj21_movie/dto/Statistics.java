package proj21_movie.dto;

public class Statistics {
	private Object data;
	private String date;
	private int audience;
	
	
	public Statistics() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Statistics(Object data, String date, int audience) {
		super();
		this.data = data;
		this.date = date;
		this.audience = audience;
	}

	public int getAudience() {
		return audience;
	}


	public void setAudience(int audience) {
		this.audience = audience;
	}
	
	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Statistics [data=" + data + ", date=" + date + "]";
	}
	
}
