package proj21_movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_movie.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/notice/{notNo}")
	public String noticeNo (@PathVariable("notNo") int notNo, HttpServletRequest request) {
		request.setAttribute("notNo", notNo); //request 객체 받아야함.
		return "notice/noticeDetail";
	}
}
