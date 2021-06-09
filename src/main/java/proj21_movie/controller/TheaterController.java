package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TheaterController {
	
	@RequestMapping("/theater")
	public String theater() {
		return "theater/theater_list";
	}
	
	@RequestMapping("/theater/theaterDetail/{no}")
	public String theaterDetail() {
		return "theater/theater_detail";
	}
}
