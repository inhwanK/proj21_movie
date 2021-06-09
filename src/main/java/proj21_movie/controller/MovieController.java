package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieController {
	
	@RequestMapping("/movie")
	public String theater() {
		return "movie/box_office";
	}
	
	@RequestMapping("/movie/movieDetail/{no}")
	public String theaterDetail() {
		return "movie/movie_detail";
	}
}
