package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Cinema;

@Service
public interface CinemaService {
	List<Cinema> getLists();
	Cinema getCinema(Cinema cinema);
}
