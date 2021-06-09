package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Theater;

@Service
public interface TheaterService {
	List<Theater> getLists();
	Theater getTheater(int thtNo);
	Theater getTheaterName(String thtName);
}
