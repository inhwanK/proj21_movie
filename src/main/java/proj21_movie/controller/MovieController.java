package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MovieController {
	
	@GetMapping("/movielist")
	public String movieList() {
		return "movie/boxOffice";
	}
	
	@GetMapping("/movie")
	public ModelAndView movie(@RequestParam(value = "movNo") int movNo) {
		ModelAndView mav = new ModelAndView("movie/movieDetail", "movNo", movNo);
		return mav;
	}
}
