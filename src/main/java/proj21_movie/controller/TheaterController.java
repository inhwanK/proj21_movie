package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TheaterController {
	
	@GetMapping("/theaterlist")
	public String theaterList() {
		return "theater/theaterList";
	}
	
	@GetMapping("/timetable")
	public String timetable() {
		return "theater/timetable";
	}
	
	@GetMapping("/theater")
	public ModelAndView theater(@RequestParam(value = "thtNo") int thtNo) {
		ModelAndView mav = new ModelAndView("theater/theaterDetail", "thtNo", thtNo);
		return mav;
	}
}
