package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Theater;

@Component
public interface TheaterMapper {
	List<Theater> selectTheaterByAll();
	Theater selectTheaterByNo(int thtNo);
	Theater selectTheaterByName(String thtName);
}
