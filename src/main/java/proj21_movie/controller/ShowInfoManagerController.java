package proj21_movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_movie.service.MovieService;
import proj21_movie.service.TheaterService;

@Controller
public class ShowInfoManagerController {
	
	@Autowired
	private MovieService movService;
	
	@Autowired
	private TheaterService thtService;
	
	@RequestMapping("/showInfoManager")
	public String showInfoList() {
		return "manager/showInfoList";
	}
	
	@RequestMapping("/registShowInfo")
	public String registShowInfo(Model model) {
		model.addAttribute("getMovieList", movService.getLists());
		model.addAttribute("getTheaterList", thtService.getLists());
		return "manager/registShowInfo";
	}
}
