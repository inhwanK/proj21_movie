package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Movie;

@Component
public interface MovieMapper {
	List<Movie> selectMovieAll();
	Movie selectMovieByNo(Movie movie);
	
	int insertMovie(Movie movie);
	int updateMovie(Movie movie);
	int deleteMovie(Movie movie);
}
