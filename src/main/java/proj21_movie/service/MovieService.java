package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Movie;

@Service
public interface MovieService {
	List<Movie> getLists();
	Movie getMovie(Movie movie);
	int registerMovie(Movie movie);
	int modifyMovie(Movie movie);
	int removeMovie(Movie movie);
}
