package proj21_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommentController {
	
	@GetMapping("/updateComment")
	public String updateComment() {
		return "movie/updateComment";
	}
}
