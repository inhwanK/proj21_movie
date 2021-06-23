package proj21_movie.mapper;

import java.util.Map;
import org.springframework.stereotype.Component;
import proj21_movie.dto.RegisterRequest;

@Component
public interface LoginMapper {
	RegisterRequest login(String memEmail, String memPasswd);

	Object login(Map<String, String> loginMap);
}