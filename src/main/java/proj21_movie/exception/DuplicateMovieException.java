package proj21_movie.exception;

@SuppressWarnings("serial")
public class DuplicateMovieException extends RuntimeException {

	public DuplicateMovieException(String message) {
		super(message);
	}

}
