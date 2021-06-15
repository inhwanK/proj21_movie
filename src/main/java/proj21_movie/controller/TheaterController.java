package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TheaterController {
	
	@GetMapping("/theaterlist")
	public String theaterList() {
		return "theater/theater_list";
	}
	
	@GetMapping("/theater")
	public ModelAndView theater(@RequestParam(value = "thtNo") int thtNo) {
		ModelAndView mav = new ModelAndView("theater/theater_detail", "thtNo", thtNo);
		return mav;
	}
}
