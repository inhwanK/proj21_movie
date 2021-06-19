package proj21_movie.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import proj21_movie.dto.LoginCommand;

@Service
public interface LoginService {
	LoginCommand loginCheck(String memEmail, String memPasswd);

}
