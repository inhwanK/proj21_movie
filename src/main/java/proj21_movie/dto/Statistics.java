package proj21_movie.dto;

import java.time.LocalDateTime;

public class Statistics {
	private Object data;
	private LocalDateTime dateTime;

	public Statistics() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Statistics(Object data, LocalDateTime dateTime) {
		super();
		this.data = data;
		this.dateTime = dateTime;
	}
	
	public Object getData() {
		return data;
	}
	
	public void setData(Object data) {
		this.data = data;
	}
	
	public LocalDateTime getDateTime() {
		return dateTime;
	}
	
	public void setDateTime(LocalDateTime dateTime) {
		this.dateTime = dateTime;
	}

	@Override
	public String toString() {
		return "Statistics [data=" + data + ", dateTime=" + dateTime + "]";
	}

}
