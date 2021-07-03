package proj21_movie.service;

import org.springframework.stereotype.Service;

@Service
public interface MailService {
	boolean send(String subject, String text, String from, String to);
	
}
