package proj21_movie.mapper;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import proj21_movie.dto.LoginCommand;

@Component
public interface LoginMapper {
	boolean loginCheck(LoginCommand loginCommand, HttpSession session);

	LoginCommand loginCheck(String memEmail, String memPasswd);
}
