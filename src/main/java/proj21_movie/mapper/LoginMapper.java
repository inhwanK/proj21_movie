package proj21_movie.mapper;

import org.springframework.stereotype.Component;

import proj21_movie.dto.RegisterRequest;

@Component
public interface LoginMapper {
	RegisterRequest regireqt(String memEmail, String memPasswd);
}
