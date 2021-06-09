package proj21_movie.dto;

public class AttachImage {
	private String uploadPath;
	private String uuid;
	private String fileName;
	private int movieNo;

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	@Override
	public String toString() {
		return String.format("AttachImage [uploadPath=%s, uuid=%s, fileName=%s, movieNo=%s]", uploadPath, uuid,
				fileName, movieNo);
	}

}
