package proj21_movie.service;

import org.springframework.stereotype.Service;
import proj21_movie.dto.AuthInfo;

@Service
public interface AuthService {
	AuthInfo authenicate(String memEmail, String memName);
}
