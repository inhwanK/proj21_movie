package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReserveController {
	
	@RequestMapping("/reserve")
	public String theater() {
		return "reserve/reserve";
	}
}
