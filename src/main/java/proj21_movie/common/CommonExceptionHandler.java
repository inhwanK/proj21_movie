package proj21_movie.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice("proj21_movie")
public class CommonExceptionHandler {
	
	
	// 예외 메세지를 볼 수 없어서 디버깅 할 때 불편함.
	// 예외발생할 때만 주석처리 후 다시 실행해서 디버깅.
	@ExceptionHandler(RuntimeException.class)
    public String handleRuntimeException() {
        return "error/commonException";
    }
}
