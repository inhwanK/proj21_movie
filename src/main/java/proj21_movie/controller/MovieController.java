package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieController {
	
	@RequestMapping("/movielist")
	public String theater() {
		return "movie/box_office";
	}
	
	@RequestMapping("/movielist/movieDetail/{no}")
	public String theaterDetail() {
		return "movie/movie_detail";
	}
}
