package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TheaterController {
	
	@RequestMapping("/theaterlist")
	public String theater() {
		return "theater/theater_list";
	}
	
	@RequestMapping("/theaterlist/theaterDetail/{no}")
	public String theaterDetail() {
		return "theater/theater_detail";
	}
}
