package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Cinema;

@Component
public interface CinemaMapper {
	List<Cinema> selectCinemaByAll();
	Cinema selectCinemaByNo(Cinema cinema);
}
