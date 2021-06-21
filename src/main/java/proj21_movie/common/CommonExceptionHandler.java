package proj21_movie.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice("proj21_movie")
public class CommonExceptionHandler {
	
	@ExceptionHandler(RuntimeException.class)
    public String handleRuntimeException() {
        return "error/commonException";
    }
}
