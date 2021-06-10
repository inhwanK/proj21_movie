package proj21_movie.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.Movie;
import proj21_movie.mapper.MovieMapper;
import proj21_movie.service.MovieService;

@Service
public class MovieServiceImpl implements MovieService {
	static final Log log= LogFactory.getLog(MovieServiceImpl.class);
	
	@Autowired
	private MovieMapper mapper;

	@Override
	public List<Movie> getLists() {
		List<Movie> list = mapper.selectMovieAll();
		log.debug("service - getLists() > " + list.size());
		return list;
	}

	@Override
	public Movie getMovie(Movie movie) {
		log.debug("service - getMovie() > " + movie);
		return mapper.selectMovieByNo(movie);
	}

	@Override
	public int registerMovie(Movie movie) {
		log.debug("service - registerMovie() > " + movie);
		return mapper.insertMovie(movie);
	}

	@Override
	public int modifyMovie(Movie movie) {
		log.debug("service - modifyMovie() > " + movie);
		return mapper.updateMovie(movie);
	}

	@Override
	public int removeMovie(Movie movie) {
		log.debug("service - removeMovie() > " + movie);
		return mapper.deleteMovie(movie);
	}
	
	
}
